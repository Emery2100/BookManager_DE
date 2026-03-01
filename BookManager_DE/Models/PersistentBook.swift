//
//  PersistentBook.swift
//  BookManager_DE
//
//  Created by David Emery on 3/1/26.
//

import Foundation
import SwiftData
import UIKit

@Model
class PersistentBook {
    var title: String
    var author: String
    var coverData: Data?
    var summary: String
    
    //Added 2 new property
    var rating: Int
    var review: String
    
    //add a new one 106-1
    var isFavorite: Bool = false
    
    // Add 2 new property
    var genre: Genre
    var readingStatus: ReadingStatus
    
    init(
        title: String,
        author: String = "",
        coverData: Data? = nil,
        summary: String = "",
        rating: Int,
        review: String,
        isFavorite: Bool = false,
        genre: Genre = .unknown,
        readingStatus: ReadingStatus = .unknown
    ) {
        self.title = title
        self.author = author
        self.coverData = coverData
        self.summary = summary
        self.rating = rating
        self.review = review
        self.isFavorite = isFavorite
        self.genre = genre
        self.readingStatus = readingStatus
    }
    var cover: UIImage {
        if self.coverData != nil {
            return UIImage(data: self.coverData!)!
        }else {
            return UIImage(resource: .lotrFellowship)
        }
    }
}
