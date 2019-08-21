<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp"%>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">estimate Modify</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">견적 신청서 수정</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="${pageContext.request.contextPath}/estimate/modify" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					
					<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
					<input type='hidden' name='amount'	value='<c:out value="${cri.amount }"/>'>
					<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
					<input type='hidden' name='keyword'	value='<c:out value="${cri.keyword }"/>'>

					<div class="form-group">
						<label>Eno</label>
						<input class="form-control" name='eno' value='<c:out value="${estimate.eno}"/>' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>*신청인</label>
						<input class="form-control" name='name' value='<c:out value="${estimate.name}"/>'>
					</div>
					
					<div class="form-group">
						<label>*휴대폰</label>
						<input class="form-control" name='phone' value='<c:out value="${estimate.phone}"/>'>
					</div>

					<div class="form-group">
						<label>*이사제목</label>
						<input class="form-control" name='title' value='<c:out value="${estimate.title }"/>'>
					</div>
					
					<div class="form-group">
					
						<label>●출발지</label><input type="button" onclick="expandDaumPostcode()" value="주소변경하기"><br>
						<div class="address1">
							<input class="form-control" name="departure" id="departure" type="text" size="7">
							<input class="form-control" name="departure" id="departure1" type="text" size="7">
							<input class="form-control" name="departure" id="departure2" type="text" size="7">
						</div>
			 			<div id="addrsearch">
                        </div>
					</div>
					
					
					<div class="form-group">
						<label>●도착지</label><input type="button" onclick="expandDaumPostcode2()" value="주소변경하기">
						<div class="address2">
							<input class="form-control" name="arrive" id="ARRIVE" type="text" size="7">
							<input class="form-control" name="arrive" id="ARRIVE1" type="text" size="7">
							<input class="form-control" name="arrive" id="ARRIVE2" type="text" size="7">
						</div>
						<div id="addrsearch2">
                        </div>
					</div>
					
					<div class="form-group">
						<label>●이사종류</label><br>
						<div class="radio_left">
							<input class="input_left" name="move" id="move" type="radio" value="일반이사" class="radio" ${estimate.move eq '일반이사' ? 'checked' : ''}>일반이사 
						</div>
						<div class="radio_left">
							<input class="input_left" name="move" id="move" type="radio" value="포장이사" class="radio" ${estimate.move eq '포장이사' ? 'checked' : ''}>포장이사 
						</div>
						<div class="radio_left">
							<input class="input_left" name="move" id="move" type="radio" value="반포장이사" class="radio" ${estimate.move eq '반포장이사' ? 'checked' : ''}>반포장이사 
						</div>
						<div class="radio_left">
							<input class="input_left" name="move" id="move" type="radio" value="기타" class="radio" ${estimate.move eq '기타' ? 'checked' : ''}>기타 
						</div>
					</div><br>					

					<div class="form-group">
						<label>기타 사항</label>
						<textarea class="form-control" rows="3" name='content'><c:out value="${estimate.content}"/></textarea>
					</div>


					<div class="form-group">
						<label>이사시작일</label>
						<input class="form-control" type="date" name='depDate' value='${estimate.depDate}'/>
					</div>

					<div class="form-group">
						<label>수정날짜</label>
						<div class="form-control" readonly="readonly">
							<fmt:formatDate pattern = "yyyy/MM/dd" value = "${estimate.updateDate}" />
						</div>
					</div>

					<sec:authentication property="principal" var="pinfo"/>
 					<sec:authorize access="isAuthenticated()">
 						<c:if test="${pinfo.name eq estimate.name}">
							<button type="submit" data-oper='modify' class="btn btn-default">수정</button>
							<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
 						</c:if>
 					</sec:authorize>
					
					<button type="submit" data-oper='estimatelist' class="btn btn-info">목록</button>
				</form>


			</div>
			<!--  end panel-body -->

		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

<div class='bigPictureWrapper'>
	<div class='bigPicture'></div>
