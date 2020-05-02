<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="tutorials.ascx.vb" Inherits="socmovil.tutorials" %>

<% 

    'obtiene el lenguaje que esta en session.
    'Dim lang_configreader As socmobile_core.com.configuration.GlobalConfReader = CType(Me.Session("lang_obj"), socmobile_core.com.configuration.GlobalConfReader)
    LoadConfiguration()
    LoadLanguage()
    
%>

<div class="containter-fluid text-center" id="Tutorials_desktop">
    <div class="mt-3 mb-3">
        <span class="display-3"> <%GetLbl("p_tutorials_lblMain")%> </span>
    </div>
    <div class="container mb-4">
        <span class="display-4"><%GetLbl("p_tutorials_lblTitleTRA")%></span>
    </div>

<%--TRA - Como crear un TRA desde mobil--%>
    <div class="container-fluid border-top border-bottom">
        <div class="row">
            <div class="col-lg text-left p-3">
                 <span class="h4">Como crear un Nuevo TRA desde mi m&oacute;vil</span>
                <p></p>
                <p class="text-wrap lead">
                   Para crear un nuevo T R A desde nuestro m&oacute;vil,  presionamos el bot&oacute;n de Crear nuevo TRA.<br />
                    Despu&eacute;s deslizaremos nuestra forma y empezaremos a llenar los datos necesarios.<br /><br />
                    En la secci&oacute;n de tareas, contamos con esta tabla que se desliza a la izquierda o derecha, y para agregar una tarea 
                    utilizamos el formulario de tareas.
                </p>
                <p class="text-wrap lead">
                    Tambi&eacute;n contamos con la matriz de riesgos, la cual es la gu&iacute;a para la identificaci&oacute;n de riesgos, recuerda que la aplicaci&oacute;n te sugiere el riesgo de acuerdo a esta matriz.
                </p>
            </div>
            <div class="col  p-4">
                <video controls="controls" width="620" preload="metadata">
                    <source src="../media/TRA-ES-CREAR%20TRA%20MOBIL.mp4#t=1" type="video/mp4">
                </video>
            </div>
        </div>
        <div class="row ">
            <div class="col-lg text-left p-3">
                <p class="text-wrap lead">
                    En la tabla de actividades, podremos observar que se agreg&oacute; nuestro registro. Podemos deslizar hacia la izquierda o derecha para ver la informaci&oacute;n.
                </p>
                <p class="text-wrap lead">
                    Tenemos las opciones de Guardar TRA, y ver en Formato, la cual nos ayuda guardar nuestro trabajo y visualizar nuestro TRA.
                </p>
            </div>
        </div>
    </div>
<%--TRA -Como crear un TRA--%>
    <div class="container-fluid border-top border-bottom">
        <div class="row bg-light">
            <div class="col p-3">
                 <video controls="controls" width="620" preload="metadata">
                            <source src="../media/TRA-ES-Crear%20nuevo.mp4#t=1" type="video/mp4">
                        </video>
            </div>
            <div class="col-lg text-left p-4">
                <span class="h4">Como crear un Nuevo TRA desde mi computadora.</span>
                <p></p>
                <p class="text-wrap lead">
                    Para realizar un nuevo documento TRA, realizamos un clic en esta opción, "Crear Nuevo TRA". Llenamos todas las opciones en color amarillo. 
                </p>
                <p class="text-wrap lead">
                   En la parte inferior contamos con tres botones, Guardar TRA, Ver en Formato e Imprimir,  Empezaremos con "Ver en formato". Este pre visualiza como quedará nuestro reporte con la información que introducimos.<br /><br /> 
                   El botón de imprimir nos llevara directamente a la sección de impresión de nuestro formato.
                </p>
               
            </div>
        </div>
        <div class="row bg-light">
            <div class="col text-left">
                 <p class="text-wrap lead">
                    El botón guardar, nos guarda en la plataforma nuestro trabajo realizado y nos proporciona un número PIN de ese documento, con este número podemos volver abrir nuestro documento y poder volver a editar.<br /><br /> 
                    El número PIN lo podemos encontrarlo en la parte superior de nuestro documento...
                </p>
            </div>
        </div>
    </div>
<%--TRA - Como Abrir un TRA--%>
    <div class="container-fluid border-top border-bottom">
        <div class="row">
            <div class="col-lg text-left p-3">
                 <span class="h4">Como abrir tu TRA.</span>
                <p></p>
                <p class="text-wrap lead">
                   Para poder abrir nuestro TRA, con nuestro número de PIN, Abrimos desde nuestro menú la opción de TRA.<br />  
                   Después en la opción de "Abrir TRA PIN " colocamos nuestro número y seleccionamos la opción de Abrir.
                </p>
                <p class="text-wrap lead">
                    Como vemos abrirá nuestro T R A que realizamos, y el número de PIN aparecerá en la parte superior.
                </p>
                <p class="text-wrap lead">
                  
                </p>
            </div>
            <div class="col  p-4">
                <video controls="controls" width="620" preload="metadata">
                            <source src="../media/TRA-ES-Abrir%20TRA.mp4#t=1" type="video/mp4">
                        </video>
            </div>
        </div>
    </div>
