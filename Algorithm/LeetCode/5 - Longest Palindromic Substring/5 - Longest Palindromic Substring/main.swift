//
//  main.swift
//  5 - Longest Palindromic Substring
//
//  Created by Ick on 2021/01/14.
//

import Foundation
class Solution {
    func longestPalindrome(_ s: String) -> String {
        if s.count < 2 {
            return s
        }
        let input = s.map({String($0)})
        var left: Int = 0
        var right: Int = 0
        
        // [i][j]가 true라면 s의 i번째 글자부터 j번째 글자까지는 회문이다! 라는 뜻입니다.
        var isPalindrome = [[Bool]](repeating: [Bool](repeating: false, count: s.count), count: s.count)
        
        // i == right, j == left
        for i in 0..<s.count {
            for j in 0..<i {
                // 얘들 사이에 존재하는 애가 회문이거나 사이에 존재하는 글자가 한 글자인 경우엔 반드시 회문
                if input[i] == input[j] && (isPalindrome[i-1][j+1] || i - j <= 2)  {
                    isPalindrome[i][j] = true
                    // 만약 이번에 만든 회문이 기존의 회문 길이보다 작다면 초기화
                    if i - j > right - left {
                        left = j
                        right = i
                    }
                }
            }
        }

        return Array(input[left...right]).joined()
    }
}

let a = Solution()
print(a.longestPalindrome("babad"))
print(a.longestPalindrome("cbbd"))
print(a.longestPalindrome("b"))
