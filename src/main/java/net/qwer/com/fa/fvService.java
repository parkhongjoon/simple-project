package net.qwer.com.fa;

import java.util.List;
import java.util.Map;

public interface fvService {

	String create(Map<String, Object> map);
	
	boolean remove(Map<String, Object> map);

	List<Map<String, Object>> list(Map<String, Object> map);


}
