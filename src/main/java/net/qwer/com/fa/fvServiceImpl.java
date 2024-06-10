package net.qwer.com.fa;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class fvServiceImpl implements fvService {
	 @Autowired
	 fvDao ExDao;
	 
	 @Override
	 public String create(Map<String, Object> map) {
	     int affectRowCount = this.ExDao.insert(map);
	     if (affectRowCount ==  1) {
	         return map.get("userid").toString();
	     }
	     return null;
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
 
	 

	 

}

