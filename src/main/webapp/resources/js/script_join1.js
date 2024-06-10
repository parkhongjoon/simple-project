
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
    
    