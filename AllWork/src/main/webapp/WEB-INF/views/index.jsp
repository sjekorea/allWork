<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>


<!-- (begin) 2020.12.30 by s.yoo	-->
<!-- 
<jsp:include page="/indexHeader.do" />
 -->
<c:choose>
	<c:when test="${SE_LOGIN_STATUS}">
		<c:if test="${SE_USER_TYPE == 'company' }">
			<jsp:include page="/indexHeaderCompany.do"/>
		</c:if>

		<c:if test="${SE_USER_TYPE == 'person' }">
			<jsp:include page="/indexHeaderPerson.do" />
		</c:if>
	</c:when>
	<c:otherwise>
		<jsp:include page="/indexHeader.do" />
	</c:otherwise>
</c:choose>
<!-- (end) 2020.12.30 by s.yoo	-->

<div id="content01Wrap">
	<div id="content01">
		<div id="content01_offer">
			<ul>
				<li class="headhunting">
					<a href="01_aboutMMCA.html" title="유료공고00">
						<span class="desc00">헤드헌팅</span><span class="desc01">1명</span>
						<p class="desc02">(주)다우리종합건설</p>
						<p class="desc03">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
						<span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
					</a>
				</li>
				<li class="headhunting">
					<a href="01_aboutMMCA.html" title="유료공고00">
						<span class="desc00">헤드헌팅</span><span class="desc01">1명</span>
						<p class="desc02">(주)다우리종합건설</p>
						<p class="desc03">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
						<span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
					</a>
				</li>
				<li class="regular">
					<a href="01_aboutMMCA.html" title="유료공고00">
						<span class="desc00">헤드헌팅</span><span class="desc01">1명</span>
						<p class="desc02">(주)다우리종합건설</p>
						<p class="desc03">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
						<span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
					</a>
				</li>
				<li class="regular">
					<a href="01_aboutMMCA.html" title="유료공고00">
						<span class="desc00">정규직</span><span class="desc01">1명</span>
						<p class="desc02">(주)다우리종합건설</p>
						<p class="desc03">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
						<span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
					</a>
				</li>
				<li class="freelance">
					<a href="01_aboutMMCA.html" title="유료공고00">
						<span class="desc00">프리랜서</span><span class="desc01">1명</span>
						<p class="desc02">(주)다우리종합건설</p>
						<p class="desc03">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
						<span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
					</a>
				</li>
				<li class="partT">
					<a href="01_aboutMMCA.html" title="유료공고00">
						<span class="desc00">알바</span><span class="desc01">1명</span>
						<p class="desc02">(주)다우리종합건설</p>
						<p class="desc03">텔레마케팅 아웃바운드 사원 및 관리자 모집</p>
						<span class="desc04">경기 고양시</span><span class="desc05">등록일:20-09-23</span>
					</a>
				</li>
			</ul>
		</div>
		<div id="content01_ad">
			<ul>
				<c:forEach var="result" items="${bannerList}" varStatus="status">
					<c:if test="${status.index < 4 }">
						<li class="headhunting">
							<c:choose>
								<c:when test="${result.type == 'image' }">
									<a href="location.href='${result.domain }'" title="유료공고00"><img src="/img/ban/${result.contents }" alt="이미지00" /></a>
								</c:when>
								<c:otherwise>
									${result.contents }
								</c:otherwise> 
							</c:choose>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
