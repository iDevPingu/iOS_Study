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
        if s.count < p.count {
            return []
        }
        
        var dictP = [Character: Int]()
        var dictS = [Character: Int]()
        
        var result: [Int] = []
        
        let s = Array(s)
        
        for char in p {
            dictP[char, default: 0] += 1
        }
        
        for i in 0..<s.count {
            if i >= p.count {
                let char = s[i - p.count]
                dictS[char] = dictS[char]! > 1 ? dictS[char]! - 1 : nil
            }
            dictS[s[i], default: 0] += 1
            if dictS == dictP {
                result.append(i - p.count + 1)
            }
        }
        
        return result
    }
}
let a = Solution()
print(a.findAnagrams("abab", "ab"))
print(a.findAnagrams("cbaebabacd", "abc"))
