package net.qwer.com;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ExServiceImpl implements ExService {
	 @Autowired
	 ExDao ExDao;
	 
	 @Override
	 public String create(Map<String, Object> map) {
	     int affectRowCount = this.ExDao.insert(map);
	     if (affectRowCount ==  1) {
	         return map.get("userid").toString();
	     }
	     return null;
	 }
	 
	 @Override
	 public Map<String, Object> detail(Map<String, Object> map) {
		 
		 return this.ExDao.selectDetail(map);
	 }
	 
	 @Override
	 public boolean edit(Map<String, Object> map) {
		 int affectRowCount = this.ExDao.update(map);
		 return affectRowCount == 1;
	 }

	 @Override  
	 public boolean remove(Map<String, Object> map) {  
	 int affectRowCount = this.ExDao.delete(map);  
	 return affectRowCount == 1;  

	 }  
	 
	 @Override  
	 public List<Map<String, Object>> list(Map<String, Object> map){  
	 return this.ExDao.selectList(map);  
	 }  
 
	 
	 @Override
	 public boolean login(Map<String, Object> map) {
	     String userid = (String) map.get("userid");
	     String password = (String) map.get("password");


	     int count = ExDao.login(map);

	     return count == 1; 
	 }
	
	 
	 @Override
	 public boolean idCheck(Map<String, Object> map) {
		 String userid = (String) map.get("userid");
		 int count = ExDao.idCheck(map);
		 return count == 0;
	 }
	 
	 @Override
	 public boolean nickCheck(Map<String, Object> map) {
		 String nickname = (String) map.get("nickname");
		 int count = ExDao.nickCheck(map);
		 return count == 0;
	 }
	 
	 

}

