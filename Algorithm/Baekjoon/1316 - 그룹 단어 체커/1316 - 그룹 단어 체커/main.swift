//
//  main.swift
//  1316 - 그룹 단어 체커
//
//  Created by Ick on 2021/03/07.
//

import Foundation

func solution() {
    let n = Int(readLine()!)!
    var words: [String] = []
    var result: Int = 0
    for _ in 0..<n {
        words.append(readLine()!)
    }
    
    for i in 0..<words.count {
        let word = Array(words[i])
        var hashTable: [Character: Int] = [:]
        var count: Int = 0
        for j in 0..<word.count {
            if let _ = hashTable[word[j]] {
                if word[j-1] == word[j] {
                    hashTable[word[j]]! += 1
                    count += 1
                } else {
                    break
                }
            } else {
                hashTable[word[j]] = 1
                count += 1
            }
        }
        if word.count == count {
            result += 1
        }
    }
    print(result)
}

solution()
