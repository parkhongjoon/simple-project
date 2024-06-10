package net.qwer.com;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExDao {
	 @Autowired
	 SqlSessionTemplate sqlSessionTemplate;
	 
	 
	 public int insert(Map<String, Object> map) {
		  return this.sqlSessionTemplate.insert("member.insert", map);
		}
	 
	 public Map<String, Object> selectDetail(Map<String, Object> map) {
		  return this.sqlSessionTemplate.selectOne("member.select_detail", map);
		}
	 
	 public int update(Map<String, Object> map) {
		 return this.sqlSessionTemplate.update("member.update", map);
	 	}
	 
	 public int delete(Map<String, Object> map) {  
		 return this.sqlSessionTemplate.delete("member.delete", map);  
		 }  
	 
	 public List<Map<String, Object>> selectList(Map<String, Object> map) {  
		 return this.sqlSessionTemplate.selectList("member.select_list", map);  
		 }  
	 
	 public int login(Map<String, Object> map) {
	     return this.sqlSessionTemplate.selectOne("member.login", map);
	  	}
	    
	 public int idCheck(Map<String, Object> map) {
		 return this.sqlSessionTemplate.selectOne("member.idCheck", map);
	 }

	 public int nickCheck(Map<String, Object> map) {
		 return this.sqlSessionTemplate.selectOne("member.nickCheck", map);
	 }

}
