package it.univaq.disim.gosoftair.business.model;

import java.util.List;

public class Forum {
	private List<Post> posts;

	public Forum() {
		super();
	}

	public Forum(List<Post> posts) {
		super();
		this.posts = posts;
	}

	public List<Post> getPosts() {
		return posts;
	}

	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}
}
