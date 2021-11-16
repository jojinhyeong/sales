<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<meta charset="UTF-8">
<style type="text/css">
.contents {
	width: 100% !important;

}
div,td{
	font-size:25px;
}
ul.top_tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
	height: 300px;
}

ul.top_tabs li {
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
	height:70px;
	width: 300px;
	text-align:center;
}

ul.top_tabs li.current {
	background: #FAF0E6;
	color: orange;
	height:70px;
	width: 300px;
	border: 1px solid #000000;

}

.tab-content {
	display: none;
	background: #ededed;
	padding: 15px;
	border:1px solid #000000;
}

.tab-content.current {
	display: inherit;
}

/* ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ거래처원장ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
ul.tabs1, ul.tabs2 ,ul.tabs3, ul.tabs4 , ul.tabs5 {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs1 li , ul.tabs2 li , ul.tabs3 li, ul.tabs4 li, ul.tabs5 li {
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs1 li.current, ul.tabs2 li.current, ul.tabs3 li.current, ul.tabs4 li.current, ul.tabs5 li.current {
	background: #ededed;
	color: orange;
}

.tab-content1, .tab-content2, .tab-content3 , .tab-content4 , .tab-content5  {
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content1.current, .tab-content2.current, .tab-content3.current, .tab-content4.current, .tab-content5.current {
	display: inherit;
}
/* ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */

/* 테이블 css */
.table_css {
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed;
}

.table_css tbody tr:hover {
	background-color: #FFA599;
	color: #ffffff;
}

.table_css th {
	border-left: 2px solid #000000;
	border-right: 2px solid #000000;
	border-top: 2px solid #000000;
	border-bottom: 2px solid #000000;
	background-color: RoyalBlue;
	padding: 10px;
	color: orange;
	/* text-shadow: 2px 2px 0px NavajoWhite; */
}

.table_css td {
	text-align: center;
	border: 1px solid #C0C0C0;
	padding: 10px;
	overflow: hidden;
	/* text-overflow: ellipsis; */
	white-space: nowrap;
}

.search_btn {
	width: 93px;
	height: 76px;
	cursor: pointer;
	margin-left:30px;
}

.year_txt {
	width: 160px;
	height: 100px;
	font-size: 20px;
}

.month_btn {
	width: 200px;
	height: 96px;
	font-size:20px;
}

.img_div,.img_div2 {
	display: inline-block;
	vertical-align: top;
	margin-top: 12px;
	margin-left: 5px;
}

.img_div2 {
	margin-top: 4px;
}

