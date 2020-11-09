<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>

<style>
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
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
	align:left;
	margin-top: 15px;
	 margin-bottom: 10px;
    font-size: 13px;
    line-height: 15px;
    color: #999;
}

.cateKeyword {
    font-size: 15px;
    color: #03c75a;
}

.boardChoose {
	float:right;
}

table {
	border-spacing: 2px;
}

.tHead tr {
	align : center;
	vertical-align: middle;
    border-bottom-color: #f2f2f2;
    color: #4e4e4e;
    
    height: 50px;
    padding: 2px;
    
    border-bottom: 1px solid #f2f2f2;
    text-align: center;
    font-weight: bolder;
    font-size: 15px;
}

.tBody tr {
	align : center;
	vertical-align: middle;
    border-bottom-color: #f2f2f2;
    color: #4e4e4e;
    
    height: 40px;
    padding: 2px;
    
    border-bottom: 1px solid #f2f2f2;
    text-align: center;
    
    font-size: 13px;
}

.boardSubject {
	all:unset;
	cursor:pointer;

    color: #4e4e4e;
    
    font-size: 13px;
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
}


</style>

<script type="text/javascript">
var searchKeyword = '${board.keyword}';

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

 	if(searchKeyword!=null&&searchKeyword!=''){
		$('.boardSubject:contains('+searchKeyword+')').css({color:"#03c75a"});
 	}
});
</script>

</head><body>


<div class="container" align="center" style="margin-left:200px;width:900px;padding-top:10px;padding-bottom:2px; padding-left:40px">

<!-- 카테고리 -->
<div style="height:90px" align="left" >
<c:if test="${board.totalSearch == false}">
	<h2 class="cateTitle">${cate.c_subject}<img id="bmi2" src="/resources/images/s3.jpg" style="cursor:pointer;margin-left:1px;margin-bottom:5px;" alt="" /></h2>
	<c:if test="${empty board.keyword }">
		<p style="margin-bottom: 10px;" align="left"class="cateIntro"> ${cate.c_intro } </p>	
	</c:if>
	<c:if test="${not empty board.keyword }">
		<p class="cateIntro"><span class="cateKeyword">${board.keyword}</span> 키워드로 검색한 결과입니다.</p>	
	</c:if>
</c:if>
<c:if test="${board.totalSearch == true}">
	<h2 class="cateTitle">전체 검색</h2>
	<p class="cateIntro"><span class="cateKeyword">${board.keyword}</span> 키워드로 검색한 결과입니다.</p>	
</c:if>
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


<!-- 목록형 게시판 -->
<div id="boardBody">
<!-- <table class="table table-striped table-bordered"> -->
<table align="center">

<thead class="tHead"> 
   <tr align="center"><td width=88> No.</td>
      <td width=438 >제목</td>
      <td width=118>작성자</td>
      <td width=80>작성일</td>
      <td width=68>조회수</td>
      <td width=68>좋아요</td></tr>
 </thead>
 
 <tbody class="tBody">
<c:if test="${empty list }">
   <tr><td colspan="6">데이터가 없습니다</td></tr>
</c:if>      
<c:if test="${not empty list }">

<c:forEach var="board" items="${list }">

<c:if test="${board.b_del != 'y'}">
   <tr align="center"><td>${board.b_num }</td>
<%--    <c:if test="${board.del == 'y'}">
      <td colspan="5">삭제된 글입니다</td>
   </c:if> --%>

      <td title="${board.b_content}">
         <c:if test="${board.b_read_cnt > 30 }">
         <img src="${path }/resources/images/hot.gif" alt="" />
         </c:if>
         <a class="boardSubject" href="boardView.html?b_c_num=${board.b_c_num}&b_num=${board.b_num}&pageNum=${pb.currentPage}">
          	${board.b_subject}
         </a>
      </td>
      <td>${board.b_nick}</td>
      <td>${board.b_regdate }</td>
      <td>${board.b_read_cnt }</td>
      <td>${board.b_like_cnt }</td>
   </tr>
</c:if>   
</c:forEach>
</c:if>
</tbody>
</table>

