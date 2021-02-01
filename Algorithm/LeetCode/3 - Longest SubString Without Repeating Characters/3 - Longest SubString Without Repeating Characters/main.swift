//
//  main.swift
//  3 - Longest SubString Without Repeating Characters
//
//  Created by Ick on 2021/01/11.
//

import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {

        if s.count == 0 {
            return 0
        } else if s.count == 1 {
            return 1
        }

        let charArray = Array(s)
        var temp: [Character] = []
        var result = 0

        for i in 0..<charArray.count {
            if let index = temp.firstIndex(of: charArray[i]) {
                temp.removeFirst(index+1)
            }
            temp.append(charArray[i])
            result = max(result, temp.count)
        }

        return result
    }
}



let a = Solution()
print(a.lengthOfLongestSubstring("asljlj"))
//print(a.lengthOfLongestSubstring("abcabcbb"))
//print(a.lengthOfLongestSubstring("bbbbbb"))
//print(a.lengthOfLongestSubstring("pwwkew"))
//print(a.lengthOfLongestSubstring(""))
//print(a.lengthOfLongestSubstring("dvdf"))

//class Solution {
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        var result: [Int] = []
//
//        var hashTable: [String: Int] = [:]
//
//        if s.count == 0 {
//            return 0
//        }
//
//        for i in 0..<s.count {
//            var temp = String(s[s.index(s.startIndex, offsetBy: i)])
//            hashTable[String(s[s.index(s.startIndex, offsetBy: i)])] = 1
//            for j in i+1..<s.count {
//                if let _ = hashTable[String(s[s.index(s.startIndex, offsetBy: j)])] {
//                    break
//                } else {
//                    temp += String(s[s.index(s.startIndex, offsetBy: j)])
//                    hashTable[String(s[s.index(s.startIndex, offsetBy: j)])] = 1
//                }
//            }
//            result.append(temp.count)
//            hashTable = [:]
//        }
//
//
//        return result.max()!
//    }
//}
