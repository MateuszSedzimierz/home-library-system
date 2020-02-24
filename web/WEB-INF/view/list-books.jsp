<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE HTML>

<html>

    <head>
        <title>Home Library</title>

        <!-- Adding style sheet -->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
    </head>

    <body>

    <div id="container">

                <h1>Simple Home Library System</h1>

                <!--New button to add new book-->
                <input type="button" value="Add Book" onclick="window.location.href='showFormForAdd'; return false;" class="add-button" />


                <!-- HTML table -->

                <div id="content">
                    <table cellspacing="0">

                        <tr>
                            <th>Title</th>
                            <th>Author</th>
                            <th>Publisher</th>
                            <th>Publication Year</th>
                            <th>Action</th>
                        </tr>

                        <c:forEach var="tempBook" items="${books}">

                            <!-- Update link with book id -->
                            <c:url var="updateLink" value="/showFormForUpdate" >
                                <c:param name="bookId" value="${tempBook.id}" />
                            </c:url>

                            <tr>
                                <td>${tempBook.title}</td>
                                <td>${tempBook.author}</td>
                                <td>${tempBook.publisher}</td>
                                <td>${tempBook.publicationYear}</td>

                                <!-- Display update link -->
                                <td><a href="${updateLink}">Update</a> </td>
                            </tr>

                        </c:forEach>
                    </table>
                </div>

        </div>

    </body>

</html>