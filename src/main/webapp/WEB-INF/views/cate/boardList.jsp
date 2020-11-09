<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

@charset "UTF-8";

.blind, .d-none {
	position: absolute;
	clip: rect(0 0 0 0);
	width: 1px;
	height: 1px;
	margin: -1px;
	overflow: hidden;
}

.warning_message {
	font-family: "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", 돋움, dotum, sans-serif;
	letter-spacing: 0;
}

.toggle_switch {
	width: 30px;
}

.toggle_switch .switch_input:checked + .switch_slider {
	background-color: #03c75a;
}

.toggle_switch .switch_input:checked + .switch_slider:before {
	-webkit-transform: translateX(14px);
	-ms-transform: translateX(14px);
	transform: translateX(14px);
}

.toggle_switch .switch_slider {
	position: relative;
	display: block;
	height: 16px;
	padding: 1px;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	border-radius: 30px;
	background-color: #e3e3e3;
	cursor: pointer;
}

.toggle_switch .switch_slider:before {
	content: '';
	display: block;
	width: 14px;
	height: 14px;
	background-color: #fff;
	-webkit-transition: all 0.2s ease;
	transition: all 0.2s ease;
	border-radius: 50%;
	cursor: pointer;
}

.alarm_switch {
	padding-left: 15px;
	float: left;
	line-height: 16px;
	font-size:14px;
}

.alarm_switch .alarm_txt {
	display: inline-block;
	vertical-align: top;
}

.alarm_switch .alarm_txt .point {
	color: #03c75a;
	font-weight: normal;
}

.alarm_switch .switch_box {
	display: inline-block;
	vertical-align: top;
}

.alarm_switch .layer_alarm {
	position: absolute;
	left: 0;
	z-index: 10;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	min-width: 360px;
	padding: 14px 16px;
	border: 1px solid rgba(3, 15, 43, 0.2);
	-webkit-box-shadow: 1px 1px 2px 0 rgba(0, 0, 0, 0.1);
	box-shadow: 1px 1px 2px 0 rgba(0, 0, 0, 0.1);
	background: #ebf1ff;
	color: #222;
}

.alarm_switch .layer_alarm .btn_close {
	position: absolute;
	top: 50%;
	right: 7px;
	padding: 5px;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
}

.alarm_switch .layer_alarm .btn_close:before {
	content: '';
	background-position: -4px -226px;
	width: 16px;
	height: 16px;
}


</style>

<script type="text/javascript">
	$(function() { 
		$('#boardListDisp').load('${path}/board/list.html',"b_c_num=${cate.c_num}");
	});  
</script> 
</head><body>

<div class="container" align="left">
	<h2 align="left" class="text-primary">${cate.c_subject }<img id="bmi2" src="/resources/images/s3.jpg" style="cursor:pointer;margin-bottom:5px;" alt="" /></h2>
<table class="table table-bordered">
	<tr><td><pre>${cate.c_intro }</pre></td></tr>
	<tr>
		<td>
		<div class="alarm_switch">
		        새글 구독
		    <div class="switch_box">
		        <div class="toggle_switch">
		            <input type="checkbox" id="inputSwitch_album" class="switch_input blind" data-identifier="alarm-switch-checkbox">
		            <label class="switch_slider _click(ArticleAlarmConfig|Toggle)" for="inputSwitch_album" data-identifier="alarm-switch-btn"><span class="blind">등록</span></label>
		        </div>
		    </div>
		    <div class="layer_alarm" style="display: none;" data-identifier="alarm-switch-notice">
		        <div class="layer_inner">
		          	<p class="layer_txt">이 게시판의 글을 새글피드에서 볼 수 있습니다.</p>  
		        </div>
		        <button type="button" class="btn_close _click(ArticleAlarmConfig|ClosePopup)"><span class="blind">닫기</span></button>
		    </div>
		</div>
		</td>
	</tr>
</table>
<div id="boardListDisp"></div>
<%-- <jsp:include page="../board/list.jsp"></jsp:include> --%>
</div>

</body>
</html>