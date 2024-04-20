<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="navbar.jsp" />
      <!--  Header End -->
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-3 d-flex align-items-stretch">
            <div class="card w-100">
              <div class="card-body p-4">
                <div class="mb-4">
                  <h5 class="card-title fw-semibold">Number of tasks</h5>
                </div>
                <div class="mb-4">
                  <h3 class="card-body fw-bold text-center" style="color: #00040a;">${numberoftasks}</h3>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 d-flex align-items-stretch">
            <div class="card w-100">
              <div class="card-body p-4">
                <div class="mb-4">
                  <h5 class="card-title fw-semibold" >Done tasks</h5>
                </div>
                <div class="mb-4">
                  <h3 class="card-body fw-bold text-center" style="color: #00040a;">${donetasks}</h3>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 d-flex align-items-stretch">
            <div class="card w-100">
              <div class="card-body p-4">
                <div class="mb-4">
                  <h5 class="card-title fw-semibold">Ongoing tasks</h5>
                </div>
                <div class="mb-4">
                  <h3 class="card-body fw-bold text-center" style="color: #00040a;">${ongoingtasks}</h3>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 d-flex align-items-stretch">
            <div class="card w-100">
              <div class="card-body p-4">
                <div class="mb-4">
                  <h5 class="card-title fw-semibold">Outdated tasks</h5>
                </div>
                <div class="mb-4">
                  <h3 class="card-body fw-bold text-center" style="color: #00040a;">${outdatedtasks}</h3>
                </div>
              </div>
            </div>
          </div>

        </div>


        <div class="row">
          <div class="col-lg-4 d-flex align-items-stretch">
            <div class="card w-100">
              <div class="card-body p-4">
                <div class="mb-4">
                  <h5 class="card-title fw-semibold">Close Tasks</h5>
                </div>
                <ul class="timeline-widget mb-0 position-relative mb-n5">
                  <c:if test="${not empty closetasks}">
                  <c:forEach items="${closetasks}" var="closetask">
                  <li class="timeline-item d-flex position-relative overflow-hidden">
                    <div class="timeline-time text-dark flex-shrink-0 text-end">
                      <fmt:formatDate value="${closetask.dueDate}" pattern="yyyy-MM-dd" />
                    </div>
                    <div class="timeline-badge-wrap d-flex flex-column align-items-center">
                      <c:if test="${closetask.status.name().equals('OUTDATED')}">
                        <span class="timeline-badge border-2 border border-danger flex-shrink-0 my-8"></span>
                      </c:if>
                      <c:if test="${closetask.status.name().equals('DONE')}">
                        <span class="timeline-badge border-2 border border-success flex-shrink-0 my-8"></span>
                      </c:if>  <c:if test="${closetask.status.name().equals('ONGOING')}">
                      <span class="timeline-badge border-2 border border-primary flex-shrink-0 my-8"></span>
                    </c:if>

                      <span class="timeline-badge-border d-block flex-shrink-0"></span>
                    </div>
                    <div class="timeline-desc fs-3 text-dark mt-n1">${closetask.title}</div>
                  </li>
                  </c:forEach>
                  </c:if>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-lg-8 d-flex align-items-stretch">
            <div class="card w-100">
              <div class="card-body p-4">
                <h5 class="card-title fw-semibold mb-4">Tasks</h5>
                <div class="table-responsive">
                  <table class="table text-nowrap mb-0 align-middle">
                    <thead class="text-dark fs-4">
                      <tr>
                        <th class="border-bottom-0">
                          <h6 class="fw-semibold mb-0">Id</h6>
                        </th>
                        <th class="border-bottom-0">
                          <h6 class="fw-semibold mb-0">Type</h6>
                        </th>
                        <th class="border-bottom-0">
                          <h6 class="fw-semibold mb-0">Title</h6>
                        </th>
                        <th class="border-bottom-0">
                          <h6 class="fw-semibold mb-0">Status</h6>
                        </th>
                        <th class="border-bottom-0">
                          <h6 class="fw-semibold mb-0">Edit</h6>
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${tasks}" var="task">
                      <tr>
                        <td class="border-bottom-0"><h6 class="fw-semibold mb-0">1</h6></td>
                        <td class="border-bottom-0">
                            <h6 class="fw-semibold mb-1">${task.type}</h6>
                        </td>
                        <td class="border-bottom-0">
                          <p class="mb-0 fw-normal">${task.title}</p>
                        </td>
                        <td class="border-bottom-0">
                          <div class="d-flex align-items-center gap-2">
                            <c:if test="${task.status.name().equals('OUTDATED')}">
                            <span class="badge bg-danger rounded-3 fw-semibold">${task.status}</span>
                            </c:if>
                            <c:if test="${task.status.name().equals('ONGOING')}">
                            <span class="badge bg-primary rounded-3 fw-semibold">${task.status}</span>
                            </c:if>
                            <c:if test="${task.status.name().equals('DONE')}">
                              <span class="badge bg-success rounded-3 fw-semibold">${task.status}</span>
                            </c:if>
                          </div>
                        </td>
                        <td class="border-bottom-0">
                          <h6 class="fw-semibold mb-0 fs-4">
                            <a href="${pageContext.request.contextPath}/updateTask">Update</a>
                          </h6>
                        </td>
                      </tr>
                    </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
    </div>
  <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
  <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="../assets/js/sidebarmenu.js"></script>
  <script src="../assets/js/app.min.js"></script>
  <script src="../assets/libs/apexcharts/dist/apexcharts.min.js"></script>
  <script src="../assets/libs/simplebar/dist/simplebar.js"></script>
  <script src="../assets/js/dashboard.js"></script>
</body>

</html>