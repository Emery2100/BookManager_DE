//
//  Book.swift
//  BookManager_DE
//
//  Created by David Emery on 2/13/26.
//

import Foundation

struct Book: Identifiable {
    let id: UUID = UUID()
    var title: String
    var author: String
    var cover: String
    var summary: String
}
