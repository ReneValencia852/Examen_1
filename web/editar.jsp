<%-- 
    Document   : editar
    Created on : 13-04-2021, 11:03:08 PM
    Author     : Nek0
--%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Personales</title>
    </head>
    <body>
        <h1>
            <c:if test="${requestScope.op == 'nuevo'}" var="res" scope="request">
                Registro de
            </c:if>
            <c:if test="${requestScope.op == 'modificar'}" var="res" scope="request">
               Modificar
            </c:if>
            dato   
        </h1>
            <jsp:useBean id="miDato" scope="request" class="com.emergentes.modelo.Dato"/>
            
            <form action="Controller" method="post">
                <table>
                    <tr>
                        <td>Id</td>
                        <td><input type="text" name="id"
                                   value="<jsp:getProperty name="miDato" property="id"/>"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name="nombre"
                                   value="<jsp:getProperty name="miDato" property="nombre"/>"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Peso</td>
                        <td><input type="text" name="peso"
                                   value="<jsp:getProperty name="miDato" property="peso"/>"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Talla</td>
                        <td><input type="text" name="talla"
                                   value="<jsp:getProperty name="miDato" property="talla"/>"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Vacuna</td>
                        <td>
                            <select name="vacuna">
                                <option value="Si"
                                        <c:if test="${miDato.vacuna == 'Si'}"
                                              var="res" scope="request">
                                            selected
                                        </c:if>
                                        >Si</option>
                                <option value="No"
                                        <c:if test="${miDato.vacuna == 'No'}"
                                              var="res" scope="request">
                                            selected
                                        </c:if>
                                        >No</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="hidden" name="opg" value="${requestScope.op}"/>
                            <input type="hidden" name="op" value="grabar"/>
                        </td>
                        <td><input type="submit" value="Enviar"/></td>
                    </tr>
                </table> 
            </form>
    </body>
</html>
