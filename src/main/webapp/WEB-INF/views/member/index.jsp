<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/map.css">
    <script src="resources/js/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="resources/js/script.js"></script>
    <script src="resources/js/script_join1.js"></script>
    
      
    <title>Document</title>
</head>
<body>
    <div class="aside">
        <div class="login" id="login"> 
        
       <% if (session.getAttribute("userId") == null) {  %> 
            <div class="signin">
            
                <form action="login" method="POST">
                  <div class="logo">
                    <i class="fa ri-login-circle-line"></i>
                  </div>
                  <div class="input-group">
                    <i class="fa ri-user-2-fill"></i>
                    <input type="text" class="form-control" id="id" name="userid" placeholder="id" required>
                  </div>
                  
                  <div class="input-group">
                    <i class="fa fa-unlock-alt"></i>
                    <input type="password" class="form-control" id="pass" name="password" placeholder="Password" required>
                  </div>
                  <input type="hidden" id="role" name="role">
                  <button type="submit">Sign In</button>
                </form>
                
                 <%-- 로그인 실패 시 알림창 표시 --%>
     <% if (request.getAttribute("loginFailed") != null) { %>
    <script>
       alert("${errorMessage}");
       window.location.href = "index"; // 인덱스 페이지로 리디렉션
    </script>
    <% } %>

              
                <a id="signup">sign up</a>
              </div>
              
              <div class="signup">
              
                 <form action="join" id="memberform" method="POST" onsubmit="return validateForm()">
                  <div class="logo">
                    <i class="fa fa-user-circle-o"></i>
                  </div>
                  
                  <div class="input-group">
                    <i class="fa fa-user"></i>
                     <input type="text" class="form-control" id="name" placeholder="이름" name="name" required>
                  </div>
                  
                   <div class="input-group">
                    <i class="fa fa-user"></i>
                     <input type="text" class="form-control" id="nickname" placeholder="닉네임" name="nickname" required>
                 	 <button type="button" class="btn btn-primary" id="nickCheckBtn">중복 확인</button>
                  </div>
                  
                  <div class="input-group">
                    <i class=" fa ri-user-2-fill"></i>
                     <input type="text" class="form-control" id="userid" placeholder="아이디" name="userid" required>
		   			 <button type="button" class="btn btn-primary" id="idCheckBtn">중복 확인</button>
                  </div>
                   
                  <div class="input-group">
                    <i class="fa fa-unlock-alt"></i>
                     <input type="password" class="form-control" id="password" placeholder="비밀번호" name="password" pattern="(?=.*\d)(?=.*[a-zA-Z]).{8,}" title="숫자와 영문자를 포함하여 최소 8자 이상이어야 합니다." required>
                  </div>
                  
                   <div class="input-group">
                     <i class="fa fa-unlock-alt"></i>
                    <input type="password" class="form-control" id="confirm_password" placeholder="비밀번호확인" name="confirm_password" pattern="(?=.*\d)(?=.*[a-zA-Z]).{8,}" title="숫자와 영문자를 포함하여 최소 8자 이상이어야 합니다." required oninput="checkPasswordMatch()">
		  			<div id="passwordMatch" style="display:none;">비밀번호가 일치하지 않습니다.</div>
                  </div>
                  
			        <div class="input-group">
					    <input type="text" class="form-control" id="usermail" placeholder="이메일을 입력하세요" name="usermail" required>
					    <div id="emailError" class="error-message"></div>
					</div>	
			        <div class="input-group">
			            <input type="text" class="form-control" id="tel" placeholder="전화번호" name="tel" required>
			            <div id="telError" class="error-message"></div>
			        </div>
			        
			        <button type="button" id="zip" class="btn btn-primary" onclick="dPostcode()">우편번호찾기</button>
			        
			        <div class="input-group">
							<input type="number" name="zipcode" id="zipcode" class="form-control" placeholder="우편번호" readonly>        
					</div>
			
			        <div class="input-group">
			            <input type="text" class="form-control" id="addr1" name="addr1" placeholder="주소" readonly>
			        </div>
			        <div class="input-group">
			            <input type="text" class="form-control" id="addr2" name="addr2"  placeholder="상세주소">
			        </div>
				    <div class="input-group">
				        <input type="text" class="form-control" id="birth" name="birth" placeholder="생년월일 : YYYY-MM-DD">
				        <div id="birthError" class="error-message"></div>
				    </div>
			
			        <div class="input-group d-flex justify-content-between">
			            <button type="submit" class="btn btn-primary" value="저장">Sign Up</button>
			 		</div>
               
                </form>
              </div>
              <% } %>
             
             <% if (session.getAttribute("userId") != null) { %>
       	      <script>
              $(document).ready(function(){           
            	 $("#login").removeClass('login').addClass('login2');            
              });
              </script>
			    <div class="lg2_b1">
			        <i class="ri-user-3-line"></i>
			        <div class="lg2_text">
			          <p>환영합니다. <%= session.getAttribute("userId") %>님</p>
			          <p><%= session.getAttribute("userEmail") %></p>
			        </div>
			        </div>
			        <div class="lg2_b2">
			          <a href="update?id=${id}">수정</a>
			          <a href="logout">로그아웃</a>
			        </div>                 
			         <div class="userbox">
				        <label class="bm">즐겨찾기</label>
				        <label class="re">최근검색</label>
				
				        <ul class="bookmark">
				            <li>즐겨찾기1</li>
				            <li>즐겨찾기1</li>
				            <li>즐겨찾기1</li>
				            <li>즐겨찾기1</li>
				        </ul>
				        <ul class="recent">
				            <li>최근검색1</li>
				            <li>최근검색1</li>
				            <li>최근검색1</li>
				            <li>최근검색1</li>
				        </ul>
				        </div><!--userbox-->   
            <% } %>
              
              
              
        </div>
        
        <div class="ad_box">
          <div class="ad_ul">
            <li><img src="resources/img/홍대개미 배너.jpg" alt="ad1"></li>
            <li><img src="resources/img/마약순두부 배너.jpg" alt="ad2"></li>
            <li><img src="resources/img/심가네푸드 배너.jpg" alt="ad3"></li>
            <li class="adx"><p>광고문의 010-0000-0000</p></li>
            <li class="adx"><p>광고문의 010-0000-0000</p></li>
            <li class="adx"><p>광고문의 010-0000-0000</p></li>
          </div>
        </div>

    </div> <!--/aside-->
    <div class="container"> 
     <div class="header">
        <div class="header_icon">
        <i class="ri-instagram-line fs-30 mr-1"></i>
        <i class="ri-facebook-circle-fill fs-30 mr-1"></i>
        <i class="ri-kakao-talk-fill fs-30"></i>
         </div>

         <div class="header_text">
        <h1 class="ml-5">T a s t e </h1>
        <h1 class="ml-5"> P r o </h1>
         </div>
        <div class="search-box">
            <input type="text" class="search-txt" name=""placeholder="Type to search">
            <a class="search-btn" href="#">
              <i class="fas fa-search "></i>
            </a>
          </div>
    </div><!--header-->
    

     <div class="topslide">
        <div class="ts_box">
        <i class="ri-arrow-left-wide-line ml-3"></i>
             <form onsubmit="searchPlaces(); return false;">
        <ul id="slideshow">
        
          <li class="tslide">
            <button id="i_1Btn"> 
           <img src="resources/img/족발아이콘.jpg" alt="족발">
            </button>
            <p>족발·보쌈</p>
         </li>
         
          <li class="tslide">
            <button id="i_2Btn">
            <img src="resources/img/초밥아이콘.png" alt="초밥">
            </button>
             <p>초밥</p>         
         </li>
         
          <li class="tslide">
             <button id="i_3Btn">
              <img src="resources/img/고기구이아이콘.png" alt="고기">
             </button>
             <p>고기·구이</p>
         </li>
         
          <li class="tslide">
            <button id="i_4Btn">
             <img src="resources/img/피자아이콘.png" alt="피자">
             </button>
             <p>피자</p>
         </li>
         
          <li class="tslide">
            <button id="i_5Btn">
             <img src="resources/img/찌개아이콘.png" alt="찌개">
             </button>
             <p>찌개·탕</p>
         </li>
         
          <li class="tslide">
            <button id="i_6Btn">
             <img src="resources/img/파스타아이콘.png" alt="양식">
             </button>
             <p>양식</p>
         </li>
         
          <li class="tslide">
            <button id="i_7Btn">
             <img src="resources/img/짜장면아이콘.jpg" alt="중식">
             </button>
             <p>중식</p>
         </li>
         
          <li class="tslide">
            <button id="i_8Btn">
             <img src="resources/img/쌀국수 아이콘.png" alt="아시안">
             </button>
             <p>아시안</p>
         </li>
         
          <li class="tslide">
            <button id="i_9Btn">
             <img src="resources/img/치킨아이콘.png" alt="치킨">
             </button>
             <p>치킨</p>
         </li>
         
          <li class="tslide">
            <button id="i_10Btn">
             <img src="resources/img/백반아이콘.png" alt="백반">
             </button>
             <p>백반</p>
         </li>
         
         <li class="tslide">
          <button id="i_11Btn">
             <img src="resources/img/백반아이콘.png" alt="백반">
             </button>
             <p>죽</p>
         </li>
         
         </ul>
         </form>
        <i class="ri-arrow-right-wide-line mr-3"></i>
       </div>
    </div> <!--/topslide-->
   

     <div class="main">
       
        <div class="map_wrap">
        <div id="map" style="top:0;width:700px;height:700px;"></div>
      
		</div>
		       
       
        <div class="main_slide"> 
        
          <div id="menu_wrap" class="bg_white">
            <div class="option">
                <div>
                    <form onsubmit="searchPlaces(); return false;">                 
                        키워드 : <input type="text" value="" id="keyword" size="15"> 
                        <button type="submit">검색하기</button> 
                    </form>
                    
                </div>
		            </div>
		            <hr>
		            <ul id="placesList"></ul>
		            <div id="pagination"></div>
		        </div>
        </div>
     </div><!--/main-->
     <div class="event">
        <ul class="event_ul">
            <li class="eventbox">오늘의 이벤트매장</li>
            <li class="eventbox">오늘의 이벤트매장</li>
            <li class="eventbox">오늘의 이벤트매장</li>
        </ul>
     </div><!--/event-->

     <div class="detail">
        <div class="dt_box1">
            <div class="dt_img">가게사진</div>
            <div class="dt_box2">
                <div class="dt_title">가게타이틀</div>
                <div class="dt_menu">메뉴등 가게정보</div>
            </div>
        </div>
        <div class="dt_location">가게 위치</div>
     </div><!--/detail-->

     <div class="footer">
        <p>&copy; 2024 GoodLife company. All Rights Reserved.</p>
        <p>123 GimpoRiverStreet, Gimpo, Korea | Phone: 123-456-7890 | Email: ezen@example.com</p>

     </div><!--/footer-->
    </div><!--/container-->
    
</body>
<script src="resources/js/script_join2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=923478bad09b7c23b501c57f18da1308&libraries=services"></script>
<script src="resources/js/map.js"></script>
</html>