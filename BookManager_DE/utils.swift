//
//  utils.swift
//  BookManager_DE
//
//  Created by David Emery on 3/6/26.
//

func filterFavoriteBooks(books: [PersistentBook], genre: Genre? = nil, readingStatus: ReadingStatus? = nil) -> [PersistentBook] {
    return books.filter{
        $0.isFavorite
        && (
            genre == nil
            || $0.genre == genre
        )
        && (
            readingStatus == nil
            || $0.readingStatus == readingStatus
        )
    }
}
