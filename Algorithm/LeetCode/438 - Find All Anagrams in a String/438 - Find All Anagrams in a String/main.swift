//
//  main.swift
//  438 - Find All Anagrams in a String
//
//  Created by Ick on 2021/03/11.
//

import Foundation

class Solution {
//    func findAnagrams(_ s: String, _ p: String) -> [Int] {
//        if s.count < p.count {
//            return []
//        }
//        var result: [Int] = []
//        let arrayP = Array(p).sorted()
//
//        for i in 0..<s.count-p.count+1 {
//            let anagram = Array(s[s.index(s.startIndex, offsetBy: i)..<s.index(s.index(s.startIndex, offsetBy: i), offsetBy: p.count)]).sorted()
//            if arrayP == anagram {
//                result.append(i)
//            }
//        }
//
//        return result
//    }
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let sLen = s.count
        let pLen = p.count
        if sLen < pLen {
            return []
        }
        var map = [Int](repeating: 0, count: 26)
        p.utf8.forEach({ map[Int($0) - 97] += 1})
        
        var left = 0
        var right = 0
        var count = 0
        
        var result = [Int]()
        let sValues = Array(s.utf8)
        while right < sLen {
            let rightIndex = Int(sValues[right]) - 97
            if map[rightIndex] > 0 {
                map[rightIndex] -= 1
                count += 1
                right += 1
            } else {
                let leftIndex = Int(sValues[left]) - 97
                map[leftIndex] += 1
                count -= 1
                left += 1
            }
            if count == pLen {
                result.append(left)
            }
        }
        return result
    }
}
let a = Solution()
print(a.findAnagrams("abab", "ab"))
print(a.findAnagrams("cbaebabacd", "abc"))
