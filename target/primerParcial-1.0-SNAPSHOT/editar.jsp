<%@ page import="com.emergentes.modelos.Calificacion" %>

<%
  Calificacion req = (Calificacion) request.getAttribute("miobjcal");
%>   

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            h1 {
                text-align: center
            }
            .card{
                border: 1px solid black;
                width: 400px;
                text-align: center;
                border-radius: 5px;
                margin: 1rem auto;
            }
            .card-form{
                border: 1px solid black;
                width: 70%;
                text-align: center;
                border-radius: 5px;
                margin: 1rem auto;
                padding:1rem;
            }
            table{
                margin: 0 auto;
            }
            table td{
                padding: 5px 20px;
            }
            input{
                padding: 5px ;
                border-radius: 5px;
                width: 300px
            }
            .btn{
                width: 100%;
                padding: 10px;
                font-weight: 800;
                font-size: 14px
            }
            .text-right{
                text-align: right;
            }
        </style>
    </head>
    <body>
        <div class='card'>
            <h3>PRIMER PARCIAL TEM-742</h2>
                <p>Nombre: Luis Alfredo Choque Canaviri</p>
                <p>Carnet: 9941300</p>
        </div>

        <h1>Registro de Calificaciones</h1>
        <div class="card-form">
            <form action="MainServlet" method="post">
                <table >
                    <tr style="display: none">
                        <td class='text-right'>Id</td>
                        <td><input type="text" name="id" value="<%= req.getId() %>" ></td>
                    </tr> 
                    <tr>
                        <td class='text-right'>Nombre del estudiante</td>
                        <td><input type="text" name="nombre" value="<%= req.getNombre() %>" ></td>
                    </tr> 
                    <tr>
                        <td class='text-right'>Primer parcial (sobre 30pts)</td>
                        <td><input type="text" name="primerParcial" value="<%= req.getPrimerParcial() %>" ></td>
                    </tr>
                    <tr>
                        <td class='text-right'>Segundo parcial (sobre 30pts)</td>
                        <td><input type="text" name="segundoParcial" value="<%= req.getSegundoParcial() %>" ></td>
                    </tr>
                    <tr>
                        <td class='text-right'>Examen Final (sobre 40pts)</td>
                        <td><input type="text" name="examenFinal" value="<%= req.getExamenFinal() %>" ></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><button class="btn" type="submit">Enviar</button></td>
                    </tr>
                </table>

            </form>
        </div>

    </body>
</html>
