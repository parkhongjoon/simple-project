package net.qwer.com;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ExController {
   
   @Autowired
   ExService exService;
   
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() {
        return new ModelAndView("member/index");
    }
   
   @RequestMapping(value="/join", method = RequestMethod.GET)
   public ModelAndView create() {
       return new ModelAndView("member/join");
   }
   
   @RequestMapping(value = "/join", method = RequestMethod.POST)
   public ModelAndView createPost(@RequestParam Map<String, Object> map) {
       ModelAndView mav = new ModelAndView();

       String id = this.exService.create(map);
       if (id == null) {
           mav.setViewName("redirect:/join");
           
       }else {
           mav.setViewName("redirect:/login"); 
       }  
       return mav;
   }
   
    @RequestMapping(value = "/join/nickCheck", method = RequestMethod.POST)
    @ResponseBody
    public String nickCheck(@RequestParam Map<String, Object> map) {
        boolean nickExists = exService.nickCheck(map);
        if (nickExists) {
            return "available"; // 이미 존재하는 아이디
        } else {
            return "exist"; // 사용 가능한 아이디
        }
   }
   
    @RequestMapping(value = "/join/idCheck", method = RequestMethod.POST)
    @ResponseBody
    public String idCheck(@RequestParam Map<String, Object> map) {
        boolean idExists = exService.idCheck(map);
        if (idExists) {
            return "available"; // 이미 존재하는 아이디
        } else {
            return "exist"; // 사용 가능한 아이디
        }
   }
    
   @RequestMapping(value = "/detail", method = RequestMethod.GET)
   public ModelAndView detail(@RequestParam Map<String, Object> map) {
       Map<String, Object> detailMap = this.exService.detail(map);

       ModelAndView mav = new ModelAndView();
       mav.addObject("data", detailMap);
       String id = map.get("userid").toString();
       mav.addObject("userid", id);
       mav.setViewName("/member/detail");
       return mav;
   }
   
   @RequestMapping(value = "/update", method = RequestMethod.GET)
   public ModelAndView update(@RequestParam Map<String, Object> map) {
      Map<String, Object> detailMap = this.exService.detail(map);
      
      ModelAndView mav = new ModelAndView();
      mav.addObject("data", detailMap);
      mav.setViewName("/member/update");
      return mav;
   }
   
   @RequestMapping(value = "update", method = RequestMethod.POST)
   public ModelAndView updatePost(@RequestParam Map<String, Object> map) {
      ModelAndView mav = new ModelAndView();
      
      boolean isUpdateSuccess = this.exService.edit(map);
      if (isUpdateSuccess) {
         String id = map.get("id").toString();
         mav.setViewName("redirect:/detail?userid=" + id);
      }else {
         mav = this.update(map);
      }
      return mav;
      
   }

   @RequestMapping(value = "/delete", method = RequestMethod.POST)  
   public ModelAndView deletePost(@RequestParam Map<String, Object> map) {  
   ModelAndView mav = new ModelAndView();  

   boolean isDeleteSuccess = this.exService.remove(map);  
   if (isDeleteSuccess) {  
   mav.setViewName("redirect:/list");  
   }else {  
   String id = map.get("id").toString();  
   mav.setViewName("redirect:/detail?userid=" + id);  
   }  

   return mav;  
   }  
   
   @RequestMapping(value = "list")  
   public ModelAndView list(@RequestParam Map<String, Object> map) {  

   List<Map<String, Object>> list = this.exService.list(map);  

   ModelAndView mav = new ModelAndView();  
   mav.addObject("data", list);
   if (map.containsKey("keyword")) {  
      mav.addObject("keyword", map.get("keyword"));  
      }  
   mav.setViewName("/member/list");  
   return mav;  
   } 
   
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public ModelAndView login() {
        return new ModelAndView("member/index");
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public ModelAndView loginPost(@RequestParam Map<String, Object> map, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        
        for(int i = 0; i < map.size(); i++) {
           System.out.println(map+"11");
        }

        boolean loggedIn = this.exService.login(map);
        if (loggedIn) {
            mav.setViewName("redirect:/index");
            //  로그인시 화면
            
            List<Map<String, Object>> list = this.exService.list(map);
            
            for(int i = 0; i<list.size(); i++) {
               
               System.out.println(list.get(i)); //데이터베이스 가져오는 갯수 많을때 
            
            }
            
            System.out.println(list.get(0).get("role").toString());
            session.setAttribute("userId", map.get("userid"));
            session.setAttribute("userEmail", list.get(0).get("usermail").toString());
            session.setAttribute("role", list.get(0).get("role").toString());
            session.setAttribute("nick", list.get(0).get("nickname").toString());
            
        } else {
            mav.addObject("loginFailed", true); // 로그인 실패여부
            mav.setViewName("member/index"); //  실패시 다시 로그인화면
            mav.addObject("errorMessage", "아이디 또는 비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
        }

        return mav;
    }

    
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 무효화
        return "redirect:/index"; // 로그인 페이지로 리다이렉트
    }
   


    
    
    
    
}

