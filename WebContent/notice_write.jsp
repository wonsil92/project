<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
    	String ctx = request.getContextPath();    //콘텍스트명 얻어오기.
		MemberDto dto = (MemberDto)session.getAttribute("dto");
	%>
<title>Insert title here</title>

<%@ include file="inc/admintopbar.jsp" %>

<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="<%=ctx %>/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>

<!-- ReviewWrite css 참조 -->
<link href="css/ReviewWrite.css" rel="stylesheet">
<link rel="stylesheet" href="dist/jquery.flipster.min.css">
<script src="dist/jquery.min.js"></script>
<script src="dist/jquery.flipster.min.js"></script>

<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/index_menu.css" rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
   rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
   rel="stylesheet">
<link href="css/one-page-wonder.min.css" rel="stylesheet">


<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "content", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "SE2/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : false,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["content"].exec("PASTE_HTML", [""]);
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });    
});

</script>
</head>
<body>

	<div class="container">
		<form id="frm" action="SemiProjectServlet.do" method="post">
		<input type="hidden" name="command" value="noticeinsert">
			<div class="Review_header">
				
				<h4>공지사항</h4>
			</div>
			<hr>


<%--        
        	<div class="subject_form">
				<div class="form-group">
            		<input type="hidden" name="fileid" value="${dto.file_id }">
        		</div>
        	</div>
 --%>
			
			<div class="subject_form">
				<div class="subject">
				제목
				</div>
				<div class="form-group">
            		<input type="text" class="form-control" id="inputSubject" name="title">
        		</div>
        	</div>
        	
        	<!-- 
        	
        	<div class="file_form">
        		<div class="file">
        		파일첨부
        		</div>
        		<div class="fileAttach">
        			<div class="file_name">file.html&nbsp;&nbsp;&nbsp;</div>
        			<a href="#">
        			<img src="img/file.png" alt="파일첨부" class="file_attach">
        			</a>
        		</div>
        	</div>
        	-->
        	
        	<div class="content_form">
        		<div class="content">
        			내용
        			<textarea rows="15" cols="120" id="content" name="content"></textarea>
        		</div>
        	</div>
		
		
		<div class="buttons">
			<button type="button" id="save" class="btn btn-primary">작성하기</button>
			<button type="button" class="btn btn-default" onclick="location.href='SemiProjectServlet.do?command=ntlist'">목록으로</button>
		</div>
		</form>
	</div>





</body>
<%@ include file="inc/footer.jsp" %>
</html>