.logout_btn{
	width:100px;
	height:30px;
	margin-left:30px;
}
/* 거래처 셀렉트 박스 */
.partner_css {
	width: 230px;
	height: 25px;
	text-align-last: center;
	height: 100px;
	font-size:20px;
}
</style>
<!-- jQuery UI CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/jquery/jquery-ui.css" />
<!-- 팝업 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/common/popup.css" />
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
	    
	    $("#month1").val(new Date().toISOString().slice(0, 7));
	    $("#date1").val($("#month1").val().replace("-", ""));
	    $("#month3").val(new Date().toISOString().slice(0, 7));
	    $("#date3").val($("#month3").val().replace("-", ""));
	    $("#month4").val(new Date().toISOString().slice(0, 7));
	    $("#date4").val($("#month3").val().replace("-", ""));
	    $("#month").val(new Date().toISOString().slice(0, 7));
	    $("#date").val($("#month").val().replace("-", ""));
	    $("#year").val(new Date().toISOString().slice(0, 4));
	    //reloadList1();
	    partnerList();
	    
	   
	    //탑메뉴
	    $('ul.top_tabs li').click(function () {
	        var tab_id = $(this).attr('data-tab');
	        
	        $('ul.top_tabs li').removeClass('current');
	        $('.tab-content').removeClass('current');
	
	        $(this).addClass('current');
	        $("#" + tab_id).addClass('current');
	    })
			
	    //거래처원장
	    $('ul.tabs1 li').click(function () {
	        var tab_id = $(this).attr('data-tab');
			
	        $('ul.tabs1 li').removeClass('current');
	        $('.tab-content1').removeClass('current');
	
	        $(this).addClass('current');
	        $("#" + tab_id).addClass('current');
	       
	        
	    })
	    
	    //연간 판매실적
	    $('ul.tabs2 li').click(function () {
	        var tab_id = $(this).attr('data-tab');
			
	        $('ul.tabs2 li').removeClass('current');
	        $('.tab-content2').removeClass('current');
	
	        $(this).addClass('current');
	        $("#" + tab_id).addClass('current');
	       
	        
	    })
	    
	    //외상잔고실적(담당자별)
	    $('ul.tabs3 li').click(function () {
	        var tab_id = $(this).attr('data-tab');
			
	        $('ul.tabs3 li').removeClass('current');
	        $('.tab-content3').removeClass('current');
	
	        $(this).addClass('current');
	        $("#" + tab_id).addClass('current');
	       
	        
	    })
	    
	    //매출현황
	    $('ul.tabs5 li').click(function () {
	        var tab_id = $(this).attr('data-tab');
			
	        $('ul.tabs5 li').removeClass('current');
	        $('.tab-content5').removeClass('current');
	
	        $(this).addClass('current');
	        $("#" + tab_id).addClass('current');
	       
	        
	    })
	    
	    //거래처원장 검색버튼
	    $("#search2").on("click", function () {
	        $("#date1").val($("#month1").val().replace("-", ""));
	        reloadList1();
	        //alert("검색 완료");
	    });
	    
	    //연간 판매실적 검색버튼
	    $("#search3").on("click", function () {
	        yearList();
	    });
	    
	    //외상잔고실적 검색버튼
	    $("#search_3").on("click", function () {
	        $("#date3").val($("#month3").val().replace("-", ""));
	        app2List();
	    });
	    
	    //받을어음현황 검색버튼
	    $("#search_4").on("click", function () {
	        $("#date4").val($("#month4").val().replace("-", ""));
	        cashList();
	    });
	    
	    //매출현황 검색버튼
	    $("#search").on("click", function () {
	        $("#date").val($("#month").val().replace("-", ""));
	        reloadList5();
	        //alert($("#date").val().substring(0,4)+"년 "+$("#date").val().substring(4) + "월 검색 완료");
	    });
	    
	    //로그아웃
        $("#logout_btn").on("click", function () {
            $("#empno").val("");
            $("#actionForm").attr("action", "logout");
            $("#actionForm").submit();
        });
	})
	
    //거래처원장 아작스
    function reloadList1() {
        var params = $("#actionForm").serialize();
        $.ajax({
            type : "post",
            url : "orderAjax",
            dataType : "json", // {키:값, 키:값}
            data : params, //보낼데이터
            success : function (res) { //성공 시 해당 함수 실행. 결과는 res로 받겠다.
                draworder(res.order);
            },
            error : function (req, status, error) {
                //console.log("code : " + req.status);
                //console.log("message : " + req.responseText);
            }
        });
    }

	//거래처목록 아작스
    function partnerList() {
        var params = $("#actionForm").serialize();
        $.ajax({
            type : "post",
            url : "patnerAjax",
            dataType : "json", // {키:값, 키:값}
            data : params, //보낼데이터
            success : function (res) { //성공 시 해당 함수 실행. 결과는 res로 받겠다.
                drawpartner(res.partner);
            },
            error : function (req, status, error) {
                //console.log("code : " + req.status);
                //console.log("message : " + req.responseText);
            }
        });
    }
	
	//연간판매실적 아작스
    function yearList() {
        var params = $("#actionForm").serialize();
        $.ajax({
            type : "post",
            url : "yearAjax",
            dataType : "json", // {키:값, 키:값}
            data : params, //보낼데이터
            success : function (res) { //성공 시 해당 함수 실행. 결과는 res로 받겠다.
                drawYear(res.year);
            },
            error : function (req, status, error) {
                //console.log("code : " + req.status);
                //console.log("message : " + req.responseText);
            }
        });
    }
	
	//외상잔고실적목록 아작스
    function app2List() {
        var params = $("#actionForm").serialize();
        $.ajax({
            type : "post",
            url : "app2Ajax",
            dataType : "json", // {키:값, 키:값}
            data : params, //보낼데이터
            success : function (res) { //성공 시 해당 함수 실행. 결과는 res로 받겠다.
                drawApp2(res.App2);
            },
            error : function (req, status, error) {
                //console.log("code : " + req.status);
                //console.log("message : " + req.responseText);
            }
        });
    }
	
	//받을어음현황 아작스
    function cashList() {
        var params = $("#actionForm").serialize();
        $.ajax({
            type : "post",
            url : "cashAjax",
            dataType : "json", // {키:값, 키:값}
            data : params, //보낼데이터
            success : function (res) { //성공 시 해당 함수 실행. 결과는 res로 받겠다.
                drawCash(res.cash);
            },
            error : function (req, status, error) {
                //console.log("code : " + req.status);
                //console.log("message : " + req.responseText);
            }
        });
    }
	
	//매출현황 아작스
    function reloadList5() {
        var params = $("#actionForm").serialize();
        $.ajax({
            type : "post",
            url : "ListAjax",
            dataType : "json", // {키:값, 키:값}
            data : params, //보낼데이터
            success : function (res) { //성공 시 해당 함수 실행. 결과는 res로 받겠다.
                drawList(res.list);
            },
            error : function (req, status, error) {
                //console.log("code : " + req.status);
                //console.log("message : " + req.responseText);
            }
        });
    }
	
    //거래처원장 목록
    function draworder(order) {
        var html = "";

        for (var i = 0; i < order.length; i++) {
	            if(order[i].GB != 3){
	                html += "<tr name=\"" + order[i].GB + "\">";
	    			if(i==0){
	    	           html += "<td></td>";
	    			}else if(i == order.length-1){
	    	           html += "<td></td>";
	    			}else{
	    	           html += "<td>" + order[i].DTS_SUPPLY + "</td>";
	    			}
	    			
	                html += "<td>" + order[i].NM_ITEM + "</td>";
	                
	                if (order[i].PSIZE > 1) {
	                    html += "<td>" + order[i].QTY.toLocaleString() + "(" + order[i].PSIZE + ")"
	                            + "</td>";
	                } else {
	                    html += "<td>" + order[i].QTY.toLocaleString() + "</td>";
	                }
	                html += "<td>" + order[i].PPRICE.toLocaleString() + "</td>";
	                html += "<td>" + order[i].AMT.toLocaleString() + "</td>";
	                html += "<td>" + order[i].NM_DBPARTNER + "</td>";
	
	                html += "</tr>";
	            }
         }
            
        $("#order_first tbody").html(html);
        
        var order_second ="";
        
        for (var i = 0; i < order.length; i++) {
            if(order[i].GB == 4 || order[i].GB == 0){
                order_second += "<tr name=\"" + order[i].GB + "\">";
                if(i==0){
                    order_second += "<td></td>";
	    		}else{
	    		    order_second += "<td>" + order[i].DTS_SUPPLY + "</td>";
	    		}
                order_second += "<td>" + order[i].AMT.toLocaleString() + "</td>";
                order_second += "<td>" + order[i].AMT_IN.toLocaleString() + "</td>";
                order_second += "<td>" + order[i].AMT_NOTE.toLocaleString() + "</td>";
                order_second += "<td>" + order[i].AMT_NOTE_IN.toLocaleString() + "</td>";
                order_second += "<td>" + order[i].AMT_PAY_S.toLocaleString() + "</td>";
                order_second += "<td>" + order[i].AMT_PAY_G.toLocaleString() + "</td>";
                order_second += "<td>" + order[i].AMT_PAY_W.toLocaleString() + "</td>";

                order_second += "</tr>";
            }
     	}
        
        $("#order_second tbody").html(order_second);
    }

    //거래처원장 거래처목록
    function drawpartner(partner){
        var partner1 = '';
        
        partner1 += "<option value=\"-1\">-- 거래처 --</option>";
		for (var i = 0; i < partner.length; i++) {
		    partner1 += "<option value="+partner[i].CD_PARTNER+">"
					+ partner[i].CD_PARTNER +" "+ partner[i].NM_PARTNER + "</option> ";
		}

		$("#cd_partner").html(partner1);
		$("#cd_partner2").html(partner1);
		$("#cd_partner4").html(partner1);
    }
    
  	//연간판매실적 목록
    function drawYear(year) {
        var year1 = "";

        for (var i = 0; i < year.length; i++) {
            year1 += "<tr>";
            	year1 += "<td>" + year[i].YYMM_REG.replace(/(.{4})/g,"$1.")+"</td>";
            	year1 += "<td>" + year[i].QTY_SALE.toLocaleString()+"<BR>"+year[i].AMT_SALE.toLocaleString()+"<BR>"+"</td>";
            	year1 += "<td>" + year[i].AMT_CASH_INPAY.toLocaleString()+"<BR>"+year[i].AMT_BILL_INPAY.toLocaleString()+"<BR>"+"</td>";
            	year1 += "<td>" + year[i].AMT_GIVE_PAY_IN.toLocaleString()+"<BR>"+year[i].AMT_RECEIVABLE_BILL.toLocaleString()+"<BR>"+"</td>";
            	year1 += "<td>" + year[i].AMT_RECEIVABLE_CASH.toLocaleString()+"<BR>"+year[i].AMT_RECEIVABLE_ETC.toLocaleString()+"<BR>"+"</td>";
            	year1 += "<td>" + year[i].DTS_ROTATE.toLocaleString()+"<BR>"+year[i].DT_ROTATE.toLocaleString()+"<BR>"+"</td>";

	        year1 += "</tr>";

         }
            
        $("#year_first tbody").html(year1);
    }
  	
  	//외상잔고실적 목록
    function drawApp2(App2) {
        var app = "";

        for (var i = 0; i < App2.length; i++) {
            app += "<tr>";
	            app += "<td>" + App2[i].NM_PARTNER+"<BR>"+App2[i].QTY_TOTAL.toLocaleString()+"<BR>"
	            	+App2[i].SUM_ATAX_TOTAL.toLocaleString()+"</td>";
	            app += "<td>" + App2[i].AMT_H_PAY.toLocaleString()+"<BR>" + App2[i].AMT_A_PAY.toLocaleString()+"<BR>"
	            	+ App2[i].GIVE_IN.toLocaleString()+"<BR>"+ "</td>";
	            app += "<td>" + App2[i].CREDIT_PAY.toLocaleString()+"<BR>" + App2[i].GIVE_PAY.toLocaleString()+"<BR>"
	            	+ App2[i].CREDIT_NOTE.toLocaleString()+"<BR>" +"</td>";
	            app += "<td>" + App2[i].DT_ROTATE+"<BR>" + App2[i].DTS_ROTATE_J+"<BR>"
	            	+ App2[i].DTS_ROTATE+"<BR>" +"</td>";
	            app += "<td>"+"<BR>" + App2[i].JD+"<BR>" + App2[i].MD+ "</td>";

	        app += "</tr>";

         }
            
        $("#App2_first tbody").html(app);
    }
  	
  	//받을어음현황 목록
    function drawCash(cash) {
        var cash1 = "";

        for (var i = 0; i < cash.length; i++) {
            cash1 += "<tr>";
	            cash1 += "<td>" + cash[i].DTS_EXPIRE+ "</td>";
	            cash1 += "<td>" + cash[i].DTS_INPAY+ "</td>";
	            cash1 += "<td>" + cash[i].AMT_INPAY.toLocaleString()+ "</td>";
	            cash1 += "<td>" + cash[i].NM_PARTNER+ "</td>";
	            cash1 += "<td>" + cash[i].NM_BANK+ "</td>";
	            cash1 += "<td>" + cash[i].NO_NOTE+ "</td>";
	            cash1 += "<td>" + cash[i].NM_CEO+ "</td>";


	        cash1 += "</tr>";

         }
            
        $("#cash_first tbody").html(cash1);
    }
    
    
    //매출현황 목록
    function drawList(list) {
        html = "";

        html += "<tr name=\"" + list[0].GB + "\">";
        html += "<td> 제품 </td>";
        html += "<td>" + list[0].QTY1.toLocaleString() + "</td>";
        html += "<td>" + list[0].AMT1.toLocaleString() + "</td>";
        html += "</tr>";

        html += "<tr name=\"" + list[0].GB + "\">";
        html += "<td> 상품 </td>";
        html += "<td>" + list[0].QTY2.toLocaleString() + "</td>";
        html += "<td>" + list[0].AMT2.toLocaleString() + "</td>";
        html += "</tr>";

        html += "<tr name=\"" + list[0].GB + "\">";
        html += "<td>" + list[0].NM_PROD_L + "</td>";
        html += "<td>" + list[0].QTY.toLocaleString() + "</td>";
        html += "<td>" + list[0].AMT.toLocaleString() + "</td>";
        html += "</tr>";
        $("#first tbody").html(html);

        html2 = "";

        for (var i = 1; i < 8; i++) {
            html2 += "<tr name=\"" + list[i].GB + "\">";

            html2 += "<td>" + list[i].NM_PROD_M + "</td>";
            html2 += "<td>" + list[i].QTY1.toLocaleString() + "</td>";
            html2 += "<td>" + list[i].AMT1.toLocaleString() + "</td>";
            html2 += "<td>" + list[i].QTY2.toLocaleString() + "</td>";
            html2 += "<td>" + list[i].AMT2.toLocaleString() + "</td>";
            html2 += "</tr>";
        }
        $("#second tbody").html(html2);

        html3 = "";

        for (var i = 8; i < list.length; i++) {
            html3 += "<tr name=\"" + list[i].GB + "\">";

            html3 += "<td>" + list[i].NM_SALES_MAN + "</td>";
            html3 += "<td>" + list[i].NM_PROD_M + "</td>";
            html3 += "<td>" + list[i].QTY.toLocaleString() + "</td>";
            html3 += "<td>" + list[i].AMT.toLocaleString() + "</td>";
            html3 += "</tr>";
        }
        $("#third tbody").html(html3);

    }
    

    
