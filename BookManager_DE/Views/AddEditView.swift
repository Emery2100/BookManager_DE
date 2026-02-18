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
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Book detauls")){
                    TextField("Title of the book", text: $book.title)
                    TextField("Author", text: $book.author)
                    TextEditor(text: $book.summary)
                        .frame(height:150)
                }
            }
            .navigationTitle("Add/Edit Book")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        dismiss()
                    }
                }
            }
        }
    }
}
