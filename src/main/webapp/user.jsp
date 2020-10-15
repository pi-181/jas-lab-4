<%@ page import="java.util.Collection" %>
<%@ page import="com.demkom58.jaslab3.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
          crossorigin="anonymous">
    <title>User Page</title>
</head>
<body>
<div class="container">
    <a href="${pageContext.request.contextPath}/">Main Page</a>
    <div class="row justify-content-md-center">
        <table class="border border-light p-5">
            <thead>
            <tr>
                <th>#</th>
                <th>Username</th>
                <th>Surname</th>
                <th>Patronymic</th>
                <th>Birthday Date</th>
                <th>Creation Time</th>
                <th>Email</th>
                <th>Verified</th>
                <th>Mail Confirmed</th>
                <th>Control</th>
            </tr>
            </thead>
            <tbody>
            <%Collection<User> list = (Collection) request.getAttribute("objects");%>
            <% for (User u : list) {%>
            <tr>
                <td><%=u.getId()%>
                </td>
                <td><%=u.getUsername()%>
                </td>
                <td><%=u.getSurname()%>
                </td>
                <td><%=u.getPatronymic()%>
                </td>
                <td><%=u.getBirthdayDate()%>
                </td>
                <td><%=u.getCreationTime()%>
                </td>
                <td><%=u.getEmail()%>
                </td>
                <td><%=u.isVerified()%>
                </td>
                <td><%=u.isMailConfirmed()%>
                </td>
                <td>
                    <a href="table?action=save&name=user&id=<%=u.getId()%>">Edit</a>
                    <a href="table?action=remove&name=user&id=<%=u.getId()%>">Remove</a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <div class="row justify-content-md-center">
        <form class="border border-light p-5" method="post" action="${pageContext.request.contextPath}/table">
            <%User user = (User) request.getAttribute("user");%>
            <input type="hidden" name="name" value="user"/>
            <label><input type="hidden" name="id" value="<%=user.getId()%>"/></label>
            <label>Username: <input type="text" class="form-control" name="username"
                                    value="<%=user.getUsername()%>"/></label>
            <label>Surname: <input type="text" class="form-control" name="surname"
                                   value="<%=user.getSurname()%>"/></label>
            <label>Patronymic: <input type="text" class="form-control" name="patronymic"
                                      value="<%=user.getPatronymic()%>"/></label>
            <label>Birthday: <input type="text" class="form-control" name="birthday_date"
                                    value="<%=user.getBirthdayDate()%>"/></label>
            <label>Creation Time: <input type="text" class="form-control" name="creation_time"
                                         value="<%=user.getCreationTime()%>"/></label>
            <label>Email: <input type="text" class="form-control" name="email"
                                 value="<%=user.getEmail()%>"/></label>
            <label>Verified: <input type="text" class="form-control" name="verified"
                                    value="<%=user.isVerified()%>"/></label>
            <label>Mail Confirmed: <input type="text" class="form-control" name="mail_confirmed"
                                          value="<%=user.isMailConfirmed()%>"/></label>
            <input type="submit" class="btn btn-primary" value="Save"/>
        </form>
    </div>
</div>
</body>
</html>