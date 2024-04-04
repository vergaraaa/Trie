//
//  ContentView.swift
//  Trie
//
//  Created by Edgar Ernesto Vergara Montiel on 25/03/24.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var trie = Trie()
}

struct ContentView: View {
    @State private var wordToSearch = ""
    @State private var searchResult: (Bool, Character?) = (false, nil)
    
    @State private var wordToAdd = ""
    @State private var emojiToAdd = ""
    @State private var showModal: Bool = false
    
    var trie = Trie()
    
    init() {
        trie.insert(word: "Pineapple", emoji: "🍍")
        trie.insert(word: "Apple", emoji: "🍎")
        trie.insert(word: "Pear", emoji: "🍐")
        trie.insert(word: "Orange", emoji: "🍊")
        trie.insert(word: "Lemon", emoji: "🍋")
//        trie.insert(word: "Banana", emoji: "🍌")
//        trie.insert(word: "Watermelon", emoji: "🍉")
//        trie.insert(word: "Mango", emoji: "🥭")
//        trie.insert(word: "Strawberry", emoji: "🍓")
//        trie.insert(word: "Avocado", emoji: "🥑")
//        trie.insert(word: "Cherry", emoji: "🍒")
//        trie.insert(word: "Eggplant", emoji: "🍆")
//        trie.insert(word: "Blueberry", emoji: "🫐")
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Search fruit", text: $wordToSearch)
                    .padding()
                    .background(Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Spacer()
                
                if searchResult.0 {
                    Text(String(searchResult.1!) + String(searchResult.1!) + String(searchResult.1!))
                        .font(.title)
                } else {
                    if wordToSearch != "" {
                        Text("\(wordToSearch) not found")
                    }
                }
                
                Spacer()
            }
            .toolbar {
                Button {
                    showModal.toggle()
                    wordToSearch = ""
                } label: {
                    Image(systemName: "plus")
                }
            }
            .onChange(of: wordToSearch, {
                searchResult = trie.contains(word: wordToSearch)
            })
            .sheet(isPresented: $showModal) {
                NavigationStack {
                    VStack {
                        TextField("Name", text: $wordToAdd)
                            .padding()
                            .background(Color(.systemGray5))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        TextField("Emoji", text: $emojiToAdd)
                            .padding()
                            .background(Color(.systemGray5))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Spacer()
                    }
                    .navigationTitle("Add Fruit")
                    .toolbar {
                        Button {
                            showModal.toggle()
                            trie.insert(word: wordToAdd, emoji: emojiToAdd)
                            wordToAdd = ""
                            emojiToAdd = ""
                        } label: {
                            Text("Done")
                                .bold()
                        }
                        .disabled(wordToAdd.isEmpty || emojiToAdd.isEmpty)
                    }
                    .padding()
                }
            }
        .padding()
        }
    }
}


#Preview {
    ContentView()
}
