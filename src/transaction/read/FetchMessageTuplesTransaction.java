package transaction.read;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Message;
import persistence.DAO;
import transaction.DAOTransaction;

public class FetchMessageTuplesTransaction extends DAOTransaction {

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	protected Object process(DAO dao, Map param) throws Exception {
		// TODO Auto-generated method stub
		List<Object[]> tuples = dao.attributeTuplesRead("Message.fetchTuples");
		Map<String, List<Map<String, Object>>> results = new HashMap<>();
		for (Object[] tuple : tuples) {
			if (!results.containsKey((new SimpleDateFormat("yyyy-MM-dd"))
					.format((Date) tuple[0]))) {
				List<Map<String, Object>> messages = new ArrayList<>();
				results.put((new SimpleDateFormat("yyyy-MM-dd"))
						.format((Date) tuple[0]), messages);
			}
			results.get(
					(new SimpleDateFormat("yyyy-MM-dd"))
							.format((Date) tuple[0])).add(
					((Message) tuple[1]).toRepresentation());
		}
		return results;
	}
}
