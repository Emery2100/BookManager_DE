//
//  Book.swift
//  BookManager_DE
//
//  Created by David Emery on 2/13/26.
//

import Foundation

struct Book: Identifiable, Hashable {
    let id: UUID = UUID()
    var title: String
    var author: String
    var cover: String
    var summary: String
    
    //Added 2 new property
    var rating: Int = 0
    var review: String = ""
    
    //add a new one 106-1
    var isFavorite: Bool = false
    
    // Add 2 new property
    var genre: Genre = .unknown
    var readingStatus: ReadingStatus = .unknown
}
