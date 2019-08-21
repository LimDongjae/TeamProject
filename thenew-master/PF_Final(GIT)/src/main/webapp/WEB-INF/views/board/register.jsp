<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- 앞의 내용은 header에서 이어서 작동한다. -->
<%@include file="../includes/header.jsp"%>

<!-- 
웹 에디터(CKEDITOR 4.11.4 (standard)) 경로 지정
 -->
<script type="text/javascript" src="../resources/ckeditor/ckeditor.js"></script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">후기 & 공지</h1>
	</div>
</div>

<style>
	.uploadResult {
		width: 100%;
		background-color: gray;
	}

	.uploadResult ul {
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
	}

	.uploadResult ul li {
		list-style: none;
		padding: 10px;
	}

	.uploadResult ul li img {
		width: 100px;
	}
</style>

<style>
	.bigPictureWrapper {
		position: absolute;
  		display: none;
  		justify-content: center;
  		align-items: center;
  		top:0%;
  		width:100%;
  		height:100%;
  		background-color: gray; 
  		z-index: 100;
	}

	.bigPicture {
  		position: relative;
  		display:flex;
  		justify-content: center;
  		align-items: center;
	}
</style>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">&nbsp;</div>

			<div class="panel-body">
				
				<form role="form" action="${pageContext.request.contextPath}/board/register" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<!-- 관리자 권한일 경우 공지/새글 선택해서 그에 맞는 value값 전달 -->
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<input type="radio" name="notice" value="0">공지
						<input type="radio" name="notice" value="1" checked>새 글						
					</sec:authorize>
					<!-- 일반 회원 권한일 경우 새 글만 등록할 수 있는데 notice의 value값을 hidden시켜서 전달 -->
					<sec:authorize access="hasRole('ROLE_USER')">
						<input type="hidden" name="notice" value="1">					
					</sec:authorize>
					<div class="form-group">
						<label>제목</label>
						<input class="form-control" name='title'>
					</div>	
	
    				<div class="form-group">
    					<label>내용</label>
    					<!-- CKEDITOR 툴을 사용할 textarea -->    				
    					<textarea class="form-control" name="content" id="editor"></textarea>
    						<script>
							CKEDITOR.replace('editor',
												{ height:500
											});
   						 </script>
					</div>
					
					<div class="form-group">
						<label>작성자</label>
						<input class="form-control" name='writer' value='<sec:authentication property="principal.username"/>' readonly="readonly">
					</div>			
					<button type="submit" class="btn btn-default">저장</button>
					<button type="reset" class="btn btn-default">다시 작성</button>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- 새로 추가하는 부분 -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">첨부 파일</div>
			
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<input type="file" name='uploadFile' multiple>
				</div>
				<div class='uploadResult'>
					<ul></ul>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function(e) {
		var contextPath = sessionStorage.getItem("contextpath");
		
		var formObj = $("form[role='form']");
		$("button[type='submit']").on("click", function(e) {
			e.preventDefault();
			console.log("submit clicked");
			var str = "";
			
			$(".uploadResult ul li").each(function(i, obj) {
				var jobj = $(obj);
				console.dir(jobj);
				console.log("-------------------------");
				console.log(jobj.data("filename"));
				
				str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
			});
			console.log(str);
			formObj.append(str).submit();
		});
		
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; //5MB
		
		function checkExtension(fileName, fileSize) {
			if(fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}
			
			if(regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		var csrfHeaderName ="${_csrf.headerName}"; 
		var csrfTokenValue="${_csrf.token}";
		
		$("input[type='file']").change(function(e) {
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			
			for(var i = 0; i < files.length; i++) {
				if(!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				url: contextPath + '/uploadAjaxAction',
				processData: false,
				contentType: false,
				beforeSend: function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			    },
				data: formData,
				type: 'POST',
				dataType:'json',
				success: function(result) {
					console.log(result);
					showUploadResult(result); //업로드 결과 처리 함수 
				}
			});
		});
		
		function showUploadResult(uploadResultArr) {
			if(!uploadResultArr || uploadResultArr.length == 0){ return; }
			var uploadUL = $(".uploadResult ul");
			var str ="";
			
			$(uploadResultArr).each(function(i, obj) {
        		//image type
				if(obj.image) {
					var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
					str += "<li data-path='"+obj.uploadPath+"'";
					str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'";
					str +" ><div>";
					str += "<span> "+ obj.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' ";
					str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='"+contextPath+"/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str +"</li>";
				} else {
					var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
		    		var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
		      
					str += "<li ";
					str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
					str += "<span> "+ obj.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " ;
					str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='"+contextPath+"/resources/img/attach.png'></a>";
					str += "</div>";
					str +"</li>";
				}

    		});
    
    		uploadUL.append(str);
  		}

  		$(".uploadResult").on("click", "button", function(e){
    		console.log("delete file");
    		var targetFile = $(this).data("file");
    		var type = $(this).data("type");
    
    		var targetLi = $(this).closest("li");
    
    		$.ajax({
      			url: contextPath + '/deleteFile',
      			data: {fileName: targetFile, type:type},
      			beforeSend: function(xhr) {
      				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
      	      	},
      			dataType:'text',
      			type: 'POST',
        		success: function(result){
           			alert(result);
         			targetLi.remove();
         		}
    		});
   		});
	});
</script>

<!-- 뒤의 내용은 footer에서 이어서 작동한다. -->
<%@include file="../includes/footer.jsp"%>