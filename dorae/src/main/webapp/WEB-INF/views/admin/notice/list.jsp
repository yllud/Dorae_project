<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	<h1 class="h2">공지사항 목록 페이지</h1>
</div>
<div class="table-responsive">
	<table class="table table-striped table-hover aling-middle">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">제목</th>
				<th scope="col">등록일</th>
				<th scope="col">태그</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${noticeList }" var="item">
				<tr>
					<td>${item.notice_id }</td>
					<td><button class="btn btn-link" value="/dorae/admin/notice/one?notice_id=${item.notice_id }" onclick="goToPage(this)">${item.title }</button></td>
					<td>${item.created_at }</td>
					<td>${item.tag }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- 하단 페이지 버튼 -->
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	    <li class="page-item <c:if test="${page.startPage == 1 }">disabled</c:if>">
	      <button class="page-link" value="/dorae/admin/notice/list?page=${page.startPage - 1 }" onclick="goToPage(this)">&lt;</button>
	    </li>
	    <c:forEach begin="${page.startPage }" end="${page.endPage }" var="p">
			<li class="page-item">
				<button class="page-link <c:if test="${page.page eq p }">active</c:if>" value="/dorae/admin/notice/list?page=${p }" onclick="goToPage(this)">${p }</button>
			</li>
		</c:forEach>
	    <li class="page-item <c:if test="${page.endPage == page.lastPage}">disabled</c:if>">
	      <button class="page-link" value="/dorae/admin/notice/list?page=${page.endPage + 1 }" onclick="goToPage(this)">&gt;</button>
	    </li>
	  </ul>
	</nav>

</div>