<%--TRA - Crear un TRA pre-establecido--%>
    <div class="container-fluid border-top border-bottom">
        <div class="row bg-light">
            <div class="col p-3">
                 <video controls="controls" width="620" preload="metadata">
                            <source src="../media/TRA-ES-Copiar%20TRA.mp4#t=1" type="video/mp4">
                        </video>
            </div>
            <div class="col-lg text-left p-4">
                <span class="h4">Como crear un TRA pre-establecido.</span>
                <p></p>
                <p class="text-wrap lead">
                    Para facilitar la creación de un TRA rutinario, este se pueden usar formatos pre-establecidos, Cada departamento cuenta con sus TRA establecidos y autorizados por su supervisor. 
                </p>
                <p class="text-wrap lead">
                  Para hacer uso de un TRA establecido, solo realizamos un clíc en la opción cópiar, y obtendremos  un formato pre-llenado con información... y Podemos llenar los datos que faltan.
                </p>
                <p class="text-wrap lead">
                   Podemos actualizar cualquier dato. si abrimos nuestro TRA. veremos nuestro trabajo realizado.
                </p>
            </div>
        </div>
    </div>
<%--TRA - Navegacion y busqueda--%>
    <div class="container-fluid border-top border-bottom">
        <div class="row">
            <div class="col-lg text-left p-3">
                 <span class="h4">Navegacion y busquedas de TRA establecidos</span>
                <p></p>
                <p class="text-wrap lead">
                  En la p&aacute;gina de TRA, podremos observar que contamos con los TRA establecidos.<br /><br />  
                  Estos documento son documentos pre-llenados,  y  esta seccionados por áreas de trabajo.<br /> <br /> 
                   Podemos filtrar por departamento si no queremos ver toda la lista completa.
                </p>
                <p class="text-wrap lead">
                    Si contamos con una gran lista de documentos establecidos, podemos usar la opción de "Buscar TRA", para encontrar palabras especificas, que nos ayuden a identificar que documento queremos usar.
                </p>
                <p class="text-wrap lead">
                  
                </p>
            </div>
            <div class="col  p-4">
                <video controls="controls" width="620" preload="metadata">
                            <source src="../media/TRA-ES-NAVEGACION.mp4#t=1" type="video/mp4">
                        </video>
            </div>
        </div>
    </div>
</div>
<div class="containter-fluid text-center" id="Tutorials_movil">
    <div class="mt-3 mb-3">
        <span class="h1"> <%GetLbl("p_tutorials_lblMain")%>  </span>
    </div>
    <div class="container mb-4">
        <span class="h4"><%GetLbl("p_tutorials_lblTitleTRA")%></span>
    </div>
<%--TRA- Crear un nuevo tra desde mi movil--%>
    <div class="row border-top">
        <div class="col-lg p-3">
            <span class="h4">Como crear un Nuevo TRA desde mi m&oacute;vil<br />
                <br />
            </span>
            <video controls="controls" width="100%" preload="metadata">
                <source src="../media/TRA-ES-CREAR%20TRA%20MOBIL.mp4#t=1" type="video/mp4">
            </video>
            
        </div>
        <div class="col-lg text-left ml-2">
            <p class="text-wrap" style="font-size: large; font-weight: lighter;">
                Para crear un nuevo T R A desde nuestro m&oacute;vil,  presionamos el bot&oacute;n de Crear nuevo TRA.<br />
                    Despu&eacute;s deslizaremos nuestra forma y empezaremos a llenar los datos necesarios.<br /><br />
                    En la secci&oacute;n de tareas, contamos con esta tabla que se desliza a la izquierda o derecha, y para agregar una tarea 
                    utilizamos el formulario de tareas.
            </p>
            <p class="text-wrap " style="font-size: large; font-weight: lighter;">
                Tambi&eacute;n contamos con la matriz de riesgos, la cual es la gu&iacute;a para la identificaci&oacute;n de riesgos, recuerda que la aplicaci&oacute;n te sugiere el riesgo de acuerdo a esta matriz.
            </p>
            <p class="text-wrap" style="font-size: large; font-weight: lighter;">                
                    En la tabla de actividades, podremos observar que se agreg&oacute; nuestro registro. Podemos deslizar hacia la izquierda o derecha para ver la informaci&oacute;n.
                
            </p>
            <p class="text-wrap lead"  style="font-size: large; font-weight: lighter;">
                    Tenemos las opciones de Guardar TRA, y ver en Formato, la cual nos ayuda guardar nuestro trabajo y visualizar nuestro TRA.
              </p>
        </div>
    </div>
