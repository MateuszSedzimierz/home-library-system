<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html;charset=UTF-8"  %>

<!DOCTYPE HTML>

<html>

    <head>
        <title>Save Book</title>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/save-book-style.css">
    </head>

    <body>

    <div id="container">

        <h1>Simple Home Library System</h1>

        <div id="content">

            <form:form action="saveBook" modelAttribute="book" method="post" >

                <form:hidden path="id" />

                <table>

                    <tr>
                        <td><label></label></td>
                        <td><h2>Save Book</h2></td>
                    </tr>

                    <tr>
                        <td><label>Title:</label></td>
                        <td><form:input path="title"/></td>
                    </tr>

                    <tr>
                        <td><label>Author:</label></td>
                        <td><form:input path="author"/></td>
                    </tr>

                    <tr>
                        <td><label>Publisher:</label></td>
                        <td><form:input path="publisher"/></td>
                    </tr>

                    <tr>
                        <td><label>Publication Year:</label></td>
                        <td><form:input path="publicationYear"/></td>
                    </tr>

                    <tr>
                        <td><label></label></td>
                        <td><input type="submit" value="Save" class="form-button"/></td>
                    </tr>

                    <tr>
                        <td><label></label></td>
                        <td><input type="button" value="Back to list" onclick="window.location.href='list'; return false;" class="form-button" /></td>
                    </tr>

                </table>

            </form:form>



        </div>
    </div>

    </body>

</html>
