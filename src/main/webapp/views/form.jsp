<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="navbar.jsp" />
<div class="container-fluid">
    <div class="container-fluid">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title fw-semibold mb-4">Add task</h5>
                <div class="card">
                    <div class="card-body">
                        <form:form action="/addTask" method="POST" modelAttribute="task">
                            <div class="mb-3">
                                <label for="title" class="form-label">Task Title</label>
                                <form:input path="title" cssClass="form-control"/>
                            </div>
                            <div class="mb-3">
                                <label for="description" class="form-label">Task Description</label>
                                <form:textarea path="description" class="form-control" id="taskDescription"/>
                            </div>
                            <div class="mb-3">
                                <label for="type" class="form-label">Task Type</label>
                                <form:select path="type" class="form-select">
                                    <c:forEach var="type" items="${types}">
                                        <form:option value="${type}">${type}</form:option>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <div class="mb-3">
                                <label for="status" class="form-label">Task Status</label>
                                <form:select path="status" class="form-select">
                                    <c:forEach var="status" items="${statuses}">
                                        <form:option value="${status}">${status}</form:option>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <div class="mb-3">
                                <label for="addedDate" class="form-label">Task Added Date</label>
                                <form:input type="date" path="addedDate" cssClass="form-control"/>
                            </div>
                            <div class="mb-3">
                                <label for="dueDate" class="form-label">Task Due Date</label>
                                <form:input type="date" path="dueDate" cssClass="form-control"/>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>