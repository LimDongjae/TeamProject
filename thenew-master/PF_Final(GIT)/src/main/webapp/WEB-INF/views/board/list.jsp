<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- 앞의 내용은 header에서 이어서 작동한다. -->
<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">후기 & 공지</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				&nbsp;
				<!-- 일반 사용자의 경우 새 글 등록 버튼 활성화 -->
				<sec:authorize access="hasRole('ROLE_USER')">
					<button id='regBtn' type="button" class="btn btn-xs pull-right">새 글 등록</button>
				</sec:authorize>
				<!-- 관리자의 경우 새 글 등록 / 공지 등록 버튼 활성화 -->
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<button id='regBtnNotice' type="button" class="btn btn-xs pull-right">새 글 등록 / 공지 등록</button>
				</sec:authorize>
				<!-- 로그인되지 않은 사용자의 경우 새 글 작성을 누르면 로그인 홈페이지로 이동 -->
				<sec:authorize access="isAnonymous()">
					<button onclick='self.location = "${pageContext.request.contextPath}/customLogin"' class="btn btn-xs pull-right">새 글 작성</button>
				</sec:authorize>
			</div>

			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr style="background-color:rgb(204, 204, 204);">
							<th style="text-align:center">번호</th>
							<th style="text-align:center">제목</th>
							<th style="text-align:center">작성자</th>
							<th style="text-align:center">작성일</th>
						</tr>					
					</thead>
		
					<!-- 공지사항을 상단에 보여주기 -->
					<!--noticeList 값을 받아서 for문을 실행 -->
					<c:forEach items="${noticeList}" var="board">
						<!-- 공지사항에 해당되는 부분만 색 변경 -->
						<tr style="background-color:rgb(230, 230, 230);">
							<td style="text-align:center; color:red;"><b>공지</b></td>
							<td>
								<a class='move' href='<c:out value="${board.bno}"/>'>
									<c:out value="${board.title}" />
									<b>[<c:out value="${board.replyCnt}"/>]</b>
								</a>
							</td>
							<td style="text-align:center"><c:out value="${board.writer}" /></td>
							<td style="text-align:center"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
						</tr>
					</c:forEach>
					
					<!--list 값을 받아서 for문을 실행 -->
					<c:forEach items="${list}" var="board">
						<tr>
							<td style="text-align:center"><c:out value="${board.bno}" /></td>
							<td>
								<a class='move' href='<c:out value="${board.bno}"/>'>
									<c:out value="${board.title}" />
									<b>[<c:out value="${board.replyCnt}"/>]</b>
								</a>
							</td>
							<td style="text-align:center"><c:out value="${board.writer}" /></td>
							<td style="text-align:center"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
						</tr>
					</c:forEach>
				</table>

				<div class='row'>
					<div class="col-lg-12">
						<!-- 검색 부분 -->
						<form id='searchForm' action="${pageContext.request.contextPath}/board/list" method='get'>
							<select name='type'>
								<option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
								<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자</option>
								<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목 or 내용 or 작성자</option>
							</select>
							<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
							<input type='hidden' name='pageNum'	value='<c:out value="${pageMaker.cri.pageNum}"/>' />
							<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>검색</button>
						</form>
					</div>
				</div>

				<div class='pull-right'>
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous">
								<a href="${pageMaker.startPage -1}">이전</a>
							</li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<!-- 현재 페이지에 강조 표시를 해준다.(현재 페이지: active, 그외: 빈칸) -->
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next">
								<a href="${pageMaker.endPage +1 }">다음</a>
							</li>
						</c:if>						
					</ul>
				</div>
			</div>

			<form id='actionForm' action="${pageContext.request.contextPath}/board/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
				<input type='hidden' name='keyword'	value='<c:out value="${ pageMaker.cri.keyword }"/>'>
			</form>

			<!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">완료</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
		var result = '<c:out value="${result}"/>';
		checkModal(result);
		history.replaceState({}, null, null);
		//Modal function
		function checkModal(result) {
			if (result === '' || history.state) {
				return;
			}
			//새로운 게시글이 등록되었을 때
			if (parseInt(result) > 0) {
				$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
			}
			$("#myModal").modal("show");
		}
		
		//새 글 등록을 클릭했을 때
		$("#regBtn").on("click", function() {
			self.location = "${pageContext.request.contextPath}/board/register";
		});
		//공지 등록을 클릭했을 때
		$("#regBtnNotice").on("click", function() {
			self.location = "${pageContext.request.contextPath}/board/register";
		});
		var actionForm = $("#actionForm");
		//pageinate_button이라는 클래스에 존재하는 a 태그를 클랙했을 때
		$(".paginate_button a").on("click", function(e) {
			//현재 이벤트의 기본 이벤트를 중단한다.
			e.preventDefault();
			console.log('click');
			//actionForm의 하위 요소를 찾아서 href라는 속성의 값을 대입한다.
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		//상세히 보기
		$(".move").on("click",function(e) {
			e.preventDefault();
			//선택한 요소 끝에 내용을 추가한다.
			actionForm.append("<input type='hidden' name='bno' value='"	+ $(this).attr("href") + "'>");
			actionForm.attr("action", "${pageContext.request.contextPath}/board/get");
			actionForm.submit();
		});
		//search부분을 선택했을 때 작동하는 동작
		var searchForm = $("#searchForm");
		$("#searchForm button").on("click",	function(e) {
			if (!searchForm.find("option:selected").val()) {
				alert("검색종류를 선택하세요");
				return false;
			}
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			searchForm.submit();
		});
	});
</script>

<!-- 뒤의 내용은 footer에서 이어서 작동한다. -->
<%@include file="../includes/footer.jsp"%>