//
//  ContentView.swift
//  BookManager_DE
//
//  Created by David Emery on 2/13/26.
//

import SwiftUI

struct ContentView: View {

    @State var books = getBooks()


// Swift UI is declarative not imperative programming
    var body: some View {
        TabView{
            ListView(books:  $books)
            .tabItem {
                Label("Books", systemImage: "books.vertical.fill")
            }
            FavoritesView(books:  $books)
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
    }

}

    #Preview {
        ContentView()
    }
