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
        trie.insert(word: "Apple", emoji: "🍎")
        trie.insert(word: "Pear", emoji: "🍐")
        trie.insert(word: "Orange", emoji: "🍊")
        trie.insert(word: "Lemon", emoji: "🍋")
        trie.insert(word: "Banana", emoji: "🍌")
        trie.insert(word: "Watermelon", emoji: "🍉")
        trie.insert(word: "Mango", emoji: "🥭")
        trie.insert(word: "Strawberry", emoji: "🍓")
        trie.insert(word: "Avocado", emoji: "🥑")
    }
    
    var body: some View {
        VStack {
            TextField("Search fruit", text: $wordToSearch)
                .padding()
            
            if searchResult.0 {
                Text(String(searchResult.1!))
            } else {
                Text("\(wordToSearch) not found")
                    .foregroundColor(.red)
            }
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
