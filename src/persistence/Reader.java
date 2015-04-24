package persistence;

import java.util.List;

public interface Reader {
	public <T> T get(Class<T> type, Object ID);

	public <T> List<T> objectsRead(String queryName, int startIndex,
			int pageSize, Class<T> type, Object... params);

	public <T> List<T> objectsRead(String queryName, Class<T> type,
			Object... params);

	public <T> T objectRead(String queryName, Class<T> type, Object... params);

	public <T> List<T> objectsReadWithCustomeQuery(String queryString,
			int startIndex, int pageSize, Class<T> type);

	public <T> List<T> objectsReadWithCustomeQuery(String queryString,
			Class<T> type);

	public <T> T objectReadWithCustomeQuery(String queryString, Class<T> type);

	@SuppressWarnings("rawtypes")
	public List attributeTuplesRead(String queryName, int startIndex,
			int pageSize, Object... params);

	@SuppressWarnings("rawtypes")
	public List attributeTuplesRead(String queryName, Object... params);

	public Object[] attributeTupleRead(String queryName, Object... params);
}
