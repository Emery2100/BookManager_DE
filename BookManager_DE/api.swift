//
//  api.swift
//  BookManager_DE
//
//  Created by David Emery on 2/17/26.
//

import Foundation

func getBooks() -> [Book] {
    return [
        
            Book(title: "The fellowship of the Ring", author: "J.R.R. Tolkien", cover: "lotr_fellowship", summary: "A group of people set out on a perilous journey to destroy a powerful ring.", rating: 4, review: "A classic fantasy tale that has captivated readers for generations."),
            Book(title: "The Two Towers", author: "J.R.R. Tolkien", cover: "lotr_towers", summary: "The Fellowship continues their quest to destroy the One Ring.", rating: 3, review: "A gripping continuation of the epic fantasy saga."),
            Book(title: "Return of the King", author: "J.R.R. Tolkien", cover: "lotr_king", summary: "The Fellowship faces new challenges as they work to destroy the One Ring.", rating: 5, review: "The ultimate conclusion to J.R.R. Tolkien's epic fantasy trilogy."),
        
    ]
}

func getNewBook() -> Book {
    Book(title: "", author: "", cover: "", summary: "",rating: 0, review: "")
}
