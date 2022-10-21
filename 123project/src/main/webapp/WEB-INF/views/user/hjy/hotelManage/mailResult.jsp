<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">

</head>
<body>
<div class="header">
	<div class="header_container">
		<div class="logo">
			<a href="${pageContext.request.contextPath}/" class="logo_container">
				<div class="logo_img">
					<svg class="svg_image" viewBox="0 0 190 24">
						<g fill="none">
							<path fill="#2C4162" d="M29.207 23.715V5.735h3.533v7.282h5.574V5.736h3.533v17.939h-3.533v-7.363H32.74v7.363h-3.533zm14.681-5.939c0-3.58 1.885-6.752 5.536-6.752 3.65 0 5.535 3.173 5.535 6.752 0 3.336-1.688 6.183-5.535 6.183-3.848 0-5.536-2.847-5.536-6.183zm3.259-.04c0 2.237.706 3.132 2.277 3.132 1.57 0 2.276-.854 2.276-3.092 0-2.156-.588-3.58-2.276-3.58-1.688-.04-2.277 1.384-2.277 3.54zm9.735-3.58h-1.57v-2.888h1.57v-2.97h3.023v2.97h3.258v2.888h-3.258v4.515c0 1.993.078 2.36.667 2.36.393 0 .51-.204.51-.651 0-.244-.078-.448-.078-.448h2.238s.157.448.157 1.099c0 2.033-1.374 2.928-3.062 2.928-2.356 0-3.494-1.26-3.494-4.108v-5.695h.04zm14.525 5.858c0-.204-.04-.367-.04-.367h2.513s.196.407.196 1.058c0 2.36-2.316 3.295-4.2 3.295-3.808 0-5.653-2.644-5.653-6.224 0-3.539 1.688-6.712 5.457-6.712 2.826 0 4.593 2.034 4.593 4.76a9.467 9.467 0 01-.354 2.522h-6.712c.039 1.87.903 2.888 2.63 2.888 1.256-.04 1.57-.732 1.57-1.22zm-4.083-4.068h4.083c.118-.773-.157-2.115-1.924-2.115-1.727 0-2.159 1.464-2.159 2.115zm8.755 7.769V5.776h3.1v17.94h-3.1zm4.946-3.254c0-.773.314-1.342.314-1.342h2.826s-.157.325-.157.813c0 .854.707 1.261 1.767 1.261 1.02 0 1.649-.407 1.649-1.057 0-.855-.786-1.14-2.12-1.505-1.885-.489-4.044-.936-4.044-3.702 0-2.522 1.806-3.865 4.397-3.865 2.238 0 4.318 1.099 4.318 3.336 0 .65-.196 1.18-.196 1.18h-2.827s.118-.326.118-.651c0-.692-.589-1.098-1.374-1.098-1.099 0-1.57.488-1.57 1.016 0 .651.707.977 2.08 1.302 1.885.448 4.123.976 4.123 3.824 0 2.685-1.806 4.027-4.633 4.027-2.944-.04-4.671-1.464-4.671-3.539z" style="user-select: auto;"></path>
							<path d="M91.899 15.254c0-5.207 2.826-9.478 7.615-9.478 3.77 0 5.653 2.238 5.653 4.882 0 1.098-.235 1.749-.235 1.749h-2.984s.079-.285.079-.936c0-1.302-.785-2.278-2.552-2.278-2.787 0-4.082 2.482-4.082 6.02 0 2.889.981 5.33 4.004 5.33 1.334 0 2.59-.692 2.59-2.645 0-.366-.078-.691-.078-.691h3.023s.196.57.196 1.383c0 3.824-3.023 5.37-5.888 5.37-5.535 0-7.341-3.987-7.341-8.706zm15.153 2.522c0-3.58 1.884-6.752 5.535-6.752 3.65 0 5.535 3.173 5.535 6.752 0 3.336-1.688 6.183-5.535 6.183-3.847 0-5.535-2.847-5.535-6.183zm3.258-.04c0 2.237.707 3.132 2.277 3.132 1.57 0 2.277-.854 2.277-3.092 0-2.156-.59-3.58-2.277-3.58-1.688-.04-2.277 1.384-2.277 3.54zm18.097-5.004c.628-.935 1.649-1.708 3.023-1.708 2.63 0 4.122 1.952 4.122 4.881v7.81l-3.102-.04v-7.2c0-1.587-.55-2.32-1.57-2.32s-1.57.937-1.57 2.279v7.281h-3.101v-7.24c0-1.587-.55-2.32-1.65-2.32-1.059 0-1.609.937-1.609 2.157v7.403h-3.1V11.268h2.983v1.18h.039c.314-.489 1.217-1.424 2.67-1.424 1.413 0 2.394.773 2.865 1.708zm9.186-6.996h3.101v6.345h.04c.588-.61 1.53-1.057 2.63-1.057 3.376 0 4.907 3.01 4.907 6.549 0 3.458-1.57 6.386-4.947 6.386-1.177 0-2.198-.61-2.748-1.342h-.039v1.098h-2.983V5.735h.039zm3.14 12c0 1.586.55 3.172 2.277 3.172 1.531 0 2.277-1.505 2.277-3.091 0-1.953-.51-3.661-2.277-3.661-1.688-.04-2.277 1.79-2.277 3.58zm11.267-12c1.1 0 1.963.895 1.963 2.033 0 1.14-.864 2.034-1.963 2.034-1.1 0-1.963-.895-1.963-2.034.04-1.098.903-2.033 1.963-2.033zm-1.531 5.532h3.101v12.447h-3.101zm8.951 12.447h-3.102V11.268h3.101v1.22h.04c.51-.691 1.334-1.464 2.944-1.464 2.277 0 3.808 1.952 3.808 4.434v8.217h-3.18V16.27c0-1.342-.628-2.156-1.688-2.156-.903 0-1.963.407-1.963 2.563v7.037h.04zm15.466-3.701c0-.204-.039-.367-.039-.367h2.513s.196.407.196 1.058c0 2.36-2.316 3.295-4.2 3.295-3.808 0-5.654-2.644-5.654-6.224 0-3.539 1.688-6.712 5.457-6.712 2.787 0 4.593 2.034 4.593 4.76 0 1.383-.353 2.522-.353 2.522h-6.713c.04 1.87.903 2.888 2.63 2.888 1.256-.04 1.57-.732 1.57-1.22zm-4.082-4.068h4.082c.118-.773-.157-2.115-1.923-2.115-1.727 0-2.16 1.464-2.16 2.115zm18.843 7.769h-2.866v-1.057h-.04c-.47.61-1.57 1.301-2.865 1.301-2.277 0-4.71-1.912-4.71-6.508 0-3.824 2.001-6.427 4.553-6.427 1.335 0 2.238.447 2.787 1.057h.04V5.776h3.1v17.94zm-7.577-5.98c0 2.238 1.139 3.133 2.395 3.133s2.237-1.099 2.237-3.092c0-2.4-.902-3.62-2.237-3.62-1.492 0-2.395 1.22-2.395 3.58zm-158.399.489c0-3.905-.55-9.438-1.216-12.448-.275-1.22-.825-2.115-1.728-2.766A4.641 4.641 0 0019 2.156c-.04 0-.079-.04-.118-.04-2.355-.774-4.553-1.14-6.83-1.1-2.277-.04-4.476.286-6.83 1.1-.04 0-.08.04-.119.04a6.285 6.285 0 00-1.727.854c-.903.651-1.452 1.546-1.727 2.766C.98 8.786.432 14.32.432 18.224c0 1.017.04 1.912.118 2.644.078.813.235 1.424.47 1.668.354.447.904 1.18 3.18 1.18h15.703c2.277 0 2.787-.733 3.18-1.18.235-.244.353-.855.47-1.668.118-.732.158-1.627.118-2.644z" fill="#FFF" style="user-select: auto;"></path>
							<path d="M3.023 5.573c-1.492 0-2.67-1.261-2.67-2.766C.353 1.26 1.57.04 3.023.04c1.491 0 2.67 1.26 2.67 2.766 0 1.505-1.179 2.766-2.67 2.766m18.137.001c-1.493 0-2.67-1.261-2.67-2.766C18.49 1.26 19.707.04 21.16.04c1.49 0 2.669 1.26 2.669 2.766 0 1.505-1.217 2.766-2.67 2.766" fill="#FFF" style="user-select: auto;"></path>
							<path d="M4.79 10.129c-.04.122-.04.285-.04.407.04.854.707 1.545 1.531 1.586.903.04 1.649-.732 1.649-1.627 0-.122 0-.244-.04-.366 0-.082-.117-.163-.196-.163H4.986c-.079 0-.157.04-.197.163m10.913 0c-.039.122-.039.285-.039.407.04.854.707 1.545 1.531 1.586.903.04 1.649-.732 1.649-1.627 0-.122 0-.244-.04-.366-.039-.082-.117-.163-.196-.163H15.9c-.118 0-.197.04-.197.163" fill="#2C4162" style="user-select: auto;"></path>
							<path d="M16.134 17.492c0-.082.04-.123.04-.204v-.366c0-1.424-.629-5.207-1.021-6.671-.04-.163-.157-.244-.353-.285H8.793c-.196.04-.314.163-.353.285-.353 1.464-1.02 5.207-1.02 6.671v.325c0 .936 1.962 2.075 4.357 2.075 2.198 0 4.004-.936 4.318-1.83 0 .04 0 0 .04 0z" fill="#00AEF0" style="user-select: auto;"></path>
							<path d="M14.8 9.966H8.793c-.235.04-.353.203-.353.366 0 .082 0 .163.04.204.196.447.392.895.667 1.342.432.732.903 1.424 1.57 2.075.196.203.432.447.667.65a.715.715 0 00.432.163c.157 0 .314-.04.432-.163.235-.203.432-.406.667-.65.668-.651 1.139-1.343 1.57-2.075.236-.407.472-.854.668-1.342.04-.082.04-.163.04-.204a.47.47 0 00-.393-.366z" fill="#2C4162" style="user-select: auto;"></path>
						</g>
					</svg>
				</div>
			</a>
		</div>
		<div class="nav">
			<ul class="nav_menu">
				<li><a class="nav_hotel"><span>호텔</span></a></li>
				<li><a><span>항공권</span></a></li>
				<li><a><span>렌터카</span></a></li>
				<li><a><span>액티비티</span></a></li>
				<li><a><span>이벤트</span></a></li>
			</ul>
			<div class="nav_account">
				<div class="nav_account_container">
					<div class="nav_mypage">
						<c:choose>
							<c:when test="${empty sessionScope.mid }">
								<!-- 로그인이 안되어있을때 -->
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath }/user/kjy/mypage">마이트립</a>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="nav_login">
				 	<c:choose>
				 		<c:when test="${empty mid }">
							<a href="${pageContext.request.contextPath }/jhr/login">로그인</a>
 						</c:when>			
				 		<c:otherwise>
							<a href="${pageContext.request.contextPath }/jhr/logout">로그아웃</a>
				 		</c:otherwise>
 					</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="login" class="login_container">
	<div class="login_contents">
		<ul class="tab_wrap">
			<li>
				<div class="tab_content">
					<div class="member_login_wrap">
						<div class="login_inner">
							<div class="login_box">
								<div class="login_title" style="text-align: center;">
								<c:choose>
									<c:when test="${result eq 'yes'}">
										호텔이 성공적으로 등록되었습니다.
									</c:when>
									<c:otherwise>
										호텔 등록을 거절했습니다.
									</c:otherwise>
								</c:choose>
								<br>
								<a href="javascript:self.close()" style="color: #00AEF0;">창 닫기</a>
							</div>
						</div>
					</div>
				</div>
			</li>
		</ul>
	</div>
