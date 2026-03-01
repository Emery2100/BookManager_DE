//
//  ReadingStatus.swift
//  BookManager_DE
//
//  Created by David Emery on 2/24/26.
//

enum ReadingStatus: String, CaseIterable, Hashable, Codable{
    case planToRead = "Plan to read"
    case reading = "Reading"
    case dropped = "Dropped"
    case finished = "Finished"
    
    case unknown = "Unknown"
}

