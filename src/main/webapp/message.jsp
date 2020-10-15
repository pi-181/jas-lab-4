<%@ page import="com.demkom58.jaslab3.model.Message" %>
<%@ page import="java.util.Collection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
          crossorigin="anonymous">
    <title>Message Page</title>
</head>
<body>
<div class="container">
    <a href="${pageContext.request.contextPath}/">Main Page</a>
    <div class="row justify-content-md-center">
        <table class="border border-light p-5">
            <thead>
            <tr>
                <th>#</th>
                <th>Sender</th>
                <th>Message</th>
                <th>Removed</th>
                <th>Control</th>
            </tr>
            </thead>
            <tbody>
            <%Collection<Message> list = (Collection) request.getAttribute("objects");%>
            <% for (Message m : list) {%>
            <tr>
                <td><%=m.getId()%>
                </td>
                <td><%=m.getSender().getUserId()%>
                </td>
                <td><%=m.getTextMessage()%>
                </td>
                <td><%=m.isRemoved()%>
                </td>
                <td>
                    <a href="table?action=save&name=message&id=<%=m.getId()%>">Edit</a>
                    <a href="table?action=remove&name=message&id=<%=m.getId()%>">Remove</a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <div class="row justify-content-md-center">
        <form class="border border-light p-5" method="post" action="${pageContext.request.contextPath}/table">
            <%Message msg = (Message) request.getAttribute("message");%>
            <input type="hidden" name="name" value="message"/>
            <label><input type="hidden" name="id" value="<%=msg.getId()%>"/></label>
            <label>Sender: <input type="text" class="form-control" name="sender"
                                    value="<%=msg.getSender().getId()%>"/></label>
            <label>Text: <input type="text" class="form-control" name="text"
                                   value="<%=msg.getTextMessage()%>"/></label>
            <label>Removed: <input type="text" class="form-control" name="removed"
                                      value="<%=msg.isRemoved()%>"/></label>
            <label>Conversation: <input type="text" class="form-control" name="conversation"
                                    value="<%=msg.getConversation().getId()%>"/></label>
            <input type="submit" class="btn btn-primary" value="Save"/>
        </form>
    </div>
</div>
</body>
</html>

