<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table id="gbList_${startNum}" class="table table-bordered" style="display:active;float:left;width:840px;">
	<c:if test="${not empty replyList }">
	<c:forEach var="rl" items="${replyList }" varStatus="status">
		<c:if test="${rl.r_del=='y'}">
			<tr style="border-top:1px solid #d9d9d9;">
				<td style="height:80px;font-size:14px;line-height:50%;vertical-align:middle;padding-left:20px">
					<%-- <c:if test="${gbrl.r_level>0 }">┕</c:if> --%>
					삭제된 방명록입니다.
				</td>
			</tr>
		</c:if>
		<c:if test="${rl.r_del!='y'}">
			<tr>
				<td id="gbListTd_${rl.r_num}" style="width:840px;min-height:160px;padding-left:10px;">
				<!-- <img src="/resources/images/i13.jpg" alt="" style="float:left;"/>  -->
				<img width="35" height="35" alt="프로필 사진" style="float:left;margin-top:5px;margin-left:5px;border-radius:50%;box-shadow:0px 0px 0.5px 1px #dfe1e5;" src="${path }/resources/upload/${rl.r_profile}">
				<span style="float:right;font-size:10px;color:#8a8a8a;letter-spacing:1px;" >
					<img src="/resources/images/i11.jpg" alt="" />
					
					<c:if test="${sessionScope.user_id == rl.r_id}">
					 | 
					<a style="color:#8a8a8a;cursor:pointer;" onclick="gbUpdate(${rl.r_num})">수정</a> | 
					<a style="color:#8a8a8a;cursor:pointer;" onclick="gbDelete(${rl.r_b_num},${rl.r_num})">삭제</a>
					</c:if>
				</span>
				<p style="float:left;padding-top:5px;padding-left:7px;font-size:13px;font-weight:bold;">${rl.r_nick }
					<img src="/resources/images/i10.jpg" alt="" />
					<br />
					<span style="float:left;font-size:11px;color:#8f8f8f;font-weight:normal;line-height:10px;">${rl.r_update }</span>	
				</p>
				<textarea style="display:block;float:left;white-space: pre-wrap;font-size:14px;text-align:left;margin-top:10px;margin-left:10px;border:none;outline:none;resize:none;" rows="3" cols="105" readonly="readonly">${rl.r_content }</textarea> 
					<p style="padding-left:10px;font-size:13px;">
						<a id="clickGbRepl_${rl.r_num}" style="float:left;color:#fc2323;text-decoration:underline;cursor:pointer;" onclick="getGbRepl(${rl.gbReply},${rl.r_num})">댓글 ${rl.gbReply}</a>
						
						<c:if test="${sessionScope.user_id != rl.r_id}">
						<a href="" style="float:right;color:black;padding-left:10px;padding-right:10px;margin-top:2px;">신고</a>
						<a href="" style="float:right;color:#8f8f8f;cursor:default;">|</a>
						</c:if>
						
						<a href="" style="float:right;color:black;padding-right:10px;"><img src="/resources/images/i12.jpg" alt="" style="margin-bottom:5px;"/>북마크</a>
					</p>
				<div id="unfold_${rl.r_num}" style="display:none;"></div>
				</td>
			</tr>
		</c:if>
	</c:forEach>
	</c:if>
	<c:if test="${wholeNum>endNum}">
		<tr id="moreKey_${endNum}">
			<td style="width:800px;height:50px;padding:0px;font-size:13px;"><button style="width:100%;height:100%;border:none;outline:none;background-color:#f9f9f9;" onclick="more(${r_b_num},${startNum},${endNum})">더보기</button></td>
		</tr>
	</c:if>
</table>

</body>
</html>