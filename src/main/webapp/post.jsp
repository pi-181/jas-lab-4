<%@ page import="java.util.Collection" %>
<%@ page import="com.demkom58.jaslab3.model.Post" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
          crossorigin="anonymous">
    <title>Post Page</title>
</head>
<body>
<div class="container">
    <a href="${pageContext.request.contextPath}/">Main Page</a>
    <div class="row justify-content-md-center">
        <table class="border border-light p-5">
            <thead>
            <tr>
                <th>#</th>
                <th>Content</th>
                <th>Views</th>
                <th>Group</th>
                <th>Author</th>
                <th>Date</th>
                <th>Control</th>
            </tr>
            </thead>
            <tbody>
            <%Collection<Post> list = (Collection) request.getAttribute("objects");%>
            <% for (Post s : list) { %>
            <tr>
                <td><%=s.getId()%>
                </td>
                <td><%=s.getPostContent()%>
                </td>
                <td><%=s.getViews()%>
                </td>
                <td><%=s.getGroup().getId()%>
                </td>
                <td><%=s.getAuthor().getId()%>
                </td>
                <td><%=s.getPostDate()%>
                </td>
                <td>
                    <a href="table?action=save&name=post&id=<%=s.getId()%>">Edit</a>
                    <a href="table?action=remove&name=post&id=<%=s.getId()%>">Remove</a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <div class="row justify-content-md-center">
        <form class="border border-light p-5" method="post" action="${pageContext.request.contextPath}/table">
            <%Post post = (Post) request.getAttribute("post");%>
            <input type="hidden" name="name" value="post"/>
            <label><input type="hidden" name="id" value="<%=post.getId()%>"/></label>
            <label>Content: <input type="text" class="form-control" name="content"
                                    value="<%=post.getPostContent()%>"/></label>
            <label>Views: <input type="text" class="form-control" name="views"
                                   value="<%=post.getViews()%>"/></label>
            <label>Group: <input type="text" class="form-control" name="group"
                                      value="<%=post.getGroup().getId()%>"/></label>
            <label>Author: <input type="text" class="form-control" name="author"
                                    value="<%=post.getAuthor().getId()%>"/></label>
            <label>Post Date: <input type="text" class="form-control" name="postdate"
                                         value="<%=post.getPostDate()%>"/></label>
            <input type="submit" class="btn btn-primary" value="Save"/>
        </form>
    </div>
</div>
</body>
</html>

