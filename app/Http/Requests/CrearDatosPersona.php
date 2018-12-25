<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CrearDatosPersona extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return[
        //'user_id' => 'required',
        'apellido' => 'required|string|max:256',
        'nombre' => 'required|string|max:256',
        'dni' => 'required|numeric',
      //  'imagen_dni' => 'required|mimes:jpeg,bmp,png,jpg', //ver de agregar tamaño a todas las img, y si se agrega pdf
        //'anses'=> 'mimes:jpeg,bmp,png,jpg|required',
        //'cuil' => 'required|numeric',
        'estcivil' => 'required|string',
        'cumple' => 'date_format:Y-m-d|required',
        'domi' => 'required|max:256',
        'provincia' => 'required|numeric',
        'localidad' => 'required|string|max:256',
        'cp' => 'required|numeric|max:10000',
        'nacionalidad' => 'required|string|max:256',
        'cel' => 'required|numeric|min:999999|max:10000000000',
        'email' => 'required|email',
        //'face' => 'required',
        'discaest' => 'required|string|max:100',
        //'imagendiscaest'=> 'mimes:jpeg,bmp,png,jpg|required', requiered_if
        'carrera_cursa' => 'required|numeric',
        'cond'=>'required|string',
        //'constancia' => 'mimes:jpeg,bmp,png,jpg|required',
        //'certificado' => 'mimes:jpeg,bmp,png,jpg|required',
        //aca quede verificando...

        'carrera_cursa' => 'required',
        'anioingreso' => 'required|numeric|min:999|max:10000',
        'aniocursado' => 'required|numeric|min:0|max:8',
        'trabaja' => 'required',
        //'actlab' => 'required', esto es con required_if?
        //'comping' => 'mimes:jpeg,bmp,png,jpg|required',
        //'sueldo' => 'required|numeric|min:0|max:1000000',
        'beca' => 'required',
        'progresar' => 'required',
        'asig' => 'required',
        //'otrosing' => 'required', required_if
        'domicursa' => 'required|max:256',
        'casafam' => 'required',
        'alq' => 'required',
        //'reciboalq' => 'mimes:jpeg,bmp,png,jpg|required', required_if
        //'montoalq' => 'required', required_if
        //'urbano' => 'required', if a futuro
        //'cantviaja' => 'required|numeric', if a unfuturo
        //'mediadist' => 'required', if a futuro
        //'cantviajamedia' => 'required', if a futuro 
        //'recibopasaj' => 'mimes:jpeg,bmp,png,jpg|required', if a futuro
        //'preciopasaje' => 'required|numeric', if a futuro
        'propietario' => 'required',
        'alquila' => 'required',
        //'reciboalqfam' => 'mimes:jpeg,bmp,png,jpg|required', if a futuro
        //'precioalquiler' => 'required', if a futuro
        //'prestada' => 'required', if a futuro
        //'otrosvivienda' => 'required', if a futuro
        'campo' => 'required',
        //'has' => 'required', if a futuro
        //'actividad' => 'required', if a futuro
        //'terreno' => 'required|numeric', if a futuro
        //'terrenocant' => 'required|numeric', if a futuro
        'auto' => 'required',
        //'autocant' => 'required', if futuro
        'moto' => 'required',
        //'motocant' => 'required', if futuro
        'motivos' => 'required|string|max:256',

        /////////////////------////////////////
        //'consideraciones.*.parentesco' => 'required',
        //'consideraciones.*.enfermedad' => 'required',
        //'consideraciones.*.incapacidad' => 'required',
        //'consideraciones.*.imagen' => 'mimes:jpeg,bmp,png,jpg|required',
     
        /////////////////------////////////////
        /*'familiar.*.parentesco' => 'required',
        'familiar.*.apeynom' => 'required',
        'familiar.*.dnifam' => 'required',
        'familiar.*.imagen_dnifam' => 'mimes:jpeg,bmp,png,jpg|required',
        'familiar.*.edadfam' => 'required',
        'familiar.*.ocupacionfam' => 'required',
        'familiar.*.actlab' => 'required',
        'familiar.*.imagen_comping' => 'mimes:jpeg,bmp,png,jpg|required',
        'familiar.*.ingresosfam' => 'required',
        'familiar.*.ansesfam' => 'mimes:jpeg,bmp,png,jpg|required',*/
        ];
    }

    public function messages(){
        return[
        //'campoXX' => 'error personalizado',
        'aniocursado' => [
                        'required'=>'El anio de cursado es obligatorio',
                        'min' => 'El anio de cursado minimo debe ser...',
                        'max' => 'El anio de cursado maximo debe ser....'], 

        ];
    }
}
