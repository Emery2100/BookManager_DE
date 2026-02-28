//
//  Genre.swift
//  BookManager_DE
//
//  Created by David Emery on 2/24/26.
//

enum Genre: String, CaseIterable {
    case classic = "Classic"
    case fantasy = "Fantasy"
    case mystery = "Mystery"
    case romance = "Romance"
    case sciFi = "Science Fiction"
    case thriller = "Thriller"
    
    // defaulr catch all case
    case unknown = "Unknown"
}
