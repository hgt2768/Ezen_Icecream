<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="../script/accountCheck.js?v=1"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

<style type="text/css">
    table{
    	margin: auto;
        width: 500px;
        border-collapse: collapse;
        border: 1px solid black;
        font-family: Gothic;
    }
    th {
    	border: 1px solid black;
        padding: 5px;
    }
    td{
        border: 1px solid black;
        padding: 5px;
    }
    td.center{
        text-align: center;
    }
</style>
</head>
<body>
	<form action="write.do" name="form" id="form1" method="post" onsubmit="inputCheck() return false()">
		<div>
			<table>
				<tr>
					<th class="center">이름</th>
					<td>
						<input type="text" name="name" id="name" placeholder="*필수 입력">
					</td>
				</tr>
				<tr>
					<th class="center">아이디</th>
					<td>
						<input type="text" name="id" id="id" placeholder="*필수 입력">
						<input type="button" value="중복체크" onclick="checkId()">
					</td>
				</tr>
				<tr>
					<th class="center">비밀번호</th>
					<td>
						<input type="password" name="pass" id="pass" placeholder="*필수 입력">
					</td>
				</tr>
				<tr>
					<th class="center">비밀번호 재확인</th>
					<td>
						<input type="password" name="repass" id="repass" placeholder="*필수 입력">
					</td>
				</tr>
				<tr>
					<th class="center">성별</th>
					<td>
						<input style="width: 50px" type="radio" name="gender" value="남">남
						<input style="width: 50px" type="radio" name="gender" value="여">여
					</td>
				</tr>
				<tr>
					<th class="center">전화 번호</th>
					<td>
                    <input type="text" name="tel1" id="tel1" maxlength="3" style="width: 20%"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">-
                    <input type="text" name="tel2" id="tel2" maxlength="4" style="width: 20%"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">-
                    <input type="text" name="tel3" id="tel3" maxlength="4" style="width: 20%"
                           oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                </td>
				</tr>
				<tr>
					<th class="center">주소</th>
					<td>
						<input type="text" id="sample4_postcode" placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
						<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="sample4_detailAddress" placeholder="상세주소">
						<input type="text" id="sample4_extraAddress" placeholder="참고항목">
					</td>
				</tr>
				<tr>
					<th class="center">이메일</th>
					<td>
						<input type="email" name="email">
					</td>
				</tr>
				<tr>
					<th class="center">생일</th>
					<td>
						<input style="width: 80px" type="text" name="birth">
					</td>
				</tr>
				<tr>
					<td colspan="2" class="center">
						<input type="submit" value="회원가입">
						<input type="reset" value="다시 작성">
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>