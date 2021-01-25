<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade docs-example-modal-sm matchupServPaymentMD" tabindex="-1" 
	role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
			<div class="modal-header modal-comServHeader">
			    <h5 class="modal-title modal-comServTitle" id="comServJoinModalLabel" style="align:center">결제 정보</h5>
			    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">×</span>
			    </button>
			</div>
			<div class="container comServModalCon">
				<div class="modal-body">
				    <div class="table-responsive">
				        <div class="container">
			        		<select id="matchUpPaymentServSelect">
			        			<option class="matchUpPaymentServSelect-option" value="light">MatchUp 라이트 : 500,000KRW</option>
			        			<option class="matchUpPaymentServSelect-option" value="basic">MatchUp 베이직 : 1,000,000KRW</option>
			        			<option class="matchUpPaymentServSelect-option" value="unlimited">MatchUp 무제한 : 채용 시 연봉의 7%</option>
			        		</select>
			        		<div class="matchUpPayment-cardInfoWrapper">
			        			<div class="matchUpPayment-header">
			        				<h3>카드 정보 입력</h3>
			        				<div>
				        				<button class="matchUpPayment-header-btn">변경</button>
				        				<button class="matchUpPayment-header-btn">취소</button>
			        				</div>
			        			</div>
			        			<div class="matchupCardType-Wrapper">
			        				<input type="radio" name="matchupCardType" id="matchupCardType-corp">
			        				<label for="matchupCardType-corp">법인</label>
			        				<input type="radio" name="matchupCardType" id="matchupCardType-pers">
			        				<label for="matchupCardType-pers">개인</label>
			        			</div>
			        			<div>
			        				<div class="matchupPayment-boundDiv">
			        					<span class="matchupPayment-boundDiv-title">카드 번호</span>
			        					<input class="matchupPayment-boundDiv-input" type="text">
			        				</div>
			        				<div class="matchupPayment-boundDiv">
		        						<span class="matchupPayment-boundDiv-title">만료 일자</
		        						span>
		        						<input class="matchupPayment-boundDiv-input" type="text" placeholder="YY/MM">
			        				</div>
			        				<div class="matchupPayment-boundDiv">
			        					<span class="matchupPayment-boundDiv-title">사업자등록번호</span>
			        					<input class="matchupPayment-boundDiv-input" type="text">
			        				</div>
			        			</div>
			        		</div>
			        		<div>
			        			<div>
				        			<input type="checkbox" id="matchupPayment-refundChk">
				        			<label for="matchupPayment-refundChk" class="matchupPayment-chkLb">구입시 7일 이내에 환불을 요청하실 경우, 
				        			매치업 열람권을 전혀 사용하지 않으신 경우에 한해 전액 환불이 가능합니다
				        			(열람권을 사용하거나 결제일로부터 7일이 지났을 경우에는 환불이 불가능합니다)</label>
			        			</div>
				        		<div>
				        			<input type="checkbox" id="matchupPayment-appliGuide">
			        				<label for="matchupPayment-appliGuide" class="matchupPayment-chkLb">추천 채용 서비스와 매치업 서비스를 통해
			        				동시에 유입된 지원자에 대해서는 유입 시점이 빠른 것을 기준으로 판단합니다</label>
				        		</div>
			        			<button class="matchupPayment-submitBtn">결제하기</button>
			        		</div>
			      		</div>
			        </div>
			    </div>
			</div>
		</div>
	</div>
</div>