//
//  BookManager_DEApp.swift
//  BookManager_DE
//
//  Created by David Emery on 2/13/26.
//

import SwiftUI
import SwiftData

@main
struct BookManager_DEApp: App {
    let modelContainer: ModelContainer

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(modelContainer)
        }
    }

    init(){
        do{
            modelContainer = try ModelContainer(
                for: PersistentBook.self
        )
    } catch {
        fatalError("Failed to load container")
    }
}
}
