<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/convertUtil.tld" prefix="convert" %>
<%@ taglib uri="/WEB-INF/tlds/codeConvertUtil.tld" prefix="codeConvert" %>

<script type="text/javascript" src="/js/Cookie.js"></script>


<jsp:include page="/indexHeader.do" />

<!-- 메인 채용공고와 배너광고 -->
<div id="content01Wrap">
	<div id="content01">
		<div id="content01_offer">
			<ul>
				<c:forEach var="result" items="${mainRecruitList}" varStatus="status">
					<c:if test="${result.type == 'head' }">
						<li class="headhunting">
							<a href="/headhuntList.do" title="기업회원등록공고">
							<span class="desc00">헤드헌팅</span><span class="desc01">${result.bizMen}명</span>
					</c:if>
					<c:if test="${result.type == 'recruit' }">
						<li class="regular">
							<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.bizIng }', '');" title="기업회원등록공고">
							<span class="desc00">정규직</span><span class="desc01">${result.bizMen}명</span>
					</c:if>
					<c:if test="${result.type == 'free' }">
						<li class="freelance">
							<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.bizIng }', '');" title="기업회원등록공고">
							<span class="desc00">프리랜서</span><span class="desc01">${result.bizMen}명</span>
					</c:if>
					<c:if test="${result.type == 'alba' }">
						<li class="partT">
							<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.bizIng }', '');" title="기업회원등록공고">
								<span class="desc00">알바</span><span class="desc01">${result.bizMen}명</span>
					</c:if>
								<p class="desc02">${result.bizName}</p>
								<p class="desc03">${convert:compByte(result.bizTitle, 95, "...")}</p>
								<span class="desc04">${result.bizArea1Name}</span><span class="desc05">${convert:getEndCond4Index(result.bizIng, result.bizEndType, result.bizEndDay)}</span>
							</a>
						</li>
				</c:forEach>
			</ul>
		</div>
		<div id="content01_ad">
			<ul>
				<c:forEach var="result" items="${bannerList}" varStatus="status">
					<c:if test="${status.index < 4 }">
						<li class="headhunting">
							<c:if test="${result.link == null || result.link == '' }">
								<div>${result.thumbnail}</div>
							</c:if>
							<c:if test="${result.link != null && result.link != '' }">
								<a href="${result.link }" target="_blank" title="광고"><div style="width: 250px; height: 110px;">${result.thumbnail}</div></a>
							</c:if>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>

<!-- 롤 배너광고	-->
<div id="content02Wrap">
	<div id="content02">
		<div id="adArea">
			<p class="btn btn_prev"><a href="" title="이전보기"><img src="img/main/btn_prev.jpg" alt="이전버튼" /></a></p>
			<ul id="adList">
				<c:forEach var="result" items="${rollBannerList}" varStatus="status">
					<c:if test="${status.index < 6 }">
						<li>
							<c:if test="${result.link == null || result.link == '' }">
								<a href="javascript:void();" title="롤 배너광고">
									<p class="adImg">${result.thumbnail}</p>
								</a>
							</c:if>
							<c:if test="${result.link != null && result.link != '' }">
								<a href="${result.link }" target="_blank" title="롤 배너광고">
									<p class="adImg">${result.thumbnail}</p>
								</a>
							</c:if>
						</li>
					</c:if>
				</c:forEach>
			</ul>
			<p class="btn btn_prev"><a href="" title="다음보기"><img src="img/main/btn_next.jpg" alt="다음버튼" /></a></p>
		</div>
	</div>