</div>

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
		width:100%;
  		background-color: gray;
	}
	.uploadResult ul{
  		display:flex;
  		flex-flow: row;
  		justify-content: center;
  		align-items: center;
	}
	.uploadResult ul li {
  		list-style: none;
  		padding: 10px;
  		align-content: center;
  		text-align: center;
	}
	.uploadResult ul li img{
  		width: 100px;
	}
	.uploadResult ul li span {
  		color:white;
	}
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
  		background:rgba(255,255,255,0.5);
	}
	.bigPicture {
  		position: relative;
  		display:flex;
  		justify-content: center;
  		align-items: center;
	}
	.bigPicture img {
  		width:600px;
	}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/190515/1557895495730/190515.js"></script>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Files</div>
      		<!-- /.panel-heading -->
      		<div class="panel-body">
      			<div class="form-group uploadDiv">
      				<input type="file" name='uploadFile' multiple="multiple">
        		</div>
        		<div class='uploadResult'> 
          			<ul></ul>
        		</div>
      		</div>
      		<!--  end panel-body -->
    	</div>
	    <!--  end panel-body -->
  	</div>
 	<!-- end panel -->
</div>
<!-- /.row -->

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form");
		$('button').on("click",	function(e) {
			e.preventDefault();
			var operation = $(this).data("oper");
			console.log(operation);
			if (operation === 'remove') {
				formObj.attr("action","${pageContext.request.contextPath}/estimate/remove");
			} else if (operation === 'estimatelist') {
				//move to list
				formObj.attr("action","${pageContext.request.contextPath}/estimate/estimatelist").attr("method", "get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();

				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			} else if(operation === 'modify') {
				console.log("submit clicked");
				var str = "";
				$(".uploadResult ul li").each(function(i, obj) {
					var jobj = $(obj);
					console.dir(jobj);
					str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
				});
				formObj.append(str).submit();
			}
			formObj.submit();
		});
	});
</script>

<script>
	$(document).ready(function() {
		var contextPath = sessionStorage.getItem("contextpath");
		
		(function() {
			var eno = '<c:out value="${estimate.eno}"/>';
			$.getJSON(contextPath+"/estimate/getAttachList", {eno: eno}, function(arr) {
				console.log(arr);
				var str = "";
				$(arr).each(function(i, attach) {

					//image type
					if(attach.fileType) {
						var fileCallPath =  encodeURIComponent(attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
						
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
            			str +=" data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
            			str += "<span> "+ attach.fileName+"</span>";
            			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
            			str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
            			str += "<img src='"+contextPath+"/display?fileName="+fileCallPath+"'>";
            			str += "</div>";
            			str +"</li>";
          			} else {  
			            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
            			str += "data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
            			str += "<span> "+ attach.fileName+"</span><br/>";
            			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
            			str += " class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
            			str += "<img src='"+contextPath+"/resources/img/attach.png'></a>";
            			str += "</div>";
            			str +"</li>";
          			}
       			});
				$(".uploadResult ul").html(str);
			});//end getjson
		})();//end function
		
		$(".uploadResult").on("click", "button", function(e) {   
    		console.log("delete file");
    		if(confirm("Remove this file? ")) {
    			var targetLi = $(this).closest("li");
      			targetLi.remove();
    		}
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
      			contentType: false,data: 
      			formData,type: 'POST',
      			beforeSend: function(xhr) {
      				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
      	      	},
      			dataType:'json',
        		success: function(result) {
		        	console.log(result); 
		  			showUploadResult(result); //업로드 결과 처리 함수 
		  		}
    		}); //$.ajax
    	});    
  		
  		function showUploadResult(uploadResultArr) {
	    	if(!uploadResultArr || uploadResultArr.length == 0) {
	    		return;
	    	}
	    	
	    	var uploadUL = $(".uploadResult ul");
	    	var str ="";
	    	
	    	$(uploadResultArr).each(function(i, obj) {
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
	    			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' ";
	    			str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
	    			str += "<img src='"+contextPath+"/resources/img/attach.png'></a>";
	    			str += "</div>";
	    			str +"</li>";
				}
    		});
    
    		uploadUL.append(str);
  		}
  
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
