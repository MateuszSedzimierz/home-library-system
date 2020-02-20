package com.library.dao;

import com.library.entity.Book;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookDAOImpl implements BookDAO {

    // Inject the session factory
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Book> getBooks() {

        // Get current hibernate session
        Session session = sessionFactory.getCurrentSession();

        // Create a query and sorting by title
        Query<Book> query = session.createQuery("FROM Book ORDER BY title", Book.class);

        // Execute query and get result list
        List<Book> books = query.getResultList();

        // Return results
        return books;
    }

    @Override
    public void saveBook(Book book) {
        Session session = sessionFactory.getCurrentSession();

        System.out.println(book);

        // Save the book
        session.save(book);
    }
}