<!-- 
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
 -->

	<div id="content04Wrap">
		<div id="content04">
			<h4>헤드헌팅 채용공고</h4>
			<p>
				<a href="/headhuntList.do" title="더보기">more+</a>
			</p>
			<ul>
				<c:forEach var="result" items="${headhuntList}" varStatus="status">
					<li>
						<a href="/headhuntList.do" title="헤드헌팅 채용공고">
							<div class="descBox">
								<p class="desc01">${result.companyInitial }사</p>
								<p class="desc02">${convert:compByte(result.recruitContents, 70, "...")}</p>
								<span class="desc03">${result.men }명</span>
								<span class="desc04">
									${result.placeWork }
								</span><span class="desc05">${convert:getEndCond4Index(result.bizIng, result.bizEndType, result.bizEndDay)}</span>
							</div>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>

	<div id="content03Wrap">
		<div id="content03">
			<h4>기업회원 등록 채용공고</h4>
			<p class="more"><a href="/recruitSearch.do" title="더보기">more+</a></p>
			<ul>
				<c:forEach var="result" items="${recruitList}" varStatus="status">
					<li>
						<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.bizIng }', '');" title="기업회원등록공고">
							<div class="descBox">
								<p class="desc01">${result.bizName }</p>
								<p class="desc02">${convert:compByte(result.bizTitle, 70, "...")}</p>
								<span class="desc03">${result.bizMen }명</span>
								<span class="desc04">
									${result.bizArea1Name }
									${convert:checkNull(result.bizArea2Name) eq '' ? '' : '> '.concat(result.bizArea2Name) }
								</span><span class="desc05">${convert:getEndCond4Index(result.bizIng, result.bizEndType, result.bizEndDay)}</span>
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
						<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.bizIng }', '');" title="기업회원등록공고">
							<div class="descBox">
								<p class="desc01">${result.bizName }</p>
								<p class="desc02">${convert:compByte(result.bizTitle, 70, "...")}</p>
								<span class="desc03">${result.bizMen }명</span>
								<span class="desc04">
									${result.bizArea1Name }
									${convert:checkNull(result.bizArea2Name) eq '' ? '' : '> '.concat(result.bizArea2Name) }
								</span><span class="desc05">${convert:getEndCond4Index(result.bizIng, result.bizEndType, result.bizEndDay)}</span>
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
						<a href="javascript:goDetail('${result.uid }', '${SE_LOGIN_ID }', '', '${result.no }', '', '${result.bizIng }', '');" title="기업회원등록공고">
							<div class="descBox">
								<p class="desc01">${result.bizName }</p>
								<p class="desc02">${convert:compByte(result.bizTitle, 70, "...")}</p>
								<span class="desc03">${result.bizMen }명</span>
								<span class="desc04">
									${result.bizArea1Name }
									${convert:checkNull(result.bizArea2Name) eq '' ? '' : '> '.concat(result.bizArea2Name) }
								</span><span class="desc05">${convert:getEndCond4Index(result.bizIng, result.bizEndType, result.bizEndDay)}</span>
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
						<td class="jDate">채용마감</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="result" items="${recruitOtherList}" varStatus="status">
						<tr style="cursor: pointer">
							<th>
								<!-- 
								<a href="http://www.work.go.kr/empInfo/empInfoSrch/detail/empDetailAuthView.do?callPage=detail&wantedAuthNo=${result.wantedAuthNo }" target="_blank">
                                	${result.companyTitle }
                           		</a>
								 -->
								<a href="javascript:goOtherDetail('${result.ser }');">
                                	${result.companyTitle }
                           		</a>
                           	</th>
							<td class="jPart">
								<!-- 
								<a href="http://www.work.go.kr/empInfo/empInfoSrch/detail/empDetailAuthView.do?callPage=detail&wantedAuthNo=${result.wantedAuthNo }" target="_blank">
									${result.recruitItem }
								</a>
								 -->
								<a href="javascript:goOtherDetail('${result.ser }');">
									${result.recruitItem }
								</a>
							</td>
							<td class="jPerson">${result.men }</td>
							<td class="jadd">${result.whereis }</td>
							<td class="jcontact">${result.phone }</td>
							<td class="jDate">${result.strEdate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<jsp:include page="/footer.do" />
 -->

<form id="searchForm" name="searchForm" method="post" action="/recruitDetail.do">
	<input type="hidden" name="no" id="no" value="" />
	<input type="hidden" name="personUid" id="personUid" value="${map.personUid}" />
	<input type="hidden" name="companyUid" id="companyUid" value="${map.companyUid}" />
	<input type="hidden" name="recruitNo" id="recruitNo" value="" />
	<input type="hidden" name="resumeNo" id="resumeNo" value="" />
	<input type="hidden" name="leftMenuUrl" id="leftMenuUrl" value="/personSubMenu.do" />
</form>

<script type="text/javascript">
	
	function goDetail(companyUid, personUid, no, recruitNo, resumeNo, bizIng, detailFlag){
		
		loadingOn();
		//if("yes" != bizIng){
		//	alert("현재 비공개 상태로 설정되어 있습니다.");
		//	loadingOff();

		//}else{
		//	var callback = function(data){
				//if(data.rstCnt <= 0){
				//	alert("이력서를 먼저 작성해 주세요");
				//	loadingOff();
				//}else{
					if("${SE_USER_TYPE}" == "person"){
						$("#leftMenuUrl").val("/personSubMenu.do");
					}else{
						$("#leftMenuUrl").val("/companySubMenu.do");
					}
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
	
	// 기타 채용정보 상세보기 화면으로 이동.
	function goOtherDetail(no){
		loadingOn();
		
		$("#no").val(no);
		$("#searchForm").attr("action", "/recruitOtherDetail.do");
		$("#searchForm").submit();
	}

</script>
