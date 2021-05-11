//
//  main.swift
//  [Kakao] 2020 Blind - 가사 검색
//
//  Created by Ick on 2021/05/07.
//

import Foundation

// 완전 탐색 O(n^2) -> 시간초과
//func solution(_ words:[String], _ queries:[String]) -> [Int] {
//    var result = [Int](repeating: 0, count: queries.count)
//    for i in 0..<queries.count {
//        var count: Int = 0
//        if queries[i][queries[i].startIndex] == "?" {
//            for word in words {
//                if word.count == queries[i].count {
//                    let word = String(word.reversed())
//                    let query = String(queries[i].reversed())
//                    let lastIndex = query.firstIndex(of: "?")!
//                    if word.hasPrefix(String(query[query.startIndex..<lastIndex])) {
//                        count += 1
//                    }
//                }
//            }
//        } else {
//            for word in words {
//                if word.count == queries[i].count {
//                    let lastIndex = queries[i].firstIndex(of: "?")!
//                    if word.hasPrefix(String(queries[i][queries[i].startIndex..<lastIndex])) {
//                        count += 1
//                    }
//                }
//            }
//        }
//        result[i] = count
//    }
//
//    return result
//}
class TrieNode {
    public var isTerminal: Bool = false
    public var child = [TrieNode?](repeating: nil, count: 26)
    var count: Int = 0
    func charToInt(char: Character) -> Int? {
        if !char.isASCII {
            return nil
        }
        let value = char.asciiValue! - Character("a").asciiValue!
        return Int(value)
    }
    func insert(word: String) {
        let characters: [Character] = Array(word)
        self._insert(characters: characters, i: 0)
    }
    private func _insert(characters: [Character], i: Int) {
        if i == characters.count {
            self.isTerminal = true
            return
        }
        if let index = self.charToInt(char: characters[i]) {
            if let nextNode = self.child[index] {
                nextNode._insert(characters: characters, i: i+1)
            } else {
                self.child[index] = TrieNode()
                self.child[index]!._insert(characters: characters, i: i+1)
            }
        }
    }
    
    func find(word: String) -> Bool {
        let characters: [Character] = Array(word)
        return _find(characters: characters, i: 0)
    }
    private func _find(characters: [Character], i: Int) -> Bool {
        if characters.count == i {
            if self.isTerminal {
                return true
            } else {
                return false
            }
        }
        
        // 이 문제를 위한 조건
        if characters[i] == "?" {
            return true
        }
        
        if let index = self.charToInt(char: characters[i]),
           let nextNode = self.child[index] {
            return nextNode._find(characters: characters, i: i+1)
        }
        return false
    }
}
class Trie {
    let root: TrieNode
    
    init() {
        root = TrieNode()
    }
    
    func childCount(query: String) -> Int {
        if query.isEmpty {
            return 0
        }
        var currentNode = root
        for char in query {
            if char == "?" {
                return currentNode.count
            }
            
            guard let childNode = currentNode.child[Int(Character(String(char)).asciiValue!) - Int(Character("a").asciiValue!)] else {
                return 0
            }
            currentNode = childNode
        }
        return currentNode.count
    }
    func insert(word: String) {
        if word.isEmpty { return }
        var currentNode = root
        currentNode.insert(word: word)
        for char in word {
            currentNode.count += 1
            if let childNode = currentNode.child[Int(Character(String(char)).asciiValue!) - Int(Character("a").asciiValue!)] {
                currentNode = childNode
            } else {
                currentNode = currentNode.child[Int(Character(String(char)).asciiValue!) - Int(Character("a").asciiValue!)]!
            }
        }
    }
}
func solution(_ words: [String], _ queries: [String]) -> [Int] {
    var result = [Int](repeating: 0, count: queries.count)
    var originalTries: [Int: Trie] = [:]
    var reverseTries: [Int: Trie] = [:]
    for word in words {
        if let originalTrie = originalTries[word.count] {
            originalTrie.insert(word: word)
        } else {
            let trie = Trie()
            trie.insert(word: word)
            originalTries[word.count] = trie
        }
        
        if let reverseTrie = reverseTries[word.count] {
            reverseTrie.insert(word: String(word.reversed()))
        } else {
            let trie = Trie()
            trie.insert(word: String(word.reversed()))
            reverseTries[word.count] = trie
        }
    }
    
    for i in 0..<queries.count {
        if queries[i].first == "?" {
            if let reverseTrie = reverseTries[queries[i].count] {
                result[i] = reverseTrie.childCount(query: String(queries[i].reversed()))
            }
        } else {
            if let originalTrie = originalTries[queries[i].count] {
                result[i] = originalTrie.childCount(query: queries[i])
            }
        }
    }
    return result
}
print(solution(["frodo", "front", "frost", "frozen", "frame", "kakao"], ["fro??", "????o", "fr???", "fro???", "pro?"]))

