<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
  
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style>

body {
	font-family: "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", 돋움, dotum, sans-serif;
}

.cateTitle {

	color: #333;
	font-weight: bolder;
    font-family: "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", 돋움, dotum, sans-serif;
    font-size: 22px;
    line-height: 24px;
    vertical-align: sub;
}

.cateIntro {
	margin-top: 15px;
    font-size: 13px;
    line-height: 15px;
    color: #999;
}

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
	padding-left: 0px;
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


.boardChoose {
	float:right;
}

div.gallery {
  margin: 5px;
  border: none;
  float: left;
  width: 180px;
  height: 280px;
}
div.gallery:hover {
   border: none;
}
div.gallery img {
  width: 100%;
  height: 180px;
}
div.desc {
  padding: 15px;
  text-align: center;
}
* {
  box-sizing: border-box;
}
.responsive {
  padding: 0 6px;
  float: left;
  width: 24.99999%;
}
@media only screen and (max-width: 700px) {
  .responsive {
    width: 49.99999%;
    margin: 6px 0;
  }
}
@media only screen and (max-width: 500px) {
  .responsive {
    width: 100%;
  }
}
.clearfix:after {
  content: "";
  display: table;
  clear: both;
}


.searchSelect {
	outline:none;
	cursor:pointer;
	margin-left:10px;
	width:100px;
	height:30px;
	background-color: white;
	border-radius:2px;
	border:1px solid #cccccc;
	padding-left:10px;
	text-align:left;
}

.searchTxt{
	outline:none;
	margin-left:10px;
	width:250px;
	height:30px;
	background-color: white;
	border-radius:2px;
	border:1px solid #cccccc;
	padding-left:10px;
	text-align:left;
}

