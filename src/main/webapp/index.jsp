<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.Map" %>
<%
    // Incluimos un scriptlet para llamar los errores que están disponibles en el request
    Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manejo de formularios</title>
    <style>
        /* Estilo para resaltar los campos con error */
        .error {
            border: 1px solid red;
            background-color: #ffe6e6;
        }
    </style>
</head>
<body>
<h1>Manejo de Formulario</h1>

<div>
    <form action="/hacerdeeber/ingresar" method="post">
        <%-- Campo usuario --%>
        <div>
            <label for="username">Ingrese el usuario</label>
            <input type="text" name="username" id="username"
                   placeholder="<%= errores != null && errores.containsKey("username") ? errores.get("username") : "usuario" %>"
                   class="<%= errores != null && errores.containsKey("username") ? "error" : "" %>">
        </div>

        <%-- Campo contraseña --%>
        <div>
            <label for="password">Ingrese la contraseña</label>
            <input type="password" name="password" id="password"
                   placeholder="<%= errores != null && errores.containsKey("password") ? errores.get("password") : "" %>"
                   class="<%= errores != null && errores.containsKey("password") ? "error" : "" %>">
        </div>

        <%-- Campo email --%>
        <div>
            <label for="email">Ingrese el email</label>
            <input type="email" name="email" id="email"
                   placeholder="<%= errores != null && errores.containsKey("email") ? errores.get("email") : "Email" %>"
                   class="<%= errores != null && errores.containsKey("email") ? "error" : "" %>">
        </div>

        <%-- Selección de lenguajes --%>
        <div>
            <label for="lenguajes">Lenguajes de programación</label>
            <div>
                <select name="lenguajes" id="lenguajes" multiple>
                    <option value="Java" selected>Java SE</option>
                    <option value="jakartaaee" selected>Jakarta EE</option>
                    <option value="php" selected>PHP</option>
                    <option value="laravel">LARAVEL</option>
                    <option value="springboot">SPRING BOOT</option>
                </select>
            </div>
        </div>

        <%-- Selección del idioma --%>
        <div>
            <label>Selecciona el idioma</label>
            <div>
                <input type="radio" name="idioma" value="Es"> Español
                <input type="radio" name="idioma" value="En"> Inglés
                <input type="radio" name="idioma" value="Ru"> Ruso
            </div>
            <%-- Mensaje de error para idioma (si existe) --%>
            <% if (errores != null && errores.containsKey("idioma")) { %>
            <span class="error"><%= errores.get("idioma") %></span>
            <% } %>
        </div>

        <%-- Selección de nacionalidad --%>
        <div>
            <label for="pais">Nacionalidad</label>
            <select name="pais" id="pais" class="<%= errores != null && errores.containsKey("pais") ? "error" : "" %>">
                <option value="">----Seleccione un país---</option>
                <option value="EC">Ecuador</option>
                <option value="PE">Perú</option>
                <option value="CO">Colombia</option>
                <option value="CH">Chile</option>
                <option value="AR">Argentina</option>
            </select>
        </div>

        <%-- Roles --%>
        <div>
            <label>Roles</label>
            <div>
                <input type="checkbox" name="roles" value="Role_Admin"> Administrador
                <input type="checkbox" name="roles" value="Role_User"> Usuario
                <input type="checkbox" name="roles" value="Role_Digitador"> Digitador
            </div>
        </div>

        <%-- Habilitar opción --%>
        <div>
            <label for="Habilitar">Habilitar</label>
            <div>
                <input type="checkbox" name="Habilitar" id="Habilitar" checked> Habilitar
            </div>
        </div>

        <%-- Botón de envío --%>
        <div>
            <input type="submit" value="Enviar">
        </div>
    </form>
</div>

</body>
</html>
