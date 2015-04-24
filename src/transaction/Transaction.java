package transaction;

import java.util.Map;

public interface Transaction {
	@SuppressWarnings("rawtypes")
	public Object execute(Map param) throws Exception;
}
