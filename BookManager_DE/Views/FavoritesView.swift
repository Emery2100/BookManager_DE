//
//  FavoritesView.swift
//  BookManager_DE
//
//  Created by David Emery on 2/24/26.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    
    @Query var books: [PersistentBook]
    @State private var isFilterSheetPresented: Bool = false
    @State private var selectedGenre: Genre?
    @State private var selectedReadingStatus: ReadingStatus?
    @AppStorage(SETTINGS_GRID_COLUMNS) private var gridColumns: Int = 2
    
    //computed property
    private var favoriteBooks: [PersistentBook] {
        filterFavoriteBooks(books: books, genre: selectedGenre, readingStatus: selectedReadingStatus)
    }
    private var gridLayout: [GridItem] {
        Array(repeating: GridItem(.flexible()), count: gridColumns)
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                if selectedGenre != nil{
                    Text("Filtering by Genre: \(selectedGenre!.rawValue)")
                }
                if selectedReadingStatus != nil{
                    Text("Filtering by Genre: \(selectedReadingStatus!.rawValue)")
                }
                if favoriteBooks.isEmpty {
                    Text("No favorite books")
                        .foregroundColor(.secondary)
                } else{
                    LazyVGrid(columns: gridLayout){
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
                FilterOptionsView(selectedGenre: $selectedGenre, selectedReadingStatus: $selectedReadingStatus)
            }
        }
    }
}

func filterFavoriteBooks(books: [PersistentBook], genre: Genre?, readingStatus: ReadingStatus?) -> [PersistentBook] {
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
