<%@ page import="java.util.ArrayList" %>
<%@ page import="com.emergentes.modelos.Calificacion" %>
<%
    if(session.getAttribute("listacal") == null) {
      ArrayList<Calificacion> listAux = new ArrayList<Calificacion>();
      session.setAttribute("listacal", listAux);
    }
  ArrayList<Calificacion> lista = (ArrayList<Calificacion>) session.getAttribute("listacal");
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
            .container{
                text-align: center;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .btn {
                padding: 5px 10px;
                border: 1px solid black;
                border-radius: 5px;
                text-decoration: none;
                color: black;
            }
            table{
                margin-top: 1rem;
                border: 1px solid black;
                border-radius: 5px
            }
            table thead,tbody {
                text-align: center;
            }
            th, td{
                padding: 7px 30px
            }
            .card{
                border: 1px solid black;
                width: 400px;
                text-align: center;
                border-radius: 5px;
                margin: 1rem auto;
            }
        </style>
    </head>
    <body>
        <div class='card'>
            <h3>PRIMER PARCIAL TEM-742</h2>
            <p>Nombre: Luis Alfredo Choque Canaviri</p>
            <p>Carnet: 9941300</p>
        </div>
        
        <h1>Registro de calificaciones</h1>

        <div class='container'>

            <div style="text-align: left">
                <a href="MainServlet?op=nuevo" class='btn'>Nuevo</a>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>NOMBRE</th>
                            <th>P1(30)</th>
                            <th>P2(30)</th>
                            <th>EF(40)</th>
                            <th>NOTA</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            for(Calificacion item: lista){
                        %>
                        <tr>
                            <td><%= item.getId() %></td>
                            <td><%= item.getNombre() %></td>
                            <td><%= item.getPrimerParcial() %></td>
                            <td><%= item.getSegundoParcial() %></td>
                            <td><%= item.getExamenFinal() %></td>
                            <td><%= item.getNota() %></td>
                            <td style="padding: 5px 10px">
                                <a href="MainServlet?op=editar&id=<%= item.getId() %>">Editar</a>
                            </td>
                            <td style="padding: 5px 10px">
                                <a href="MainServlet?op=eliminar&id=<%= item.getId() %>"
                                   onclick="return(confirm('Esta seguro de eliminar??'))"
                                   >
                                    Eliminar
                                </a>
                            </td>
                        </tr>
                        <% 
                            }
                        %>

                    </tbody>
                </table>
            </div>


        </div>


    </body>
</html>
