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

        // Save/update the book
        session.saveOrUpdate(book);
    }

    @Override
    public Book getBook(int id) {
        Session session = sessionFactory.getCurrentSession();
        Book book = session.get(Book.class, id);

        return book;
    }

    @Override
    public void deleteBook(int id) {
        Session session = sessionFactory.getCurrentSession();

        // Delete object with primary key
        Query query = session.createQuery("DELETE FROM Book WHERE id=:bookId");
        query.setParameter("bookId", id);
        query.executeUpdate();
    }

    @Override
    public List<Book> searchBooks(String theSearch) {
        Session session = sessionFactory.getCurrentSession();

        Query query = null;

        // Search only if theSearch is not empty
        if (theSearch != null && theSearch.trim().length() > 0) {

            //Search for title, author, publisher or year
            query = session.createQuery("FROM Book WHERE LOWER(title) LIKE :theSearch" +
                    " OR LOWER(author) LIKE :theSearch " +
                    "OR LOWER(publisher) LIKE :theSearch " +
                    "OR publicationYear LIKE :theSearch", Book.class);
            query.setParameter("theSearch", "%" + theSearch.toLowerCase() + "%");
        } else {
            // theSearch is empty so return all books
            query = session.createQuery("FROM Book ORDER BY title", Book.class);
        }

        List<Book> books = query.getResultList();

        return books;
    }
}
