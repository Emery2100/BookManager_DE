//
//  api.swift
//  BookManager_DE
//
//  Created by David Emery on 2/17/26.
//

import Foundation

func getBooks() -> [Book] {
    return [
        
            Book(title: "The fellowship of the Ring", author: "J.R.R. Tolkien", cover: "lotr_fellowship", summary: "A group of people set out on a perilous journey to destroy a powerful ring."),
            Book(title: "The Two Towers", author: "J.R.R. Tolkien", cover: "lotr_towers", summary: "The Fellowship continues their quest to destroy the One Ring."),
            Book(title: "Return of the King", author: "J.R.R. Tolkien", cover: "lotr_king", summary: "The Fellowship faces new challenges as they work to destroy the One Ring."),
        
    ]
}

func getNewBook() -> Book {
    Book(title: "", author: "", cover: "", summary: "")
}
