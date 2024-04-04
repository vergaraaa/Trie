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
    @State private var wordToAdd = ""
    @State private var emojiToAdd = ""
    @State private var wordToSearch = ""
    @State private var searchResult: (Bool, Character?) = (false, nil)
    
    var trie = Trie()
    
    init() {
        trie.insert(word: "Pineapple", emoji: "🍍")
        trie.insert(word: "Apple", emoji: "🍎")
        trie.insert(word: "Pear", emoji: "🍐")
        trie.insert(word: "Orange", emoji: "🍊")
        trie.insert(word: "Lemon", emoji: "🍋")
        trie.insert(word: "Banana", emoji: "🍌")
        trie.insert(word: "Watermelon", emoji: "🍉")
        trie.insert(word: "Mango", emoji: "🥭")
        trie.insert(word: "Strawberry", emoji: "🍓")
        trie.insert(word: "Avocado", emoji: "🥑")
        trie.insert(word: "Cherry", emoji: "🍎")
        trie.insert(word: "Eggplant", emoji: "🍆")
        trie.insert(word: "Broccoli", emoji: "🥦")
        trie.insert(word: "Onion", emoji: "🧅")
        trie.insert(word: "Potato", emoji: "🥔")
        trie.insert(word: "Carrot", emoji: "🥕")
    }
    
    var body: some View {
        VStack {
            TextField("Search fruit or vegetable", text: $wordToSearch)
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
        .onChange(of: wordToSearch, {
            searchResult = trie.contains(word: wordToSearch)
        })
        .padding()
    }
}


#Preview {
    ContentView()
}
