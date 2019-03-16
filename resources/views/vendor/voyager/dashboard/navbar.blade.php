<nav class="navbar navbar-default navbar-fixed-top navbar-top">
    
    <div class="container-fluid">
        
        <div class="navbar-header">

            <button class="hamburger btn-link">
                <span class="hamburger-inner"></span>
            </button>
                            <ul class="nav navbar-nav">
                    <li class="">
                        <a href="/">Inicio</a></li>
                        @if(auth()->check())
                        @if (Auth::user()->role_id==2)
                    <li class="" >
                        <a href="/administracion">Administración de beca</a></li>
                       <li class="" > <a href="/datospersona/create"><strong>Postulate</strong></a> </li>
                       @endif
                        @endif

                    <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Información sobre Becas</a>
                            <ul class="dropdown-menu" role="menu">
                                    <li><a href="/seleccionados_2017">Selección de Becados 2017</a></li>
                                    <li><a href="/requisitos" >Requisitos para la Inscripción a la Beca</a></li>
                                    <li><a href="/formulario">Formulario para imprimir</a></li>
                            </ul>
                    </li>
                      <li class="" >
                        <a href="/acerca">Acerca de</a></li>
                
                </ul>   
            </div>
        <ul class="nav navbar-nav @if (config('voyager.multilingual.rtl')) navbar-left @else navbar-right @endif">
            <li class="dropdown">
                                <a href="#" class="dropdown-toggle text-right" data-toggle="dropdown" role="button" aria-expanded="false">

                                 Hola {{ Auth::user()->name }} ! <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-animated" menu="menu" style=" border: gray 1px solid;">

                                    <li>
                                     <img src="{{ $user_avatar }}" width="60" height="60">
                                     <font size="2"><strong>{{ Auth::user()->name }}</strong> 
                                        {{ Auth::user()->email }}</font>   
                                    </li>
                                  <li class="divider"></li>
                                
                                <li><a href="/administracion/profile">Ver mi perfil</a></li>
                                <li><a href="/administracion/">Administración de Beca</a></li>
                             
                                     <li class="divider"></li>
                                
                                  <li>
                                        <a href="{{ route('logout') }}"
                                            onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                    <button type="submit" class="btn btn-danger btn-block">
                                       Cerrar sesión</button>
                                        </a>

                                         <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                            {{ csrf_field() }}
                                        </form>
                                    </li>
                                    
                                </ul>
                             

                            </li>
        </ul>
    </div>
</nav>
