package com.library.dao;

import com.library.entity.Book;

import java.util.List;

public interface BookDAO {
    public List<Book> getBooks();
    public void saveBook(Book book);
    public Book getBook(int id);
    public void deleteBook(int id);
    public List<Book> searchBooks(String theSearch);
}
