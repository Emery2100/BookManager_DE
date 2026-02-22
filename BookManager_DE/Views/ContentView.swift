//
//  ContentView.swift
//  BookManager_DE
//
//  Created by David Emery on 2/13/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var books: [Book] = getBooks()
    @State private var showAddSheet: Bool = false
    @State var newBook = getNewBook()
    // Swift UI is declarative not imperative programming
    var body: some View {
        NavigationStack{
            List($books, id:\.self.id){ $book in
                NavigationLink(destination: DetailView(book: $book)){
                    ListItemView(book: book)
                }
            }
            .navigationTitle("Book Manager")
            .navigationBarItems(trailing: Button("Add Book", action:{
                showAddSheet.toggle()
            }))
            .sheet(isPresented: $showAddSheet){
                if(!newBook.title.isEmpty){
                    books.append(newBook)
                }
                newBook = getNewBook()
            }content:{
                AddEditView(book: $newBook)
            }
        } // End Navstack
    } // END body
} // END ContentView
    

    
    #Preview {
        ContentView()
    }
