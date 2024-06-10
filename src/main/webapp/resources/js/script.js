$(document).ready(function(){
    $("#signup").on('click',function(){
      var text = $(this).text();

      $(".signin").toggleClass('moveup');
      $(".signup").toggleClass('moveup');
      $(this).text(
        text == "sign up"?"sign in":"sign up"
      ).toggleClass("active");

      if($(this).text() == "sign up"){
        $(".login").css("overflow", "hidden");
      }else{
        $(".login").css("overflow", "visible")
      }
    });

  });

  let currentSlide = 0;
const slides = $('#slideshow');

function nextSlide(){
    slides.eq(currentSlide).removeClass('active');
    currentSlide = (currentSlide + 1) % slides.length;
    slides.eq(currentSlide).addClass('active');
}

$(document).ready(function(){
    setInterval(nextSlide, 3000); // 3초마다 슬라이드 전환
});

//즐겨찾기 최근검색
$(document).ready(function(){
    $(".re").on('click',function(){
        $(".bookmark").css("display","none");
        $(".recent").css("display","block");
    });
    $(".bm").on('click',function(){
        $(".recent").css("display","none");
        $(".bookmark").css("display","block");
    });
    });






