<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp"%>
<!-- 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<link rel="stylesheet" href="/resources/demos/style.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
-->
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">이사 견적 신청서</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<style>
	.input_left{
		float:left;
	}
	.radio_left{
		border: 1px;
		float: left;
		width:15%;
		padding:3px;
	}
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/190515/1557895495730/190515.js"></script>

<form role="form" action="${pageContext.request.contextPath}/estimate/estimate" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">●개인정보</div>
				<div class="panel-body">				
					<div class="form-group">
						<label>*신청인</label>
						<input name="name" type="text" size="18" value="<sec:authentication property="principal.name"/>">
		                 &nbsp;&nbsp;(실명을 적어주세요)
					</div>
					<div class="form-group">
						<label>*휴대폰</label>
						<input name="phone" type="text" size="18" style="ime-mode:disabled"
	                  onkeypress="onlyNumber()" maxlength="12" onkeyup=""placeholder="ex)01012345678" value="<sec:authentication property="principal.phone"/>">
	                   &nbsp;&nbsp;("-" 없이 적어주세요)
					</div>
				</div>
			</div>
			<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">●이사 정보</div>
						      		<div class="panel-body">
										<div class="form-group">
											<label>이사 제목</label>
											<input name="title" type="text" size="90" class="">
										</div>
										<div class="form-group">
											<label>출발주소</label>
											<div class="address1">
						                      <input name="departure" id="departure" type="text" size="7" readonly class="">
						                      <input type="button" onclick="expandDaumPostcode()" value="우편번호찾기">
						                      </div>	
						                    <div class="address1">
						                      <input name="departure" id="departure1" type="text" size="90" readonly class="">
						                    </div>
						                    <div class="address1">
						                      <input name="departure" id="departure2" type="text" size="90" class="" placeholder="상세주소">
						                    </div>
						                     <div id="addrsearch">
						                      </div>
						                     
										</div>
										<div class="form-group">
											<label>도착주소</label>
											  <div class="address2">
						                      <input name="arrive" id="ARRIVE" type="text" size="7" readonly="" class="">
						                      <input type="button" onclick="expandDaumPostcode2()" value="우편번호찾기">
						                      </div>
						                    <div class="address2">
						                      <input name="arrive" id="ARRIVE1" type="text" size="90" readonly="" class="">
						                    </div>
						                    <div class="address2">
						                      <input name="arrive" id="ARRIVE2" type="text" size="90" class="" placeholder="상세주소">
						                    </div>
						                     <div id="addrsearch2">
						                     </div>
						 
										</div>
										<div class="form-group">
										<label>이사분류</label><br>	
										<div class="radio_left">
										<input class="input_left" name="move" id="move" type="radio" value="일반이사" class="radio">일반이사 
										</div>
										<div class="radio_left">  
										<input class="input_left" name="move" id="move" type="radio" value="포장이사" class="radio">포장이사 
										</div>
										<div class="radio_left">
										<input class="input_left" name="move" id="move" type="radio" value="반포장이사" class="radio">반포장이사 
										</div>
										<div class="radio_left">
										<input class="input_left" name="move" id="move" type="radio" value="기타" class="radio">기타 
										</div>
										</div>
										<br>
										<div class="form-group">
											<label>이사예정일</label>
											<p><input type="date" name="depDate"/></p>	
										</div>
										<div class="form-group">
											<label>요구 사항</label><br>
											<textarea name="content" cols="90" rows="8" id="content"></textarea>
										</div>
									</div>
						</div>
					</div>
					<!-- 새로 추가하는 부분 -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">사진 첨부</div>
<!-- 			/.panel-heading -->
			
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<input type="file" name='uploadFile' multiple>
				</div>
				<div class='uploadResult'>
					<ul></ul>
				</div>
			</div>
<!-- 			 end panel-body -->
		</div>
<!-- 		 end panel-body -->
	</div>
<!-- 	end panel -->
</div> 
<!-- /.row -->
					
					<button type="submit" class="btn btn-default">저장</button>
					<button type="reset" class="btn btn-default">취소</button>
					<button type="button" onclick="location.href='estimatelist'">목록</button>
	
			</div>
		</div>
	</div>
</form>
<!-- /.row -->


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
			}); //$.ajax
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
    		}); //$.ajax
   		});
	}); 
</script>
<script>
    // 우편번호 찾기 iframe을 넣을 element
    var element = document.getElementById('addrsearch');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element.style.display = 'none';
    }

    function expandDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
				// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 우편번호와 주소 및 영문주소 정보를 해당 필드에 넣는다.
                document.getElementById('departure').value = data.zonecode;
                document.getElementById('departure1').value = fullRoadAddr;
                // iframe을 넣은 element를 안보이게 한다.
                element.style.display = 'none';
                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
				document.getElementById('departure2').focus();

            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분.
            // iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element.style.height = size.height + "px";
            },
            width : '100%',
            height : '100%'
        }).embed(element);

        // iframe을 넣은 element를 보이게 한다.
        element.style.display = 'block';
    }
    
    
    // 우편번호 찾기 iframe을 넣을 element
    var element2 = document.getElementById('addrsearch2');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element2.style.display = 'none';
    }

    function expandDaumPostcode2() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
				// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 우편번호와 주소 및 영문주소 정보를 해당 필드에 넣는다.
                document.getElementById('ARRIVE').value = data.zonecode;
                document.getElementById('ARRIVE1').value = fullRoadAddr;
                // iframe을 넣은 element를 안보이게 한다.
                element2.style.display = 'none';
                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
				document.getElementById('ARRIVE2').focus();

            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분.
            // iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element2.style.height = size.height + "px";
            },
            width : '100%',
            height : '100%'
        }).embed(element2);

        // iframe을 넣은 element를 보이게 한다.
        element2.style.display = 'block';
    }
    
</script>

<%@include file="../includes/footer.jsp"%>
