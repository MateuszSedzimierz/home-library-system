<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

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

                <div style="display: inline-block">
                    <!--New button to add new book-->
                    <input type="button" value="Add Book" onclick="window.location.href='showFormForAdd'; return false;" class="add-button" />
                </div>

                <div style="display: inline-block">
                    <!-- Add search box -->
                    <form:form action="search" method="get" >
                        <input type="text" name="theSearch" placeholder="Type to search" id="searchBar"/>
                        <input type="submit" value="Search" class="add-button" >
                    </form:form>
                </div>

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

                            <!-- Delete link with book id -->
                            <c:url var="deleteLink" value="/delete">
                                <c:param name="bookId" value="${tempBook.id}" />
                            </c:url>

                            <tr>
                                <td>${tempBook.title}</td>
                                <td>${tempBook.author}</td>
                                <td>${tempBook.publisher}</td>
                                <td>${tempBook.publicationYear}</td>

                                <!-- Display update and delete link -->
                                <td>
                                    <a href="${updateLink}">Update</a>
                                    |
                                    <a href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this book ?'))) return false">
                                        Delete
                                    </a>
                                </td>


                            </tr>

                        </c:forEach>
                    </table>
                </div>

        </div>

    </body>

</html>