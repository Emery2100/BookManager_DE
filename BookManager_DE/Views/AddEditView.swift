//
//  AddEditView.swift
//  BookManager_DE
//
//  Created by David Emery on 2/17/26.
//

import SwiftUI

struct AddEditView: View {
    @Binding var book: Book
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var summary = ""
    
    @State private var rating: Int = 0
    @State private var review = ""
    
    init(book: Binding<Book>){
        print (book.wrappedValue.title)
        self._book = book
        self._title = .init(wrappedValue:book.wrappedValue.title)
        self._author = .init(wrappedValue:book.wrappedValue.author)
        self._summary = .init(wrappedValue:book.wrappedValue.summary)
        
        self._rating = .init(wrappedValue:book.wrappedValue.rating)
        self._review = .init(wrappedValue:book.wrappedValue.review)
    }
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Book detauls")){
                    TextField("Title of the book", text: $title)
                    TextField("Author", text: $author)
                    TextEditor(text: $summary)
                        .frame(height:150)
                }
                Section(header: Text("Review")){
                    Picker("Rating", selection:$rating){
                        Text("Select a rating...").tag(0)
                        ForEach(1...5, id: \.self){
                            Text("\($0)").tag($0)
                        }
                    }
                    StarRatingField(rating: $rating)
                    TextEditor(text: $review)
                        .frame(height:150)
                }
            }
            .navigationTitle("\(book.title.isEmpty ? "Add" : "Edit") Book")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        book.title = title
                        book.author = author
                        book.summary = summary
                        book.rating = rating
                        book.review = review
                        dismiss()
                    }.disabled(title.isEmpty)
                }
            }
        }
    }
}
