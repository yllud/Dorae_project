<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/resources/css/style.css"/>
<meta charset="UTF-8">
<title>로그인페이지</title>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	
</script>
 <script>
    // JavaScript 코드
    window.addEventListener('DOMContentLoaded', function () {
        var menuItems = document.querySelectorAll('.menu-item');

        menuItems.forEach(function (menuItem) {
            var submenu = menuItem.querySelector('.submenu');

            menuItem.addEventListener('mouseover', function () {
                submenu.style.display = 'block';
            });

            menuItem.addEventListener('mouseout', function () {
                submenu.style.display = 'none';
            });
        });
    });
</script>
<style>
    /* 화면 가운데 정렬 스타일 */
    .center {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
  </style>
  
</head>
<body>
	<h1><a href="page01.jsp">도래도래</a></h1>
	<div class="menu">
		<nav class="clearfix">
			<ul class="clearfix">
				<!-- <li class="header_li"><a id="menu_search" href="">공연</a></li>
				<li class="header_li"><a id="menu_review" href="">리뷰검색</a></li>
				<li class="header_li"><a id="menu_help" href="">고객센터</a></li>
				<li class="header_li"><a id="menu_mypage" href="">	마이페이지</a></li> -->
								
				<li class="header_li"><a href="../search/search.jsp">공연</a></li>
				
				<div class="dropdown">
					<li class="header_li"><a href="../review/reviewBbs.jsp">커뮤니티</a></li>
						<div class="dropdown-content">
							<a href="../review/reviewBbs.jsp">다녀온 후기</a>
							<a href="../sns/sns.jsp">SNS추천</a>
							<a href="../noticeBbs/noticeBbs.jsp">공지사항</a>
						</div>
				</div>
					
				<li class="header_li"><a href="../help/main">고객센터</a></li> 
				<li class="header_li"><a  href="../mypage/main.jsp">마이페이지</a></li>
				
			</ul>
			<a id="pull" href="#"></a>
		</nav>
	</div>
	<div id="res"></div>
	
	<div class="center">
${email}
<% if(session.getAttribute("email") == null){ %>
	<h3>로그인페이지 입니다.</h3>

	<hr color="orange">
	<!-- 카카오 로그인 -->
	<a class="p-2"
		href="https://kauth.kakao.com/oauth/authorize?client_id=7d82a34e6c4c00f0c8af6bad0d046044&redirect_uri=http://localhost:8888/dorae/login/kakaoLogin&response_type=code">
		<!-- REST_API키 및 REDIRECT_URi는 본인걸로 수정하세요 --> 
		<img src="../resources/img/카카오버튼.png" style="height: 40px">
	</a>
	
	<div id="naver_id_login"></div>
    <!-- //네이버 로그인 버튼 노출 영역 -->
    <script type="text/javascript">
        var naver_id_login = new naver_id_login("AMkeOwuTJY71fYcpifZl", "http://localhost:8888/dorae/login/callback.jsp");
        var state = naver_id_login.getUniqState();
        naver_id_login.setButton("white", 2,40);
        naver_id_login.setDomain("http://localhost:8888/dorae");
        naver_id_login.setState(state);
        //naver_id_login.setPopup();
        naver_id_login.init_naver_id_login();
    </script>
	<br>
	<%}else{ %>
	out.println("<script type='text/javascript'>alert('${nickname} 님이 로그인 하셨습니다');</script>");
	<%} %>
	</div>
</body>
</html>