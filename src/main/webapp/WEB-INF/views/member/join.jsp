<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<html>
<head>
    <title>회원가입</title>
    <link rel="shortcut icon" href="#">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f4;
        }

        form {
            max-width: 500px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="tel"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"],
        input[type="button"] {
            width: 48%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
        }

        input[type="button"] {
            background-color: #dc3545;
            color: #fff;
        }

        input[type="submit"]:hover,
        input[type="button"]:hover {
            opacity: 0.9;
        }

        .error-message {
            color: red;
            font-size: 14px;
        }
    </style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    function dPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                document.getElementById('zipcode').value = data.zonecode; // 우편번호 필드에 우편번호 설정
                document.getElementById("addr1").value = addr; // 주소 필드에 주소 설정
                document.getElementById("addr2").focus(); // 상세주소 필드로 포커스 이동
            }
        }).open();
    }
    

    $(document).ready(function() {
        var isNicknameAvailable = false; // 닉네임 사용 가능 여부를 나타내는 변수

        // 중복 확인 버튼 클릭 이벤트
        $('#nickCheckBtn').click(function() {
            var nickname = $('#nickname').val(); // 입력된 닉네임 가져오기

            // 입력값이 비어 있는지 확인
            if (nickname.trim() === '') {
                alert('닉네임을 입력하세요.');
                return; // 함수 종료
            }

            // AJAX 요청 생성
            $.ajax({
                type: 'POST',
                url: 'join/nickCheck', // 중복 확인을 처리하는 컨트롤러의 엔드포인트 URL
                data: { 'nickname': nickname }, // 서버로 보낼 데이터
                success: function(response) {
                    if (response === 'exist') {
                        alert('이미 사용 중인 닉네임입니다.');
                        isNicknameAvailable = false; // 닉네임 사용 불가능으로 설정
                    } else if (response === 'available') {
                        alert('사용 가능한 닉네임입니다.');
                        isNicknameAvailable = true; // 닉네임 사용 가능으로 설정
                    } else {
                        // 예상치 못한 응답에 대한 처리
                        alert('예상치 못한 응답입니다.');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error: ', status, error);
                }
            });
        });

        // 폼 전송 이벤트
        $('#memberform').submit(function(event) {
            // 닉네임이 사용 가능하지 않은 경우 폼 전송 막기
            if (!isNicknameAvailable) {
                event.preventDefault(); // 기본 동작(폼 전송) 막기
                alert('닉네임 중복 확인을 해주세요.');
            }
        });
    });
    
    
    $(document).ready(function() {
        var isIdAvailable = false; // 아이디 사용 가능 여부를 나타내는 변수

        // 중복 확인 버튼 클릭 이벤트
        $('#idCheckBtn').click(function() {
            var userid = $('#userid').val(); // 입력된 아이디 가져오기

            // 입력값이 비어 있는지 확인
            if (userid.trim() === '') {
                alert('아이디를 입력하세요.');
                return; // 함수 종료
            }

            // AJAX 요청 생성
            $.ajax({
                type: 'POST',
                url: 'join/idCheck', // 중복 확인을 처리하는 컨트롤러의 엔드포인트 URL
                data: { 'userid': userid }, // 서버로 보낼 데이터
                success: function(response) {
                    if (response === 'exist') {
                        alert('이미 사용 중인 아이디입니다.');
                        isIdAvailable = false; // 아이디 사용 불가능으로 설정
                    } else if (response === 'available') {
                        alert('사용 가능한 아이디입니다.');
                        isIdAvailable = true; // 아이디 사용 가능으로 설정
                    } else {
                        // 예상치 못한 응답에 대한 처리
                        alert('예상치 못한 응답입니다.');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error: ', status, error);
                }
            });
        });

        // 폼 전송 이벤트
        $('#memberform').submit(function(event) {
            // 아이디가 사용 가능하지 않은 경우 폼 전송 막기
            if (!isIdAvailable) {
                event.preventDefault(); // 기본 동작(폼 전송) 막기
                alert('아이디 중복 확인을 해주세요.');
            }
        });
    });
    
    
    function checkPasswordMatch() {
        var password = document.getElementById("password").value;
        var confirm_password = document.getElementById("confirm_password").value;

        if (password != confirm_password) {
            document.getElementById("passwordMatch").style.display = "block";
        } else {
            document.getElementById("passwordMatch").style.display = "none";
        }
    }

    function validateForm() {
        var password = document.getElementById("password").value;
        var confirm_password = document.getElementById("confirm_password").value;

        if (password !== confirm_password) {
            alert('비밀번호가 일치하지 않습니다.');
            return false; // 폼 제출을 막음
        } else {
            return true; // 폼 제출을 허용
        }
    }
</script>
</head>

<body>
    <form id="memberform" method="POST" onsubmit="return validateForm()">
        <div class="form-group">
            <label for="name">이름</label>
            <input type="text" class="form-control" id="name" placeholder="이름" name="name" required>
        </div>
        <div class="form-group">
            <label for="nickname">닉네임</label>
		    <input type="text" class="form-control" id="nickname" placeholder="닉네임" name="nickname" required>
		    <button type="button" id="nickCheckBtn">중복 확인</button>
        </div>
		<div class="form-group">
		    <label for="userid">아이디</label>
		    <input type="text" class="form-control" id="userid" placeholder="아이디" name="userid" required>
		    <button type="button" id="idCheckBtn">중복 확인</button>
		</div>
		<div class="form-group">
		    <label for="password">비밀번호</label>
		    <input type="password" class="form-control" id="password" placeholder="비밀번호" name="password" pattern="(?=.*\d)(?=.*[a-zA-Z]).{8,}" title="숫자와 영문자를 포함하여 최소 8자 이상이어야 합니다." required>
		</div>
		<div class="form-group">
		    <label for="confirm_password">비밀번호 확인</label>
		    <input type="password" class="form-control" id="confirm_password" placeholder="비밀번호확인" name="confirm_password" pattern="(?=.*\d)(?=.*[a-zA-Z]).{8,}" title="숫자와 영문자를 포함하여 최소 8자 이상이어야 합니다." required oninput="checkPasswordMatch()">
		    <div id="passwordMatch" style="display:none; color:red;">비밀번호가 일치하지 않습니다.</div>
		</div>
		<div class="form-group">
		    <label for="usermail">이메일</label>
		    <input type="text" class="form-control" id="usermail" placeholder="이메일을 입력하세요" name="usermail" required>
		    <div id="emailError" class="error-message"></div>
		</div>	
        <div class="form-group">
            <label for="tel">전화번호</label>
            <input type="text" class="form-control" id="tel" placeholder="전화번호" name="tel" required>
            <div id="telError" class="error-message"></div>
        </div>
        <div class="form-group">
            <label for="zipcode">우편번호</label>
			<input type="number" name="zipcode" id="zipcode" class="form-control" placeholder="우편번호" readonly>        
		</div>
			<button type="button" id="zip" class="btn btn-secondary mt-1" onclick="dPostcode()">우편번호찾기</button>
        <div class="form-group">
            <label for="zip">주소</label>
            <input type="text" class="form-control" id="addr1" name="addr1" placeholder="주소" readonly>
        </div>
        <div class="form-group">
            <label for="zip">상세주소</label>
            <input type="text" class="form-control" id="addr2" name="addr2"  placeholder="상세주소">
        </div>
	    <div class="form-group">
	        <label for="birth">생년월일</label>
	        <input type="text" class="form-control" id="birth" name="birth" placeholder="YYYY-MM-DD">
	        <div id="birthError" class="error-message"></div>
	    </div>

        <div class="form-group d-flex justify-content-between">
            <button type="submit" class="btn btn-primary" value="저장"><i class="fas fa-user-plus mr-1"></i>회원가입</button>
 			<button type="button" class="btn btn-danger" onclick="window.history.back();"><i class="fas fa-times mr-1"></i>취소</button>
 		</div>
    </form>
</body>
<script>

function validateEmail() {
    const emailInput = document.getElementById('usermail'); // 수정된 부분
    const emailError = document.getElementById('emailError');
    const email = emailInput.value.trim();

    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

    if (!emailRegex.test(email)) {
        emailError.textContent = '유효한 이메일 주소를 입력하세요.';
        emailInput.focus();
        return false;
    } else {
        emailError.textContent = '';
        return true;
    }
}

// 이메일 입력란에서 포커스를 잃을 때마다 이메일 유효성을 검사하는 이벤트
const emailInput = document.getElementById('usermail'); // 수정된 부분
emailInput.addEventListener('blur', function() {
    validateEmail();
});
	
	// 핸드폰 번호 입력란
	const telInput = document.getElementById('tel');

	// 핸드폰 번호 입력 시 자동으로 "-"를 추가하는 함수
	function autoHyphenPhoneNumber() {
	    let tel = telInput.value.replace(/\D/g, ''); // 숫자 이외의 문자 모두 제거

	    // 첫 번째 "-" 삽입
	    if (tel.length >= 3 && tel.charAt(3) !== '-') {
	        tel = tel.slice(0, 3) + '-' + tel.slice(3);
	    }

	    // 두 번째 "-" 삽입
	    if (tel.length >= 8 && tel.charAt(8) !== '-') {
	        tel = tel.slice(0, 8) + '-' + tel.slice(8);
	    }

	    // 최대 입력 수 제한
	    tel = tel.slice(0, 13);

	    // 형식에 맞게 변환된 핸드폰 번호를 입력란에 설정
	    telInput.value = tel;
	}

	// 핸드폰 번호 입력란에서 숫자를 입력할 때마다 자동으로 "-"를 추가하는 이벤트 핸들러 등록
	telInput.addEventListener('input', autoHyphenPhoneNumber);

	// 핸드폰 번호 유효성 검사 함수
	function validatePhoneNumber() {
	    let tel = telInput.value.trim();

	    const telRegex = /^010-\d{4}-\d{4}$/; // 010으로 시작하고 "-"를 포함하여 총 11자리인 전화번호 형식

	    if (!telRegex.test(tel)) {
	        telError.textContent = '유효한 전화번호를 입력하세요. (예: 010-1234-5678)';
	        telInput.focus();
	        return false;
	    } else {
	        telError.textContent = '';
	        return true;
	    }
	}

	// 핸드폰 번호 입력란에서 포커스를 잃을 때마다 핸드폰 번호 유효성을 검사하는 이벤트 핸들러 등록
	telInput.addEventListener('blur', validatePhoneNumber);


	// 생년월일 입력란
	const birthInput = document.getElementById('birth');
	const birthError = document.getElementById('birthError');

	// 생년월일 입력 시 자동으로 "-"를 추가하는 함수
	function autoHyphenBirth() {
	    let birth = birthInput.value.replace(/\D/g, ''); // 숫자 이외의 문자 모두 제거

	    // 첫 번째 "-" 삽입
	    if (birth.length >= 5 && birth.charAt(4) !== '-') {
	        birth = birth.slice(0, 4) + '-' + birth.slice(4);
	    }

	    // 두 번째 "-" 삽입
	    if (birth.length >= 8 && birth.charAt(7) !== '-') {
	        birth = birth.slice(0, 7) + '-' + birth.slice(7);
	    }

	    // 최대 입력 수 제한
	    birth = birth.slice(0, 10);

	    // 형식에 맞게 변환된 생년월일을 입력란에 설정
	    birthInput.value = birth;
	}

	// 생년월일 입력란에서 숫자를 입력할 때마다 자동으로 "-"를 추가하는 이벤트 핸들러 등록
	birthInput.addEventListener('input', autoHyphenBirth);

	// 생년월일 유효성 검사 함수
	function validateBirth() {
	    let birth = birthInput.value.trim();

	    const birthRegex = /^\d{4}-\d{2}-\d{2}$/; // "YYYY-MM-DD" 형식의 정규표현식

	    if (!birthRegex.test(birth)) {
	        birthError.textContent = '유효한 생년월일을 입력하세요. (예: 2000-08-02)';
	        birthInput.focus();
	        return false;
	    } else {
	        const parts = birth.split('-');
	        const year = parseInt(parts[0], 10);
	        const month = parseInt(parts[1], 10);
	        const day = parseInt(parts[2], 10);

	        // 입력된 날짜가 유효한지 확인
	        const date = new Date(year, month - 1, day); // JavaScript의 월은 0부터 시작하므로 month - 1
	        if (date.getFullYear() !== year || date.getMonth() + 1 !== month || date.getDate() !== day) {
	            birthError.textContent = '유효한 날짜가 아닙니다.';
	            birthInput.focus();
	            return false;
	        }

	        birthError.textContent = '';
	        return true;
	    }
	}

	// 생년월일 입력란에서 포커스를 잃을 때마다 생년월일 유효성을 검사하는 이벤트 핸들러 등록
	birthInput.addEventListener('blur', validateBirth);

</script>

</html>