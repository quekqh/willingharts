<%-- 
    Document   : staffProtect
    Created on : 7 Oct, 2016, 8:15:04 PM
    Author     : Asus
--%>

<%@page import="fyp.hms.dao.RoleDAO"%>
<%@page import="fyp.hms.model.Role"%>
<%@page import="fyp.hms.dao.UserDAO"%>
<%@page import="fyp.hms.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String username = (String) session.getAttribute("username");
            
            if(username != null){
                User user = UserDAO.retrieveUser(username);
                if (user != null) {
                    int userRole = user.getRole();
                    Role role = RoleDAO.retrieveRoleById(userRole);
                    String roleDesc = role.getRoleDescription();

                    if(!roleDesc.equals("admin")&& !roleDesc.equals("staff") && !roleDesc.equals("freelancer")){
                        response.sendRedirect("login.jsp");
                        
                    }
                    
                } 
                
                
            }else{
            
                response.sendRedirect("login.jsp");
            }
        %>
    </body>
</html>
