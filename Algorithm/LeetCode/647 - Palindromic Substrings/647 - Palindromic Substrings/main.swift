//
//  main.swift
//  647 - Palindromic Substrings
//
//  Created by Ick on 2021/02/28.
//

import Foundation

class Solution {
    func countSubstrings(_ s: String) -> Int {
        let input = s.map({String($0)})
        var isPalindromic: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: s.count), count: s.count)
        // 한 글자 짜리는 모두 회문이니까!
        var result = input.count
        // i == right, j == left
        for i in 0..<s.count {
            for j in 0..<i {
                if input[i] == input[j] && (isPalindromic[i-1][j+1] || i - j <= 2 ) {
                    isPalindromic[i][j] = true
                    result += 1
                }
            }
        }
        //----------- 여기까지만해도 문제는 풀림 -------------
        
        // 그냥 내가 해보는 스트링자체를 구해보기
        var myResult: [String] = []
        
        for i in 0..<isPalindromic.count {
            for j in 0..<isPalindromic.count {
                if isPalindromic[i][j] {
                    if i > j {
                        myResult.append(input[j...i].joined())
                    } else {
                        myResult.append(input[i...j].joined())
                    }
                }
            }
        }
        print(myResult)
        
        return result
    }
}

let a = Solution()
//print(a.countSubstrings("abc"))
print(a.countSubstrings("aaa"))
