package com.demkom58.jaslab4;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class StarterListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Context initialized");
    }

    public void contextDestroyed(ServletContextEvent sc) {
        System.out.println("Context destroyed");
    }

}
