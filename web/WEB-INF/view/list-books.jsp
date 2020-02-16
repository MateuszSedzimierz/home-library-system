<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>

<html>

    <head>
        <title>Home Library</title>
        <meta charset="utf-8">
    </head>

    <body>

        <div id="wrapper">
            <div id="header">
                <h1>Simple Home Library System</h1>
            </div>
        </div>

        <div id="container">
            <div id="content">

                <!-- HTML table -->
                <table>
                    <tr>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Publisher</th>
                        <th>Publication Year</th>
                    </tr>

                    <c:forEach var="tempBook" items="${books}">

                        <tr>
                            <td>${tempBook.title}</td>
                            <td>${tempBook.author}</td>
                            <td>${tempBook.publisher}</td>
                            <td>${tempBook.publicationYear}</td>
                        </tr>

                    </c:forEach>
                </table>

            </div>
        </div>

    </body>

</html>