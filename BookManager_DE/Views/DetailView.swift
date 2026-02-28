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
                        HStack{
                            CustomCapsule(text: book.genre.rawValue)
                            Spacer()
                            FavoriteToggle(isFavorite: $book.isFavorite)
                        }
                    }
                }
            } //maybe?

            Text(book.summary)
            if(book.rating > 0 || !book.review.isEmpty){
                VStack(alignment: .leading){
                    HStack{
                        Text("Review")
                            .font(.title2)
                            .bold()
                        Spacer()
                        StarRatingView(rating: book.rating)
                    }
                    Text(book.review)
                }.padding(.vertical, 10)
            }
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

