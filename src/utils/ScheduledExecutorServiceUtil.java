package utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

public class ScheduledExecutorServiceUtil {
	private static ScheduledExecutorService service;
	private static Map<String, Future<?>> taskManageMap;
	private static List<String> clearHelpingList;

	public static void startUp() {
		service = Executors.newScheduledThreadPool(5);
		taskManageMap = new HashMap<>();
		clearHelpingList = new ArrayList<>();
	}

	public static void shutDown() {
		service.shutdownNow();
		taskManageMap.clear();
		clearHelpingList.clear();
	}

	public static synchronized void addTask(String ID, Runnable task) {
		ScheduledFuture<?> future;

		if (taskManageMap.containsKey(ID)) {
			future = (ScheduledFuture<?>) taskManageMap.get(ID);
			if (!future.isDone() && !future.isCancelled())
				future.cancel(true);
			taskManageMap.remove(ID);
		}

		future = service.schedule(task, 30, TimeUnit.MINUTES);
		taskManageMap.put(ID, future);

		for (Entry<String, Future<?>> entry : taskManageMap.entrySet()) {
			if (entry.getValue().isDone() || entry.getValue().isCancelled())
				clearHelpingList.add(entry.getKey());
		}
		for (String id : clearHelpingList)
			taskManageMap.remove(id);
		clearHelpingList.clear();
	}
}
