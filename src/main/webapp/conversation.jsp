<%@ page import="java.util.Collection" %>
<%@ page import="com.demkom58.jaslab3.model.Conversation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
          crossorigin="anonymous">
    <title>Conversation Page</title>
</head>
<body>
<div class="container">
    <a href="${pageContext.request.contextPath}/">Main Page</a>
    <div class="row justify-content-md-center">
        <table class="border border-light p-5">
            <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Removed</th>
                <th>Personal</th>
                <th>Control</th>
            </tr>
            </thead>
            <tbody>
            <%Collection<Conversation> list = (Collection) request.getAttribute("objects");%>
            <% for (Conversation c : list) {%>
            <tr>
                <td><%=c.getId()%>
                </td>
                <td><%=c.getConversationName()%>
                </td>
                <td><%=c.isRemoved()%>
                </td>
                <td><%=c.isPersonal()%>
                </td>
                <td>
                    <a href="table?action=save&name=conversation&id=<%=c.getId()%>">Edit</a>
                    <a href="table?action=remove&name=conversation&id=<%=c.getId()%>">Remove</a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <div class="row justify-content-md-center">
        <form class="border border-light p-5" method="post" action="${pageContext.request.contextPath}/table">
            <%Conversation conv = (Conversation) request.getAttribute("conversation");%>
            <input type="hidden" name="name" value="conversation"/>
            <label><input type="hidden" name="id" value="<%=conv.getId()%>"/></label>
            <label>Conversation Name: <input type="text" class="form-control" name="conversation_name"
                                    value="<%=conv.getConversationName()%>"/></label>
            <label>Removed: <input type="text" class="form-control" name="removed"
                                   value="<%=conv.isRemoved()%>"/></label>
            <label>Personal: <input type="text" class="form-control" name="personal"
                                      value="<%=conv.isPersonal()%>"/></label>
            <input type="submit" class="btn btn-primary" value="Save"/>
        </form>
    </div>
</div>
</body>
</html>

