<%--
    Document   : index
    Created on : 13-04-2021, 10:53:07 PM
    Author     : Nek0
--%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.emergentes.modelo.Dato"%>
<%@page import="com.emergentes.modelo.GestorDatos"%>
<%
    if (session.getAttribute("agenda") == null) 
    {
        GestorDatos objeto1 = new GestorDatos();       
        objeto1.insertarDato(new Dato(1, "Rene Valencia", "45", "140","Si"));
        objeto1.insertarDato(new Dato(2, "Jorge Ramirez", "43", "152","Si"));
        session.setAttribute("agenda", objeto1);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Personales</title>
    </head>
    <body>
        <table border="1">
            <h3>PRIMER PARCIAL TEM-742</h3>
            <h4>Nombre: Rene Valencia</h4>
            <h4>Carnet: 6965872</h4>
        </table>
        <h1>Registro de vacunas</h1>
        <a href="Controller?op=nuevo">Nuevo</a>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Peso</th>
                <th>Talla</th>
                <th>Vacuna</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="item" items="${sessionScope.agenda.getLista()}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.nombre}</td>
                    <td>${item.peso}</td>
                    <td>${item.talla}</td>
                    <td>${item.vacuna}</td>
                    <td>
                        <a href="Controller?op=modificar&id=${item.id}">Modificar</a>
                    </td>
                    <td>
                        <a href="Controller?op=eliminar&id=${item.id}">Eliminar</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