</div>

<div class="footer">
	<div class="footer_container">
		<div class="site_map">
			<div class="site_map_container">
				<div class="nav_column">
					<h6>회사 정보</h6>
					<ul>
						<li><a href="#">호텔스컴바인 소개</a></li>
						<li><a href="#">사이트 작동 방식</a></li>
						<li><a href="#">모바일</a></li>
					</ul>
				</div>
				<div class="nav_column">
					<h6>연락처</h6>
					<ul>
						<li><a href="#">도움말/FAQ</a></li>
						<li><a href="#">숙박시설 관리</a></li>
						<li><a href="#">제휴 프로그램</a></li>
					</ul>
				</div>
				<div class="nav_column">
					<h6>더 보기</h6>
					<ul>
						<li><a href="#">위치별 호텔 검색</a></li>
						<li><a href="#">최저가 보장</a></li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="privacy">
			<div class="privacy_container">
				<a href="#">개인 정보 보호 정책</a>
				<a href="#">쿠키 정책</a>
				<a href="#">이용 약관</a>
				<span>©2021 HotelsCombined</span>
			</div>
		</div>
		
		<div class="description">
			<p>호텔스컴바인에서 전 세계 주요 여행지의 호텔 상품을 최저가로 만나보세요. 수 백개의 호텔 사이트를 검색하여, 고객님께서 딱 맞는 호텔 상품을 바로 찾아 예약하실 수 있도록 도와드립니다. 호텔스컴바인에서는 국내외 유명한 호텔 사이트를 한 번에 검색하여 한눈에 비교할 수 있도록 도와 드리고 있어 특가 상품을 쉽게 찾으실 수 있습니다. 지금 바로 시작해 보세요.</p>
		</div>
		
		<div class="group_logo">
			<div class="group_logo_container">
				<p>호텔스컴바인은 세계적인 온라인 여행 기업 '부킹홀딩스(Booking Holdings Inc.)'의 그룹사입니다.</p>
				<ul>
					<li class="group_logo_booking"></li>
					<li class="group_logo_kayak"></li>
					<li class="group_logo_opentable"></li>
					<li class="group_logo_princeline"></li>
					<li class="group_logo_agoda"></li>
					<li class="group_logo_rentalcars"></li>
				</ul>
			</div>
		</div>
	</div>
</div>
</body>
</html>