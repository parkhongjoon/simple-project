package net.qwer.com.fa;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class fvDao {
	 @Autowired
	 SqlSessionTemplate sqlSessionTemplate;
	 
	 
	 public int insert(Map<String, Object> map) {
		  return this.sqlSessionTemplate.insert("favorites.insert", map);
		}
	 
	 public int delete(Map<String, Object> map) {  
		 return this.sqlSessionTemplate.delete("favorites.delete", map);  
		 }  
	 
	 public List<Map<String, Object>> selectList(Map<String, Object> map) {  
		 return this.sqlSessionTemplate.selectList("favorites.select_list", map);  
		 }  
	 

	 
}
