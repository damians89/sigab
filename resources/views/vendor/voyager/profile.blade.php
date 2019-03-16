@extends('voyager::master')

@section('css')
    <style>
        .user-email {
            font-size: .85rem;
            margin-bottom: 1.5em;
        }
    </style>
@stop

@section('content')
    <div style="background-size:cover; background-image: url({{ Voyager::image( Voyager::setting('admin.bg_image'), config('voyager.assets_path') . '/images/bg.jpg') }}); background-position: center center;position:absolute; top:0; left:0; width:100%; height:300px;"></div>
    <div style="height:160px; display:block; width:100%"></div>
    <div style="position:relative; z-index:9; text-align:center;">
        <img src="@if( !filter_var(Auth::user()->avatar, FILTER_VALIDATE_URL)){{ Voyager::image( Auth::user()->avatar ) }}@else{{ Auth::user()->avatar }}@endif"
             class="avatar"
             style="border-radius:50%; width:150px; height:150px; border:5px solid #fff;"
             alt="{{ Auth::user()->name }} avatar">
    
<TABLE class="table table-responsive table-hover table-bordered" align="center" style="width:60%" >
    <TR><TH class="col-md-4">Apellido</TH>
        <TD>{{ ucwords(Auth::user()->apellido) }}</TD>
    </TR>
    <TR><TH class="col-md-4">Nombres</TH>
        <TD> {{ ucwords(Auth::user()->name) }}</TD>
    </TR>
    <TR><TH class="col-md-4">Documento / CUIL</TH>
        <TD>{{ ucwords(Auth::user()->dni) }}</TD>
    </TR>
    <TR><TH class="col-md-4">Dirección de correo electrónico</TH>
        <TD>{{ ucwords(Auth::user()->email) }}</TD>
    </TR>
    <TR><TH class="col-md-4">Fecha de alta en SIGAB</TH>
        <TD>{{ \Carbon\Carbon::parse(ucwords(Auth::user()->created_at))->format('d/m/Y - H:i')." hs"}}</TD>
    </TR>
</TABLE>

        <p>{{ Auth::user()->bio }}</p>
        <a href="{{ route('voyager.users.edit', Auth::user()->id) }}" class="btn btn-primary">{{ __('voyager::profile.edit') }}</a>
    </div>
@stop
