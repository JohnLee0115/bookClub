package com.john.bookclub.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.john.bookclub.models.Book;
import com.john.bookclub.models.User;
import com.john.bookclub.services.BookService;
import com.john.bookclub.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/books")
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private UserService userService;
	
	public BookController() {}
	
	@GetMapping("")
	public String books(HttpSession session, Model model) {
		List<Book> books = bookService.allBooks();
		model.addAttribute("books", books);
		model.addAttribute("user", userService.getUser((Long)session.getAttribute("user_id")));
		
		return "books.jsp";
	}
	
	@GetMapping("/new")
	public String bookForm(@ModelAttribute("book") Book book) {
//		Long user_id = (Long)session.getAttribute("user_id");
//		User user = userService.getUser(user_id);
//		model.addAttribute(user);
		
		return "bookForm.jsp";
	}
	
	@PostMapping("/new")
	public String createBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
		if(result.hasErrors()) {
			return "bookForm.jsp";
		} else {
			bookService.createBook(book);
			return "redirect:/books";
		}
	}
	
	@GetMapping("/{book_id}")
	public String showBook(@PathVariable("book_id") Long id, Model model) {
		Book book = bookService.findBook(id);
		model.addAttribute("book", book);
		return "show.jsp";
	}

}