.searchBtn {
	cursor:pointer;
	outline:none;
	margin-left:10px;
	width:50px;
	height:30px;
	background-color: white;
	border-radius:2px;
	border:1px solid #cccccc;
	text-align:center;
	vertical-align: bottom;

</style>


<script type="text/javascript">
$(function(){
	$('#bmi2').attr('src',"/resources/images/s3.jpg");
	$('#bmi2').click(function() {
		if($('#bmi2').attr("src")=="/resources/images/s3.jpg"){
			alert("즐겨찾는 게시판 추가");	
			$('#bmi2').attr('src','/resources/images/s4.jpg');
		}else{
			alert("즐겨찾는 게시판 해제");
			$('#bmi2').attr('src','/resources/images/s3.jpg');	
		}
	});
});
</script>
	
</head><body>

<div class="container" align="center" style="margin-left:200px;width:900px;padding-top:10px;padding-bottom:20px;padding-left:40px;">
	<div>
	
	<!-- 카테고리 -->
<div style="height:90px">
	<h2 align="left" class="cateTitle">${cate.c_subject }<img id="bmi2" src="/resources/images/s3.jpg" style="cursor:pointer;margin-left:1px;margin-bottom:5px;" alt="" /></h2>
	<p style="margin-bottom: 10px;" align="left"class="cateIntro"> ${cate.c_intro } </p>	
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
	


	
	<!-- 앨범,목록 선택 -->
<span class= "boardChoose" id="boardChoose" style="align:right;">
  <a href="${path}/board/listWithPhoto.html?b_c_num=${cate.c_num}&pageNum=${pb.currentPage}&search=${board.search}&keyword=${board.keyword}"
     style="color: black" class="btn  glyphicon glyphicon-th-large ">앨범형</a>
  <a href="${path}/board/list.html?b_c_num=${cate.c_num}&pageNum=${pb.currentPage}&search=${board.search}&keyword=${board.keyword}"
     style="color: black"class="btn glyphicon glyphicon-th-list ">목록형</a>   
</span>
</div>

<hr style="border-top:1px solid black;margin-bottom:0px;"/>	


	<!-- 앨범형 게시판  -->
<!-- <div class="container" align="center" style="margin-left:200px;width:900px;padding-top:20px;padding-bottom:20px;"> -->
   <section id="body">
      <div style="float:right;width:840px;padding-top:20px;padding-bottom:20px;">
         <div class="container" style="width:840px;height:910px;padding-top:20px;padding-bottom:20px;border:4px solid #ededed;">
            
            <div class="container" style="padding-top:15px;padding-left:25px;background-color:#ededed;width:800;height:860;">
<div>	
<table>
	<c:forEach var="board" items="${list }">
		<c:if test="${board.b_del != 'y' }">
		
			<div class="gallery">
				<a href="boardView.html?b_c_num=${cate.c_num}&b_num=${board.b_num}&pageNum=${pb.currentPage}">
						<img src="/resources/upload/${board.filename}" alt="${board.filename}">
				</a>

			  
			  <div class="desc" style="align-self: left" >
			  	<p style="line-height:10px;"><a href="boardView.html?b_c_num=${cate.c_num}&b_num=${board.b_num}&pageNum=${pb.currentPage}"
									class="tit" onclick="clickcr(this, 'gnr.ititle','','',event);">
								<span class="inner"><span class="ellipsis">${board.b_subject}</span></span></a> 
								<a href="${path}/replyList.html?r_b_num=100"	class="m-tcol-p">
								<span class="num">[${board.b_reply_cnt}]</span></a></p>
			  	<p style="line-height:10px;"><a href="#" class="m-tcol-c">
							${board.b_nick}</a></p>
			  	<p style="line-height:10px;"><span class="date">${board.b_regdate}</span> <span class="num">. 조회 ${board.b_read_cnt}</span>	</p>
			  </div>
			</div>
			
		</c:if>
	</c:forEach>
</table>
</div>	
            </div>
               
         
         </div>   
      </div>
   </section>
<!-- </div> -->





<div>	
	<!-- 버튼         
	<div align="center">
	<a href="${path}/board/insertBoardForm.html?b_c_num=${cate.c_num}" class="btn btn-info">게시글 입력</a> 
	</div>--> 
	
	<!-- 페이징 -->
	<div align="center">
	   <ul class="pagination">
	      <c:if test="${pb.startPage > pb.pagePerBlock}">
	         <li><a href="listWithPhoto.html?b_c_num=${cate.c_num }&pageNum=1&search=${board.search }&keyword=${board.keyword}">
	                     <span class="glyphicon glyphicon-backward"></span>
	               </a></li>
	               
	               <li><a href="listWithPhoto.html?b_c_num=${cate.c_num }&pageNum=${pb.startPage-1}&search=${board.search }&keyword=${board.keyword}">
	                     <span class="glyphicon glyphicon-triangle-left"></span>
	               </a></li>
	            </c:if>
	            
	            <c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage}">
	               <c:if test="${i == pb.currentPage }">
	                  <!-- 현재 페이지를 보고 있으면 active 효과 -->
	                  <li class="active"><a href="list.html?b_c_num=${cate.c_num }&pageNum=${i}&search=${board.search }&keyword=${board.keyword}">${i}</a></li>
	               </c:if>
	               <c:if test="${i != pb.currentPage }">
	                  <li><a href="listWithPhoto.html?b_c_num=${cate.c_num }&pageNum=${i}&search=${board.search }&keyword=${board.keyword}">${i}</a></li>
	               </c:if>
	            </c:forEach>
	            <c:if test="${pb.endPage < pb.totalPage }">
	               <li><a href="listWithPhoto.html?b_c_num=${cate.c_num }&pageNum=${pb.endPage+1}&search=${board.search }&keyword=${board.keyword}">
	                     <span class="glyphicon glyphicon-triangle-right"></span>
	               </a></li>
	               <li><a href="listWithPhoto.html?b_c_num=${cate.c_num }&pageNum=${pb.totalPage}&search=${board.search }&keyword=${board.keyword}">
	                     <span class="glyphicon glyphicon-triangle-forward"></span>
	               </a></li>
	            </c:if>
	         </ul>
	      </div>
	
	<!-- 검색 + 글 입력 버튼 -->
	<form action="listWithPhoto.html">
	<div>
	   <input type="hidden" name="b_c_num" value="${cate.c_num }"/>
	   <input type="hidden" name="pageNum" value="1" />
	      <select name="search" class="searchSelect">
	         <c:forTokens var="item" items="b_subject,b_nick,b_content,subcon" delims=","
	            varStatus="i">
	            
	            <c:if test="${board.search==item }">
	               <option value="${item }" selected="selected">${tit[i.index]}</option>
	            </c:if>
	            <c:if test="${board.search!=item }">
	            	<option value="${item }">${tit[i.index]}</option>
	            </c:if>
	         </c:forTokens>              
	      </select>
	      <input class="searchTxt" type="text" placeholder="검색어를 입력하세요" name="keyword" value="${board.keyword }" required="required"/>
	      <%-- <input type="text" name="keyword" value="${board.keyword }"/> --%>
	      <button class="searchBtn" type="submit">
		  	<i class="glyphicon glyphicon-search" style="font-size:16px;"></i>
		  </button> 
	</div>
	</form>
</div>

</div>
</div>
</body>
</html>