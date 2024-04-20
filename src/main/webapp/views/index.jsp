<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
   <html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">

      <!--=============== REMIXICONS ===============-->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" crossorigin="">

      <!--=============== SWIPER CSS ===============-->
      <link rel="stylesheet" href="../assets/css/swiper-bundle.min.css">

      <!--=============== CSS ===============-->
      <link rel="stylesheet" href="../assets/css/styles2.css">

   </head>
   <jsp:include page="navbar.jsp" />
   <body>
      <section class="container">
         <div class="card__container swiper">
            <div class="card__content">
               <div class="swiper-wrapper">
                  <c:forEach var="task" items="${tasks}">
                  <article class="card__article swiper-slide">
                     <div class="card__image">
                        <img src="../assets/img/${task.type}.jpg" alt="${task.type}" class="card__img">
                        <div class="card__shadow"></div>
                     </div>

                     <div class="card__data
    <c:if test="${task.status.name().equals('OUTDATED')}">card__data--outdated</c:if>
">
                        <h3 class="card__name">${task.title}</h3>
                        <p class="card__description" <c:if test="${task.status.name().equals('OUTDATED')}">  style="color: #00040a;"
                        </c:if>
                        >
                           ${task.description}
                        </p>
                        <a href="<c:url value='/deleteTask?id=${task.id}' />">
                           <i class="ti ti-circle-minus" id="icon-style" title="Delete task"></i>
                           <span class="tooltiptext">Delete task</span>
                        </a>

                           <c:if test="${task.status.name().equals('DONE')}">
                             <a href="<c:url value='/updateStatus?id=${task.id}' />">
                              <i class="ri-refresh-line " id="icon-style2" ></i>
                              <span class="tooltiptext">Mark task as ongoing</span>
                           </c:if>
                           <c:if test="${task.status.name().equals('ONGOING')}">
                                <a href="<c:url value='/updateStatus?id=${task.id}' />">
                              <i class="ti ti-check icon-style" id="icon-style2" ></i>
                              <span class="tooltiptext">Mark task as done</span>
                           </c:if>
                           <c:if test="${task.status.name().equals('OUTDATED')}">
                              <a href="#">
                              <i class="ri-lock-line icon-style" id="icon-style2" ></i>
                              <span class="tooltiptext">Task is outdated</span>
                           </c:if>
                        </a>
                        <p class="status" <c:if test="${task.status.name().equals('OUTDATED')}">  style="color: #00040a;"
                        </c:if>
                        >
                           Status: ${task.status.name()}
                        </p>
                     </div>
                  </article>
                  </c:forEach>
               </div>
            </div>

            <!-- Navigation buttons -->
            <div class="swiper-button-next">
               <i class="ri-arrow-right-s-line"></i>
            </div>
            
            <div class="swiper-button-prev">
               <i class="ri-arrow-left-s-line"></i>
            </div>

            <!-- Pagination -->
            <div class="swiper-pagination"></div>
         </div>
      </section>
      
      <!--=============== SWIPER JS ===============-->
      <script src="../assets/js/swiper-bundle.min.js"></script>

      <!--=============== MAIN JS ===============-->
      <script src="../assets/js/main.js"></script>
   </body>
</html>