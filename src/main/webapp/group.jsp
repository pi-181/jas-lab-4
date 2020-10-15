<%@ page import="java.util.Collection" %>
<%@ page import="com.demkom58.jaslab3.model.Group" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
          crossorigin="anonymous">
    <title>Group Page</title>
</head>
<body>
<div class="container">
    <a href="${pageContext.request.contextPath}/">Main Page</a>
    <div class="row justify-content-md-center">
        <table class="border border-light p-5">
            <thead>
            <tr>
                <th>#</th>
                <th>Owner</th>
                <th>Name</th>
                <th>Description</th>
                <th>Closed</th>
                <th>Removed</th>
                <th>Control</th>
            </tr>
            </thead>
            <tbody>
            <%Collection<Group> list = (Collection) request.getAttribute("objects");%>
            <% for (Group g : list) {%>
            <tr>
                <td><%=g.getId()%>
                </td>
                <td><%=g.getOwner().getId()%>
                </td>
                <td><%=g.getGroupName()%>
                </td>
                <td><%=g.getDescription()%>
                </td>
                <td><%=g.isClosed()%>
                </td>
                <td><%=g.isRemoved()%>
                </td>
                <td>
                    <a href="table?action=save&name=group&id=<%=g.getId()%>">Edit</a>
                    <a href="table?action=remove&name=group&id=<%=g.getId()%>">Remove</a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <div class="row justify-content-md-center">
        <form class="border border-light p-5" method="post" action="${pageContext.request.contextPath}/table">
            <%Group group = (Group) request.getAttribute("group");%>
            <input type="hidden" name="name" value="group"/>
            <label><input type="hidden" name="id" value="<%=group.getId()%>"/></label>
            <label>Owner: <input type="text" class="form-control" name="owner"
                                    value="<%=group.getOwner().getId()%>"/></label>
            <label>Group Name: <input type="text" class="form-control" name="group_name"
                                   value="<%=group.getGroupName()%>"/></label>
            <label>Description: <input type="text" class="form-control" name="description"
                                      value="<%=group.getDescription()%>"/></label>
            <label>Closed: <input type="text" class="form-control" name="closed"
                                    value="<%=group.isClosed()%>"/></label>
            <label>Removed: <input type="text" class="form-control" name="removed"
                                         value="<%=group.isRemoved()%>"/></label>
            <input type="submit" class="btn btn-primary" value="Save"/>
        </form>
    </div>
</div>
</body>
</html>

