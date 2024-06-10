package net.qwer.com;

import java.util.List;
import java.util.Map;

public interface ExService {

	String create(Map<String, Object> map);
	
	Map<String, Object> detail(Map<String, Object> map);

	boolean edit(Map<String, Object> map);

	boolean remove(Map<String, Object> map);

	List<Map<String, Object>> list(Map<String, Object> map);

	boolean login(Map<String, Object> map);
	
	boolean idCheck(Map<String, Object> map);

	boolean nickCheck(Map<String, Object> map);

}
