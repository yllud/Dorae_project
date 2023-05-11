<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.13/flatpickr.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.13/themes/material_blue.min.css">
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.13/flatpickr.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.13/l10n/ko.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.13/plugins/minMaxTimePlugin.min.js"></script>

<script type="text/javascript">
$(function() {
	$("#selector").flatpickr({
	//달력 설정
	    dateFormat: 'Y-m-d H:i',         // 선택한 날짜, 시간 input에 표시되는 형식(송신용)
	    enable: [{ from: "${vo.play_start}", to: "${vo.play_end}"}],  // 특정날짜만 가능
	    minDate: "today",         		 // 최소 선택 날짜(이전날짜 선택 불가능)
	    maxDate: new Date().fp_incr(30), // 최대 선택 가능 날짜    
	    
	    // disable: [function(date) { 		 // return true to disable
	    //	return (date.getDay() === 1);}], // 요일 비활성화(일요일 0)    
	  //disable: [new Date(), new Date().fp_incr(2), new Date().fp_incr(4)], // 날짜 비활성화
	    
	//시간 설정
	    enableTime: true,  				 // 시간 선택 가능
	    time_24hr: true, 				 // 24시간 단위
	    minTime: "11:00" ,				 // 선택가능 최소 시간				 
	    maxTime: "17:00",  				 // 선택가능 최대 시간
	    hourIncrement: 2, 				 // 시간 간격
	    minuteIncrement: "30", 		     // 분 단위 설정
	    plugins: [new minMaxTimePlugin({             
	    	table: {"2023-05-12": {minTime: "16:00", maxTime: "16:00"}} 
	    })],  // 하루 선택가능 최소시간, 최대시간 
	    inline: true, 					 // 항상 열려있도록
	    locale: 'ko',                	 // 한국어
	    disableMobile: true,          	 // 모바일 지원 
	    
	   
	  
	  }); //selector flatpickr
}) //$

</script>
</head>
<body>
${vo.genre_name} || ${vo.play_name}
<hr>

<img src="${vo.poster}" width="400" height="500"><br>
장소 ${vo.stage_name}<br>
기간 ${vo.play_start} ~ ${vo.play_end}<br>
시간 ${vo.play_time}<br>
가격 ${vo.price}<br>
캐스트 ${vo.casting}<br>
<hr>
<!-- 달력 위치 -->
관람 날짜, 시간: <input id="selector"><br>
<div class="flatpickr"></div> 
 
<button type="submit">좌석선택</button>
<hr>

<!--  좌석선택: <input id="seat" value="1층 C구역 2열 2"><br>
결제금액: <input id="money" value="140000"><br>
구매자이름: <input id="name" value="이아람"><br>
전화번호: <input id="tel" value="010-4808-1750"><br>
이메일: <input id="email" value="ahryee@hanmail.net">
	<button type="button" id= b1>결제하기</button> -->
	
<div id='b'></div>
	
</body>
</html>