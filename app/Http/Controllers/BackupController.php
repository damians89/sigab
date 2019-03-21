<?php
namespace App\Http\Controllers;
use Alert;
use App\Http\Requests;
use Artisan;
use Log;
use Storage;
use Auth;
use Carbon\Carbon;
use View;
use TCG\Voyager\Facades\Voyager;
use App\Beca;
use Request;
use DB;

class BackupController extends Controller
{
     public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {	
      
    if( auth()->user()->hasPermission('browse_backup') and auth()->user()->hasrole('admin') ){ 
        $disk = Storage::disk('local');//('laravel-backup.backup.destination.disks')[0]);
      //	$disk=storage_path(('Laravel')[0]);
        $files = $disk->files('SIGAB');
        $backups = [];
        //dd($disk,$files,$backups);
        // make an array of backup files, with their filesize and creation date
        foreach ($files as $k => $f) {
            // only take the zip files into account
            if (substr($f, -4) == '.zip' && $disk->exists($f)) {
                $backups[] = [
                    'file_name' => str_replace(('SIGAB') . '/', '', $f),
                    'file_size' => $this->humanFilesize($disk->size($f)),
                    'last_modified' => $this->getdate($disk->lastModified($f)),
                ];
            }
        }
        $ubicacion = "/Storage/App/SIGAB";
        // reverse the backups, so the newest one would be on top
        
        $backups = array_reverse($backups);
        

        $beca=db::table('becas')->get();//Beca::all();
       // dd($beca,$backups,$ubicacion);
        return view("backup.backups")->with(compact('backups','ubicacion','beca')); 
       
     
    }else
    return redirect()->back()->with(['message'=>"No posee los permisos suficentes!", 'alert-type'=>'error']);
    }
    public function create($id)
    {
        //dd($aux_nombre_beca);
        try {

            if ($id =="completo"){

                $value=config()->set('backup.backup.source.files.include', base_path('storage/app/public'));

                $nombre=config()->set('backup.backup.destination.filename_prefix',"Completo datos y archivos - ");
                
                Artisan::call('backup:run',['--disable-notifications'=>true]);
                $output = Artisan::output();
                // log the results
                Log::info("Backpack\BackupManager -- new backup started from admin interface \r\n" . $output);
                // return the results as a response to the ajax call
                //Alert::success('Nuevo Backup creado');
                return redirect()->back()->with(['message'=>"Backup creado con exito!", 'alert-type'=>'success']);
            }
            elseif ($id=="datos") {
            
               $value=config()->set('backup.backup.source.files.include', base_path('storage/app/public/'.$id));

                $nombre=config()->set('backup.backup.destination.filename_prefix',"Completo solo datos - ");
                
            
                Artisan::call('backup:run',['--disable-notifications'=>true,'--only-db'=>true]);
                $output = Artisan::output();
                Log::info("Backpack\BackupManager -- new backup started from admin interface \r\n" . $output);
                return redirect()->back()->with(['message'=>"Backup creado con exito!", 'alert-type'=>'success']);
            }{
                
                $aux_nombre_beca=DB::table('becas')->where('id',$id)->select('nombre')->first();
          
                 $nombre=config()->set('backup.backup.destination.filename_prefix',"Solo archivos - ".$aux_nombre_beca->nombre." - ");
                

                $value=config()->set('backup.backup.source.files.include', base_path('storage/app/public/'.$id));
                Artisan::call('backup:run',['--disable-notifications'=>true,'--only-files'=>true]);
                $output = Artisan::output();
                Log::info("Backpack\BackupManager -- new backup started from admin interface \r\n" . $output);
                return redirect()->back()->with(['message'=>"Backup creado con exito!", 'alert-type'=>'success']);
            }
    

            
        } catch (Exception $e) {
            Flash::error($e->getMessage());
            return redirect()->back();
        }
    }
    /**
     * Downloads a backup zip file.
     *
     * TODO: make it work no matter the flysystem driver (S3 Bucket, etc).
     */


    public function download($file_name)
    {
        if( (Auth::user()->role_id == '3') or (Auth::user()->role_id == '1')){ 
        //dd($file_name);
        ob_end_clean();
    
        if (Storage::disk('local')->exists('SIGAB/'.$file_name)) {
                $disk = Storage::disk('local');
                $path = storage_path('app/SIGAB/'.$file_name);
                return response()->download($path);
        } else {
            abort(404, "Error el backup no existe");
        }
    }else{abort(404, "Error el backup no existe");}
    }


    public function delete($file_name)
    {
        if( (Auth::user()->role_id == '3') or (Auth::user()->role_id == '1')){ 
        $disk = Storage::disk('local');
        if ($disk->exists('SIGAB/'.$file_name)) {

            $disk->delete('SIGAB/'.$file_name);
            return redirect()->back()->with(['message'=>"Backup borrado con exito!", 'alert-type'=>'warning']);;
        } else {
            abort(404, "Error el backup no existe");
        }
        }else{abort(404, "Error");}
        }


///////////////////////////////////////////////////////////////////////////////

    public function humanFilesize($size, $precision = 2) {
    $units = array('B','kB','MB','GB','TB','PB','EB','ZB','YB');
    $step = 1024;
    $i = 0;

    while (($size / $step) > 0.9) {
        $size = $size / $step;
        $i++;
    }
    
    return round($size, $precision).$units[$i];
    }

    public function getdate($date_modify){
        Carbon::SetLocale('es');
        return Carbon::createFromTimeStamp($date_modify)->format('h:m:s - d/m/y');
    }

}