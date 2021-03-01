//
//  main.swift
//  139 - Word Break
//
//  Created by Ick on 2021/02/27.
//

import Foundation

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var cache: [String: Bool] = [:]
        return isWordBreakable(s, wordDict, &cache)
    }

    func isWordBreakable(_ s: String, _ wordDict: [String], _ cache: inout [String: Bool]) -> Bool {
        if let cached = cache[s] {
            return cached
        }
        
        for word in wordDict where s.hasPrefix(word) {
            let string = stringWithoutPrefix(word, s)
            
            if string.isEmpty {
                return true
            } else {
                let isBreakable = isWordBreakable(string, wordDict, &cache)
                cache[string] = isBreakable
                
                if isBreakable {
                    return true
                }
            }
        }
        return false
    }

    func stringWithoutPrefix(_ prefix: String, _ s: String) -> String {
        let newString = Array(s)
        return String(newString[prefix.count...])
    }
}

let a = Solution()
print(a.wordBreak("leetcode", ["leet","code"]))
print(a.wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]))

