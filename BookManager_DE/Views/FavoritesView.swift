//
//  FavoritesView.swift
//  BookManager_DE
//
//  Created by David Emery on 2/24/26.
//

import SwiftUI

struct FavoritesView: View {
    
    @Binding var books: [Book]
    @State private var isFilterSheetPresented: Bool = false
    @State private var selectedGenre: Genre?
    //computed property
    private var favoriteBooks: [Book] {
        filterFavoriteBooks(books: books, genre: selectedGenre)
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                if selectedGenre != nil{
                    Text("Filtering by Genre: \(selectedGenre!.rawValue)")
                }
                if favoriteBooks.isEmpty {
                    Text("No favorite books")
                        .foregroundColor(.secondary)
                } else{
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]){
                        ForEach(favoriteBooks){ book in
                            SquareCardView(book: book)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("My favorite books")
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button(action: { isFilterSheetPresented.toggle()}){
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            
                    }
                    .accessibilityLabel("Open Filter options")
                }
            }
            .sheet(isPresented: $isFilterSheetPresented) {
                FilterOptionsView(selectedGenre: $selectedGenre)
            }
        }
    }
}

func filterFavoriteBooks(books: [Book], genre: Genre?) -> [Book] {
    return books.filter{
        $0.isFavorite
        && (
            genre == nil
            || $0.genre == genre!
        )
    }
}