<c:if test="${board.totalSearch == false }">
<!-- 버튼 -->         
<div align="right" style="padding-top:15px">

<a href="${path}/board/insertBoardForm.html?b_c_num=${cate.c_num}" class="btn btn-default">게시글 입력</a> 
</div>

<!-- 페이징 ; 일반리스트/일반검색용 -->
<div align="center">
   <ul class="pagination">
      <c:if test="${pb.startPage > pb.pagePerBlock}">
         <li><a href="list.html?b_c_num=${cate.c_num }&pageNum=1&search=${board.search }&keyword=${board.keyword}">
                     <span class="glyphicon glyphicon-backward"></span>
             </a></li>
               
          <li><a href="list.html?b_c_num=${cate.c_num }&pageNum=${pb.startPage-1}&search=${board.search }&keyword=${board.keyword}">
                <span class="glyphicon glyphicon-triangle-left"></span>
          	</a></li>
   	  </c:if>
            
      <c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage}">
         <c:if test="${i == pb.currentPage }">
            <!-- 현재 페이지를 보고 있으면 active 효과 -->
            <li class="active"><a href="list.html?b_c_num=${cate.c_num }&pageNum=${i}&search=${board.search }&keyword=${board.keyword}">${i}</a></li>
         </c:if>
         <c:if test="${i != pb.currentPage }">
            <li><a href="list.html?b_c_num=${cate.c_num }&pageNum=${i}&search=${board.search }&keyword=${board.keyword}">${i}</a></li>
         </c:if>
      </c:forEach>
            
      <c:if test="${pb.endPage < pb.totalPage }">
         <li><a href="list.html?b_c_num=${cate.c_num }&pageNum=${pb.endPage+1}&search=${board.search }&keyword=${board.keyword}">
               <span class="glyphicon glyphicon-triangle-right"></span>
         	 </a>
         </li>
         <li><a href="list.html?b_c_num=${cate.c_num }&pageNum=${pb.totalPage}&search=${board.search }&keyword=${board.keyword}">
               <span class="glyphicon glyphicon-triangle-forward"></span>
         	 </a>
         </li>
      </c:if>
  </ul>
</div>

<!-- 검색 -->
<form action="list.html" class="form-inline">
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
</c:if>

<!-- 페이징 ; 전체검색용 -->
<c:if test="${board.totalSearch == true }">
<div align="center">
   <ul class="pagination">
      <c:if test="${pb.startPage > pb.pagePerBlock}">
         <li><a href="list.html?b_c_num=0&pageNum=1&search=${board.search }&keyword=${board.keyword}">
                     <span class="glyphicon glyphicon-backward"></span>
             </a></li>
               
          <li><a href="list.html?b_c_num=0&pageNum=${pb.startPage-1}&search=${board.search }&keyword=${board.keyword}">
                <span class="glyphicon glyphicon-triangle-left"></span>
          	</a></li>
   	  </c:if>
            
      <c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage}">
         <c:if test="${i == pb.currentPage }">
            <!-- 현재 페이지를 보고 있으면 active 효과 -->
            <li class="active"><a href="list.html?b_c_num=0&pageNum=${i}&search=${board.search }&keyword=${board.keyword}">${i}</a></li>
         </c:if>
         <c:if test="${i != pb.currentPage }">
            <li><a href="list.html?b_c_num=0&pageNum=${i}&search=${board.search }&keyword=${board.keyword}">${i}</a></li>
         </c:if>
      </c:forEach>
            
      <c:if test="${pb.endPage < pb.totalPage }">
         <li><a href="list.html?b_c_num=0&pageNum=${pb.endPage+1}&search=${board.search }&keyword=${board.keyword}">
               <span class="glyphicon glyphicon-triangle-right"></span>
         	 </a>
         </li>
         <li><a href="list.html?b_c_num=0&pageNum=${pb.totalPage}&search=${board.search }&keyword=${board.keyword}">
               <span class="glyphicon glyphicon-triangle-forward"></span>
         	 </a>
         </li>
      </c:if>
  </ul>
</div>
</c:if>

</div>
</div>
</body>
</html>