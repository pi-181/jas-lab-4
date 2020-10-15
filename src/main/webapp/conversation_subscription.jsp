<%@ page import="java.util.Collection" %>
<%@ page import="com.demkom58.jaslab3.model.ConversationSubscription" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
          crossorigin="anonymous">
    <title>Conversation Subscription Page</title>
</head>
<body>
<div class="container">
    <a href="${pageContext.request.contextPath}/">Main Page</a>
    <div class="row justify-content-md-center">
        <table class="border border-light p-5">
            <thead>
            <tr>
                <th>#</th>
                <th>Subscriber</th>
                <th>Conversation</th>
                <th>Creation Time</th>
                <th>Control</th>
            </tr>
            </thead>
            <tbody>
            <%Collection<ConversationSubscription> list = (Collection) request.getAttribute("objects");%>
            <% for (ConversationSubscription s : list) {%>
            <tr>
                <td><%=s.getId()%>
                </td>
                <td><%=s.getSubscriber().getId()%>
                </td>
                <td><%=s.getConversation().getId()%>
                </td>
                <td><%=s.getCreationTime()%>
                </td>
                <td>
                    <a href="table?action=save&name=conversation_subscription&id=<%=s.getId()%>">Edit</a>
                    <a href="table?action=remove&name=conversation_subscription&id=<%=s.getId()%>">Remove</a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <div class="row justify-content-md-center">
        <form class="border border-light p-5" method="post" action="${pageContext.request.contextPath}/table">
            <%ConversationSubscription sub = (ConversationSubscription) request.getAttribute("conversation_subscription");%>
            <input type="hidden" name="name" value="conversation_subscription"/>
            <label><input type="hidden" name="id" value="<%=sub.getId()%>"/></label>
            <label>Subscriber: <input type="text" class="form-control" name="subscriber"
                                    value="<%=sub.getSubscriber().getId()%>"/></label>
            <label>Conversation: <input type="text" class="form-control" name="conversation"
                                   value="<%=sub.getConversation().getId()%>"/></label>
            <label>Creation Time: <input type="text" class="form-control" name="creation_time"
                                      value="<%=sub.getCreationTime()%>"/></label>
            <input type="submit" class="btn btn-primary" value="Save"/>
        </form>
    </div>
</div>
</body>
</html>

