<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="../resources/css/freeboard/contentview.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${historyContent.htitle }</title>
<script src="resources/js/login.js"></script>
<script>
   $document.ready(function(){
      
      
   });
      var content;
      var textArea;
   function showAndHide(cid){
      
       content=document.getElementById('content'+cid);
       textArea=document.getElementById('textArea'+cid);   
   
       if(textArea.style.display=='none'){
          content.style.display='none';
          textArea.style.display='';
          document.getElementById('mo'+cid).style.display='';
          document.getElementById('can'+cid).style.display='';
          document.getElementById('sah'+cid).style.display='';
          document.getElementById('de').style.display='';
          document.getElementById('h'+cid).style.display='';
          textArea.focus();
      
       } 
   }
   function showAndHide2(cid) {
       if(content.style.display=='none'){
          content.style.display='none';
          textArea.style.display='none';
          document.getElementById('mo'+cid).style.display='none';
          document.getElementById('can'+cid).style.display='none';
          document.getElementById('sah'+cid).style.display='';
          document.getElementById('de').style.display='';
          document.getElementById('h'+cid).style.display='none';
          content.focus();
       }
   }
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
   <div>
     <h3 class="h1">
        자유게시판
     </h3>
    </div>
    <div style="padding-bottom: 50px">
        <hr>
    </div>
   <table style="padding-left: 720px;">
      <input type="hidden" name="hid" value="${historyContent.hid }">
      <input type="hidden" name="content" value="${historyContent.content }">
      <tr class=view_tr>
         <td class="view_t">제목</td>
         <td class="view_td">${historyContent.htitle }</td>
      </tr> 
      <tr class=view_tr>
         <td class="view_t">내용</td>
         <td class="view_td">${historyContent.hcontent}</td>
      </tr>
      <tr class=view_tr >
         <td class="view_t">아이디</td>
         <td class="view_td" >${historyContent.hname }</td>
      </tr>
      <tr class=view_tr>
         <td class="view_t">첨부파일</td>
         <td class="view_td">
         <a style="text-decoration: none; color: black;" href="download?p=resources/upload/
               &f=${historyContent.hfilesrc }
               &hid=${historyContent.hid }">${historyContent.hfilesrc }</a>
            <c:if test="${historyContent.hfilesrc ==null }">

            </c:if>
         </td>
      </tr>
      <tr class="view_tr">
         <td colspan="10" style="text-align: center;">
         <c:if test="${id eq historyContent.hname }">
                &nbsp;&nbsp;<a class="view_mo" href="historyContent?hid=${historyContent.hid }">수정</a>
               &nbsp;&nbsp;<a class="view_mo" href="../delete?hid=${historyContent.hid }">삭제</a>
         </c:if>
         &nbsp;&nbsp;<a class="view_list" href="historylist">목록보기</a>
         </td>
      </tr>
   </table>
   <br>
   <c:if test="${id ne null }">
   <form action="../reply_test" method="post">
      <table border="0" id=re>
         <tr>
            <td style="font-family: YeonSung;font-size: 30px;">댓글작성</td>
         </tr>
         <tr>
            <input type="hidden" name="htitle" value="${historyContent.htitle }">
            <input type="hidden" name="hid" value="${historyContent.hid }">
            <input type="hidden" name="hname" value="${id }">
            <td><textarea name="content" rows="5" cols="50"
                  placeholder="댓글을 입력하세요"></textarea></td>
            <td><input type="submit" value="작성" id="reply"></td>
         </tr>
         <tr>
         </tr>
      </table>
   </form>
   </c:if>
 <div style="padding-top: 50px;">
      <hr>
 </div>
 <h3 class="h3">댓글</h3>
 <c:forEach items="${reply_view }" var="dto" >
      <table border="0" id="rep">
         <div>
         <form action="../replyModify" method="post">
            <tr>
               <td class="reply_td">
               ${dto.hname } &nbsp;&nbsp;
               ${dto.content }&nbsp;&nbsp;&nbsp;&nbsp;
               <input id="content${dto.cid}" value="${dto.content }" style="display:none;">
               <input type="hidden" name="cid" value="${dto.cid }" /> 
               <input type="hidden" name="hid" value="${historyContent.hid }" /> 
               <input type="hidden" name="htitle" value="${historyContent.htitle }"> 
               <c:if test="${id eq  dto.hname}">
                     <input id="sah${dto.cid}" type="button" onClick="javascript:showAndHide(${dto.cid})" value="수정"
                     style="background-color:white;  font-size: 20px; font-family: YeonSung; 
                     border: 1px solid black; border-radius: 5px;"/>
                  </c:if> 
                  <c:if test="${id eq  dto.hname}">
                     <a id="de" href="../replyDelete?cid=${dto.cid }&hid=${historyContent.hid}&htitle=${historyContent.htitle}">
                     삭제
                     </a>
                  </c:if>
               </td>
            </tr>
            <tr>
               <td style="padding-left: 110px; padding-bottom: 20px;">
               <h3 id="h${dto.cid}" style="display:none;">댓글수정</h3>
               <input type="text" id="textArea${dto.cid}" class="content" name="content" value="${dto.content }" style="display:none;" />
               <input id="mo${dto.cid}" type="submit" value="완료" size="50" style="display: none;
               background-color:white;  font-size: 20px; font-family: YeonSung; 
                     border: 1px solid black; border-radius: 5px;">
               <input id="can${dto.cid}" type="button" onclick="javascript:showAndHide2(${dto.cid})" value="취소" style="display: none;
               background-color:white;  font-size: 20px; font-family: YeonSung; 
                     border: 1px solid black; border-radius: 5px; "></td>
            </tr>
         </form>
         </div>
      </table>
   </c:forEach>
</body>
   <foorter class="footer">
            <div class="copyright">
               <p>All content copyright KoreanHistory co, ltd.</p>
            </div>
     </foorter>
</html>