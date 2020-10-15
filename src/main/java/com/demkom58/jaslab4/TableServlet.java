package com.demkom58.jaslab4;

import com.demkom58.jaslab3.model.*;
import com.demkom58.jaslab3.repo.CrudRepository;
import com.demkom58.jaslab4.config.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.function.Supplier;

@WebServlet(name = "TableServlet")
public class TableServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String action = request.getParameter("action");

        Database database = Database.getDatabase();

        switch (name) {
            case "conversation":
                handle(request, name, action, database.getConversationRepository(), Conversation::createEmpty);
                break;
            case "conversation_subscription":
                handle(request, name, action, database.getConversationSubscriptionRepository(), ConversationSubscription::createEmpty);
                break;
            case "group":
                handle(request, name, action, database.getGroupRepository(), Group::createEmpty);
                break;
            case "group_subscription":
                handle(request, name, action, database.getGroupSubscriptionRepository(), GroupSubscription::createEmpty);
                break;
            case "message":
                handle(request, name, action, database.getMessageRepository(), Message::createEmpty);
                break;
            case "post":
                handle(request, name, action, database.getPostRepository(), Post::createEmpty);
                break;
            case "user":
                handle(request, name, action, database.getUserRepository(), User::createEmpty);
                break;
            default: {
                response.sendError(404);
                return;
            }
        }

        request.getRequestDispatcher(name + ".jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        final String name = request.getParameter("name");
        switch (name) {
            case "conversation":
                Database.getDatabase().getConversationRepository().save(Conversation.create(request));
                break;
            case "conversation_subscription":
                Database.getDatabase().getConversationSubscriptionRepository().save(ConversationSubscription.create(request));
                break;
            case "group":
                Database.getDatabase().getGroupRepository().save(Group.create(request));
                break;
            case "group_subscription":
                Database.getDatabase().getGroupSubscriptionRepository().save(GroupSubscription.create(request));
                break;
            case "message":
                Database.getDatabase().getMessageRepository().save(Message.create(request));
                break;
            case "post":
                Database.getDatabase().getPostRepository().save(Post.create(request));
                break;
            case "user":
                Database.getDatabase().getUserRepository().save(User.create(request));
                break;
            default:
                response.sendError(404);
                return;
        }

        doGet(request, response);
    }

    private <T> void handle(HttpServletRequest request, String name, String action, CrudRepository<Integer, T> repo, Supplier<T> creator) {
        final String strId = request.getParameter("id");
        if (strId == null || strId.isEmpty())
            request.setAttribute(name, creator.get());
        else {
            final int id = Integer.parseInt(strId);

            if (id > 0) {
                if ("remove".equals(action)) {
                    repo.removeById(id);
                    request.setAttribute(name, creator.get());
                } else request.setAttribute(name, repo.getById(id));
            } else request.setAttribute(name, creator.get());
        }

        request.setAttribute("objects", repo.getAll());
    }

}