package com.library.controller;

import com.library.entity.Book;
import com.library.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class LibraryController {

    @Autowired
    private BookService bookService;

    @GetMapping("/list")
    public String listBooks(Model model) {

        // Get books from service
        List<Book> books = bookService.getBooks();

        // Add books to the model
        model.addAttribute("books", books);

        return "list-books";
    }

    @GetMapping("/showFormForAdd")
    public String showFormForAdd(Model model) {

        Book book = new Book();

        model.addAttribute("book", book);

        return "book-form";
    }

    @PostMapping("/saveBook")
    public String saveBook(@ModelAttribute("book") Book book) {

        // Save book using service
        bookService.saveBook(book);

        return "redirect:/list";
    }

    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("bookId") int id, Model model) {
        Book book = bookService.getBook(id);

        model.addAttribute("book", book);

        return "book-form";
    }

    @GetMapping("/delete")
    public String deleteBook(@RequestParam("bookId") int id) {
        bookService.deleteBook(id);
        return "redirect:/list";
    }
}
