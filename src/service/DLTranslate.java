package service;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;

import org.glassfish.jersey.jackson.JacksonFeature;
import org.glassfish.jersey.media.multipart.MultiPartFeature;

@ApplicationPath("/DLT")
public class DLTranslate extends Application {
	public Set<Class<?>> getClasses() {
		Set<Class<?>> classes = new LinkedHashSet<Class<?>>();

		classes.add(NewsService.class);
		classes.add(CommentService.class);
		classes.add(MessageService.class);
		classes.add(JacksonFeature.class);
		classes.add(MultiPartFeature.class);
		return classes;
	}

	public Set<Object> getSingletons() {
		Set<Object> singletons = new LinkedHashSet<Object>();

		return singletons;
	}
}