</script>
<head>
<title>매출현황</title>
</head>
<body>
	<div class="contents">
		<form action="#" method="post" id="actionForm">
			<input type="hidden" id="date1" name="date1" value="" />
			<input type="hidden" id="date3" name="date3" value="" />
			<input type="hidden" id="date4" name="date4" value="" />
			<input type="hidden" id="date" name="date" value="" />
			<input type="hidden" id="empno" name="empno" value="${user.login_id}" />
			<div>
				<ul class="top_tabs">
					<li class="tab-link current" data-tab="top-1">거래처원장</li>
					<li class="tab-link" data-tab="top-2">연간 판매실적</li>
					<li class="tab-link" data-tab="top-3">외상잔고실적(담당자별)</li>
					<li class="tab-link" data-tab="top-4">받을어음현황</li>
					<li class="tab-link" data-tab="top-5">매출현황</li>
					<input class="logout_btn" type="button" id="logout_btn" value="로그아웃" />
				</ul>
			</div>
			<!-- 거래처 원장 -->
			<div id="top-1" class="tab-content current">
				<ul class="tabs1">
					<li class="tab-link current" data-tab="tab1-1">판매현황</li>
					<li class="tab-link" data-tab="tab1-2">입금현황</li>
					<!-- 거래처목록 -->
					<select class="partner_css" name="cd_partner" id="cd_partner">
					</select>
					<input type="month" class="month_btn" id="month1" />
					<div class="img_div">
						<img id="search2" class="search_btn" src="resources/images/sales/search.png">
					</div>
				</ul>
				<div id="tab1-1" class="tab-content1 current">
					<table class="table_css" id="order_first">
						<thead>
							<tr>
								<th width="150px">일자</th>
								<th width="100px">품목</th>
								<th width="120px">수량</th>
								<th width="120px">단가</th>
								<th width="120px">금액</th>
								<th width="120px">농장</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div id="tab1-2" class="tab-content1">
					<table class="table_css" id="order_second">
						<thead>
							<tr>
								<th width="150px">일자</th>
								<th width="100px">금액</th>
								<th width="120px">현금입금</th>
								<th width="120px">어음입금</th>
								<th width="120px">어음결제</th>
								<th width="120px">미수취</th>
								<th width="120px">미결어음</th>
								<th width="120px">외상매출금</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 연간 판매실적 -->
			<div id="top-2" class="tab-content">
				<ul class="tabs2">
					<li class="tab-link" data-tab="tab2-1">  </li>
					<!-- 거래처목록 -->
					<select class="partner_css" name="cd_partner2" id="cd_partner2">
					</select>
					<input type="text" class="year_txt" id="year" name="year" placeholder="연도입력" maxlength="4"/>
					<div class="img_div2">
						<img id="search3" class="search_btn" src="resources/images/sales/search.png">
					</div>
				</ul>
				<div id="tab2-1" class="tab-content2 current">
					<table class="table_css" id="year_first">
						<thead>
							<tr>
								<th width="100px">년월</th>
								<th width="100px">중량<br>금액</th>
								<th width="120px">현금입금<br>어음입금</th>
								<th width="120px">어음결제<br>받을어음</th>
								<th width="120px">미수취<br>외상매출</th>
								<th width="120px">월말회전일<br>실적회전일</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 외상잔고실적(담당자별) -->
			<div id="top-3" class="tab-content">
				<ul class="tabs3">
					<li class="tab-link" data-tab="tab3-1">  </li>
					<!-- 거래처목록 -->
					<select class="partner_css" name="member" id="member">
						<option>김정욱</option>
						<option>김형민</option>
						<option>문병선</option>
						<option>이주화</option>
						<option>임창모</option>
						<option>장영재</option>
						<option>조방현</option>
						<option>최준영</option>
					</select>
					<input type="month" class="month_btn" id="month3" />
					<div class="img_div2">
						<img id="search_3" class="search_btn" src="resources/images/sales/search.png">
					</div>
				</ul>
				<div id="tab3-1" class="tab-content3 current">
					<table class="table_css" id="App2_first">
						<thead>
							<tr>
								<th >거래처<br>판매량<br>매출액<br></th>
								<th >현금입금<br>어음입금<br>어음결제<br></th>
								<th >미수취<br>미결어음<br>외상매출금<br></th>
								<th >실적회전일<br>월중<br>월말<br></th>
								<th >초과일<br>월중<br>월말<br></th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
			</div>
			<!-- 받을어음현황 -->
			<div id="top-4" class="tab-content">
				<ul class="tabs4">
					<li class="tab-link" data-tab="tab4-1">  </li>
					<!-- 거래처목록 -->
					<select class="partner_css" name="cd_partner4" id="cd_partner4">
					</select>
					<input type="month" class="month_btn" id="month4" />
					<div class="img_div2">
						<img id="search_4" class="search_btn" src="resources/images/sales/search.png">
					</div>
				</ul>
				<div id="tab4-1" class="tab-content4 current">
					<table class="table_css" id="cash_first">
						<thead>
							<tr>
								<th width="100px">만기일</th>
								<th width="100px">입금일</th>
								<th width="120px">어음금액</th>
								<th width="120px">발행인</th>
								<th width="120px">지불장소</th>
								<th width="120px">어음번호</th>
								<th width="120px">대표자</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
			</div>
			<!-- 매출현황 -->
			<div id="top-5" class="tab-content">
				<ul class="tabs5">
					<li class="tab-link current" data-tab="tab5-1">판매현황</li>
					<li class="tab-link" data-tab="tab5-2">축종별</li>
					<li class="tab-link" data-tab="tab5-3">담당자별</li>
					<input type="month" class="month_btn" id="month" />
					<div class="img_div">
						<img id="search" class="search_btn" src="resources/images/sales/search.png">
					</div>
				</ul>
				<div id="tab5-1" class="tab-content5 current">
					<table class="table_css" id="first">
						<thead>
							<tr>
								<th width="150px">구분</th>
								<th width="100px">수량</th>
								<th width="120px">금액</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div id="tab5-2" class="tab-content5">
					<table class="table_css" id="second">
						<thead>
							<tr>
								<th width="150px">중분류</th>
								<th width="100px">수량(제품)</th>
								<th width="120px">금액(제품)</th>
								<th width="120px">수량(상품)</th>
								<th width="120px">금액(상품)</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div id="tab5-3" class="tab-content5">
					<table class="table_css" id="third">
						<thead>
							<tr>
								<th width="100px">담당자</th>
								<th width="150px">중분류</th>
								<th width="120px">수량</th>
								<th width="120px">금액</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
