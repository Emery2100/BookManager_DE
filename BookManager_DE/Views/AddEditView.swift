//
//  AddEditView.swift
//  BookManager_DE
//
//  Created by David Emery on 2/17/26.
//

import SwiftUI
import SwiftData

struct AddEditView: View {
    var book: PersistentBook?
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var title = ""
    @State private var author = ""
    @State private var summary = ""
    
    @State private var rating: Int = 0
    @State private var review = ""
    @State private var isFavorite: Bool = false
    
    @State private var genre: Genre = .unknown
    @State private var readingStatus: ReadingStatus = .unknown
    
    init(book: PersistentBook? = nil){
        self.book = book
        if let book{
            self.title = book.title
            self.author = book.author
            self.summary = book.summary
            self.rating = book.rating
            self.review = book.review
            self.isFavorite = book.isFavorite
            self.genre = book.genre
            self.readingStatus = book.readingStatus
        }
    }
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Book details")){
                    TextField("Title of the book", text: $title)
                    TextField("Author", text: $author)
                    TextEditor(text: $summary)
                        .frame(height:150)
                    Picker("Genre", selection: $genre){
                        ForEach(Genre.allCases, id:\.self){ genre in
                            Text(genre.rawValue).tag(genre)                        }
                    }
                }
                Section(header: Text("Review")){
                    Picker("Rating", selection:$rating){
                        Text("Select a rating...").tag(0)
                        ForEach(1...5, id: \.self){
                            Text("\($0)").tag($0)
                        }
                    }
                    Picker("Reading status", selection: $readingStatus){
                        ForEach(ReadingStatus.allCases, id:\.self){ readingStatus in
                            Text(readingStatus.rawValue).tag(readingStatus)
                        }
                        StarRatingField(rating: $rating)
                        TextEditor(text: $review)
                            .frame(height:150)
                    }
                }
                .navigationTitle("\(book == nil ? "Add" : "Edit") Book")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .cancellationAction){
                        Button("Cancel"){
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .confirmationAction){
                        FavoriteToggle(isFavorite: $isFavorite)
                    }
                    ToolbarItem(placement: .confirmationAction){
                        Button("Save"){
                            let isNewBook = book == nil
                            let bookToSave = book ?? PersistentBook(title:"")
                            bookToSave.title = title
                            bookToSave.author = author
                            bookToSave.summary = summary
                            bookToSave.rating = rating
                            bookToSave.review = review
                            bookToSave.isFavorite = isFavorite
                            bookToSave.genre = genre
                            bookToSave.readingStatus = readingStatus
                            
                            if isNewBook {
                                modelContext.insert(bookToSave)
                            }
                            do{
                                try modelContext.save()
                            } catch {
                                print("Failed to save the book: \(error)")
                            }
                            dismiss()
                        }.disabled(title.isEmpty)
                    }
                }
            }
        }
    }
}
