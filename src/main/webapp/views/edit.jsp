<%--
  Created by IntelliJ IDEA.
  User: lorem
  Date: 19/04/2024
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="navbar.jsp" />
<div class="col-md-6">
    <h5 class="card-title fw-semibold mb-6">Edit To Do</h5>
    <div class="card">
        <div class="card-header">
            To Do Title
        </div>
        <div class="card-body">
            <h5 class="card-title">Due date</h5>
            <p class="card-text">To Do description</p>
            <a class="nav-link nav-icon-hover" href="javascript:void(0)">
                    <i class="ti ti-circle-minus"></i>
                    <div class="notification bg-primary rounded-circle"></div>
           </a>


        </div>
    </div>
</div>
</body>
</html>
