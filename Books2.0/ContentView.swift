//
//  ContentView.swift
//  Books2.0
//
//  Created by Adam Gerber on 11/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title)]) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    func deleteBooks(at offsets: IndexSet){
        for offset in offsets {
            
            let book = books[offset]
            moc.delete(book)
        }
        try? moc.save()
    }
    
    var body: some View {
        NavigationView{
            List{
                ForEach(books){ book in
                    NavigationLink{
                        DetailView(book: book)
                    } label : {
                        HStack{
                            EmojiRatingReview(rating: book.rating)
                                .font(.largeTitle)
                            VStack(alignment: .leading){
                                Text(book.title ?? "Unknown title")
                                    .font(.headline)
                                Text(book.author ?? "Unknown Author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Books")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        showingAddScreen.toggle()

                    } label: {
                        Label("Add Book", systemImage: "plus")
                    }
                }
            }
            
            .sheet(isPresented: $showingAddScreen){
                AddBookView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
