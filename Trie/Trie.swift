//
//  Trie.swift
//  Trie
//
//  Created by Edgar Ernesto Vergara Montiel on 25/03/24.
//

import Foundation

class TrieNode<T: Hashable> {
    var value: T?
    var emoji: T?
    weak var parent: TrieNode?
    var children: [T: TrieNode] = [:]
    var isTerminating = false
    
    init(value: T? = nil, emoji: T? = nil, parent: TrieNode? = nil) {
        self.value = value
        self.emoji = emoji
        self.parent = parent
    }
    
    func add(child: T) {
        guard children[child] == nil else { return }
        children[child] = TrieNode(value: child, parent: self)
    }
}

class Trie {
    typealias Node = TrieNode<Character>
    fileprivate let root: Node
    
    init() {
        root = Node()
    }
}

extension Trie {
    func insert(word: String, emoji: String) {
        guard !word.isEmpty else { return }
        
        var currentNode = root
        
        let characters = Array(word.lowercased())
        var currentIndex = 0
        
        while currentIndex < characters.count {
            let character = characters[currentIndex]
            
            if let child = currentNode.children[character] {
                currentNode = child
            } else {
                currentNode.add(child: character)
                currentNode = currentNode.children[character]!
            }
            
            currentIndex += 1
            
            
            if currentIndex == characters.count {
                currentNode.isTerminating = true
                currentNode.emoji = emoji.first
            }
        }
    }
    
    func contains(word: String) -> (Bool, Character?) {
        guard !word.isEmpty else { return (false, nil) }
        
        var currentNode = root
        
        let characters = Array(word.lowercased())
        var currentIndex = 0
        
        while currentIndex < characters.count, let child = currentNode.children[characters[currentIndex]] {
            currentIndex += 1
            currentNode = child
        }
        
        if currentIndex == characters.count && currentNode.isTerminating {
            return (true, currentNode.emoji)
        } else {
            return (false, nil)
        }
    }
}
