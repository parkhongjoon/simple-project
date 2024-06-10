    
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