<%--TRA- Crear un nuevo tra--%>
    <div class="row border-top">
        <div class="col-lg p-3">
            <span class="h4">Como crear un Nuevo TRA desde mi computador.<br />
                <br />
            </span>
            <video controls="controls" width="100%" preload="metadata">
                <source src="../media/TRA-ES-Crear%20nuevo.mp4#t=1" type="video/mp4">
            </video>
        </div>
        <div class="col-lg text-left ml-2">
            <p class="text-wrap" style="font-size: large; font-weight: lighter;">
                Para realizar un nuevo documento TRA, realizamos un clic en esta opción, "Crear Nuevo TRA". Llenamos todas las opciones en color amarillo. 
            </p>
            <p class="text-wrap " style="font-size: large; font-weight: lighter;">
                En la parte inferior contamos con tres botones, Guardar TRA, Ver en Formato e Imprimir,  Empezaremos con "Ver en formato". Este pre visualiza como quedará nuestro reporte con la información que introducimos.<br />
                <br />
                El botón de imprimir nos llevara directamente a la sección de impresión de nuestro formato.
            </p>
            <p class="text-wrap" style="font-size: large; font-weight: lighter;">
                El botón guardar, nos guarda en la plataforma nuestro trabajo realizado y nos proporciona un número PIN de ese documento, con este número podemos volver abrir nuestro documento y poder volver a editar.<br />
                <br />
                El número PIN lo podemos encontrarlo en la parte superior de nuestro documento...
            </p>
        </div>
    </div>
<%--TRA - Abrir TRA--%>
    <div class="row border-top">
        <div class="col-lg p-3">
            <span class="h4">Como abrir tu TRA.</span><br />
                <br />
            </span>
            <video controls="controls" width="100%" preload="metadata">
               <source src="../media/TRA-ES-Abrir%20TRA.mp4#t=1.30" type="video/mp4">
            </video>
        </div>
        <div class="col-lg text-left ml-2">
            <p class="text-wrap" style="font-size: large; font-weight: lighter;">
                 Para poder abrir nuestro TRA, con nuestro número de PIN, Abrimos desde nuestro menú la opción de TRA.<br />  
                   Después en la opción de "Abrir TRA PIN " colocamos nuestro número y seleccionamos la opción de Abrir.
            </p>
            <p class="text-wrap " style="font-size: large; font-weight: lighter;">
                Como vemos abrirá nuestro T R A que realizamos, y el número de PIN aparecerá en la parte superior.
            </p>
            <p class="text-wrap" style="font-size: large; font-weight: lighter;">
            </p>
        </div>
    </div>
<%--TRA - crear un TRA pre-establecido--%>
    <div class="row border-top">
        <div class="col-lg p-3">
            <span class="h4">Como crear un TRA pre-establecido.</span><br />
                <br />
            </span>
            <video controls="controls" width="100%" preload="metadata">
                <source src="../media/TRA-ES-Copiar%20TRA.mp4#t=1" type="video/mp4">
            </video>
        </div>
        <div class="col-lg text-left ml-2">
            <p class="text-wrap" style="font-size: large; font-weight: lighter;">
                 Para facilitar la creación de un TRA rutinario, este se pueden usar formatos pre-establecidos, Cada departamento cuenta con sus TRA establecidos y autorizados por su supervisor. 
            </p>
            <p class="text-wrap " style="font-size: large; font-weight: lighter;">
                Para hacer uso de un TRA establecido, solo realizamos un clíc en la opción cópiar, y obtendremos  un formato pre-llenado con información... y Podemos llenar los datos que faltan.
            </p>
            <p class="text-wrap" style="font-size: large; font-weight: lighter;">
                 Podemos actualizar cualquier dato. si abrimos nuestro TRA. veremos nuestro trabajo realizado.
            </p>
        </div>
    </div>
<%--TRA - Navegacion y busqueda--%>
    <div class="row border-top">
        <div class="col-lg p-3">
            <span class="h4">Navegacion y busquedas de TRA establecidos<br />
                <br />
            </span>
            <video controls="controls" width="100%" preload="metadata">
               <source src="../media/TRA-ES-NAVEGACION.mp4#t=1" type="video/mp4">
            </video>
        </div>
        <div class="col-lg text-left ml-2">
            <p class="text-wrap" style="font-size: large; font-weight: lighter;">
                  En la p&aacute;gina de TRA, podremos observar que contamos con los TRA establecidos.<br /><br />  
                  Estos documento son documentos pre-llenados,  y  esta seccionados por áreas de trabajo.<br /> <br /> 
                  Podemos filtrar por departamento si no queremos ver toda la lista completa. 
            </p>
            <p class="text-wrap " style="font-size: large; font-weight: lighter;">
                Si contamos con una gran lista de documentos establecidos, podemos usar la opción de "Buscar TRA", para encontrar palabras especificas, que nos ayuden a identificar que documento queremos usar.
            </p>
            <p class="text-wrap" style="font-size: large; font-weight: lighter;">

            </p>
        </div>
    </div>
</div>