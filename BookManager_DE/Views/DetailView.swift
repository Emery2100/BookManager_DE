//
//  DetailView.swift
//  BookManager_DE
//
//  Created by David Emery on 2/13/26.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var book: Book
    @State private var showEditSheet: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                //hstack
                HStack{
                    //image
                    Image(book.cover)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding()
                    //vstack
                    VStack(alignment: .leading){
                        Text(book.title)
                            .font(.headline)
                        Text("by \(book.author)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            Text(book.summary)
        }
        .padding(.horizontal)
        
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button("Edit", action:{
            showEditSheet.toggle()
        }))
            .sheet(isPresented: $showEditSheet){
                AddEditView(book: $book)
            }
            }
        }

