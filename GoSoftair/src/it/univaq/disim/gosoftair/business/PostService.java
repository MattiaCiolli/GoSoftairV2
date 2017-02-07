package it.univaq.disim.gosoftair.business;

import java.util.List;

import it.univaq.disim.gosoftair.business.model.Post;

public interface PostService {
	List<Post> cercaPostsByEventoPK(long id) throws BusinessException;
	void create(Post post, long idEvento) throws BusinessException;
}