<div id="content02Wrap">
	<div id="content02">
		<div id="adArea">
			<p class="btn btn_prev"><a href="01_aboutMMCA.html" title="이전보기"><img src="img/main/btn_prev.jpg" alt="이전버튼" /></a></p>
			<ul id="adList">
				<li>
					<a href="01_aboutMMCA.html" title="기업홈">
						<p class="adImg"><img src="/img/main/ad00.jpg" alt="기업광고00" /></p>
						<p class="adText"><span class="w_subtitle">삼성전자</span><br /> <span class="w_title">경력직 채용</span></p>
					</a>
				</li>
				<li>
					<a href="01_aboutMMCA.html" title="기업홈">
						<p class="adImg"><img src="/img/main/ad01.jpg" alt="기업광고01" /></p>
						<p class="adText"><span class="w_subtitle">LG전자</span><br /> <span class="w_title">경력직 채용</span>
						</p>
					</a>
				</li>
				<li>
					<a href="01_aboutMMCA.html" title="기업홈">
						<p class="adImg"><img src="/img/main/ad02.jpg" alt="기업광고02" /></p>
						<p class="adText"><span class="w_subtitle">HANSAE패션</span><br /> <span class="w_title">경력직 채용</span></p>
					</a>
				</li>
				<li>
					<a href="01_aboutMMCA.html" title="기업홈">
						<p class="adImg"><img src="/img/main/ad03.jpg" alt="기업광고03" /></p>
						<p class="adText"><span class="w_subtitle">현대백화점</span><br /> <span class="w_title">경력직 채용</span></p>
					</a>
				</li>
				<li>
					<a href="01_aboutMMCA.html" title="기업홈">
						<p class="adImg"><img src="/img/main/ad04.jpg" alt="기업광고04" /></p>
						<p class="adText"><span class="w_subtitle">오리온</span><br /> <span class="w_title">경력직 채용</span></p>
					</a>
				</li>
				<li>
					<a href="01_aboutMMCA.html" title="기업홈">
						<p class="adImg"><img src="/img/main/ad05.jpg" alt="기업광고05" /></p>
						<p class="adText"><span class="w_subtitle">KB</span><br /> <span class="w_title">경력직 채용</span></p>
					</a>
				</li>
			</ul>
			<p class="btn btn_prev"><a href="01_aboutMMCA.html" title="다음보기"><img src="img/main/btn_next.jpg" alt="다음버튼" /></a></p>
		</div>
	</div>
	<div id="content03Wrap">
		<div id="content03">
			<h4>기업회원 등록 채용공고</h4>
			<p class="more"><a href="/recruitSearch.do" title="더보기">more+</a></p>
			<ul>
				<c:forEach var="result" items="${recruitList}" varStatus="status">
					<li>
						<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.open }', '');" title="기업회원등록공고">
							<div class="descBox">
								<p class="desc01">${result.bizName }</p>
								<p class="desc02">${result.bizTitle }</p>
								<span class="desc03">${result.bizMen }명</span>
								<span class="desc04">
									${result.bizArea1Name }
									${convert:checkNull(result.bizArea2Name) eq '' ? '' : '>'.concat(result.bizArea2Name) }
								</span>
								<span class="desc05">등록일:${result.wdate }</span>
							</div>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div id="content04Wrap">
		<div id="content04">
			<h4>프리랜서 채용공고</h4>
			<p>
				<a href="/recruitSearchForFree.do" title="더보기">more+</a>
			</p>
			<ul>
				<c:forEach var="result" items="${recruitFreeList}" varStatus="status">
					<li>
						<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.open }', '');" title="기업회원등록공고">
							<div class="descBox">
								<p class="desc01">${result.bizName }</p>
								<p class="desc02">${result.bizTitle }</p>
								<span class="desc03">${result.bizMen }명</span>
								<span class="desc04">
									${result.bizArea1Name }
									${convert:checkNull(result.bizArea2Name) eq '' ? '' : '>'.concat(result.bizArea2Name) }
								</span>
								<span class="desc05">등록일:${result.wdate }</span>
							</div>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div id="content05Wrap">
		<div id="content05">
			<h4>알바 채용공고</h4>
			<p>
				<a href="/recruitSearchForAlba.do" title="더보기">more+</a>
			</p>
			<ul>
				<c:forEach var="result" items="${recruitAlbaList}" varStatus="status">
					<li>
						<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.open }', '');" title="기업회원등록공고">
							<div class="descBox">
								<p class="desc01">${result.bizName }</p>
								<p class="desc02">${result.bizTitle }</p>
								<span class="desc03">${result.bizMen }명</span>
								<span class="desc04">
									${result.bizArea1Name }
									${convert:checkNull(result.bizArea2Name) eq '' ? '' : '>'.concat(result.bizArea2Name) }
								</span>
								<span class="desc05">등록일:${result.wdate }</span>
							</div>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div id="content06Wrap">
		<div id="content06">
			<h4>기타 채용정보</h4>
			<p>
				<a href="/recruitOther.do" title="더보기">more+</a>
			</p>
			<table title="이름, 아이디, 비밀번호, 이메일 등의 정보입력">
				<caption>기타 채용정보</caption>
				<thead id="boardTitle">
					<tr>
						<th>회사명</th>
						<td class="jPart">채용분야</td>
						<td class="jPerson">채용인원</td>
						<td class="jadd">근무처</td>
						<td class="jcontact">연락처</td>
						<td class="jDate">등록일</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="result" items="${recruitOtherList}" varStatus="status">
						<tr onclick="location.href='https://www.daum.net/'" style="cursor: pointer">
							<th>${result.companyTitle }</th>
							<td class="jPart">${result.recruitItem }</td>
							<td class="jPerson">${result.men }</td>
							<td class="jadd">${result.whereis }</td>
							<td class="jcontact">${result.phone }</td>
							<td class="jDate">${result.beg }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<jsp:include page="/footer.do" />

<script type="text/javascript">
	
	function goDetail(companyUid, personUid, no, recruitNo, resumeNo, open, detailFlag){
		
		loadingOn();
		//if("open" != open){
		//	alert("현재 비공개 상태로 설정되어 있습니다.");
		//	loadingOff();

		//}else{
		//	var callback = function(data){
				//if(data.rstCnt <= 0){
				//	alert("이력서를 먼저 작성해 주세요");
				//	loadingOff();
				//}else{
					$("#companyUid").val(companyUid);
					$("#personUid").val(personUid);
					$("#no").val(no);
					$("#recruitNo").val(recruitNo);
					$("#resumeNo").val(resumeNo);
					$("#searchForm").attr("action", "/recruitDetail.do");
					$("#searchForm").submit();
				//}
		//	};
		//	var param = {
					
		//	};
			
		//	ajax('post', '/selectNetfuItemResumeCnt.ajax', param, callback);
		//}
	}
</script>
