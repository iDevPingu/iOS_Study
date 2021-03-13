//
//  main.swift
//  221 - Maximal Square
//
//  Created by Ick on 2021/03/13.
//

import Foundation

class Solution {
    // 완전탐색
    func myMaximalSquare(_ matrix: [[Character]]) -> Int {
        var windowSize: Int = 1
        var result: Int = 0
        let n: Int = matrix.count
        let m: Int = matrix[0].count
        
        func isValid(start: [Int]) -> Bool {
            if start[0] + windowSize - 1 >= n || start[1] + windowSize - 1 >= m {
                return false
            }
            for i in start[0]..<start[0]+windowSize {
                for j in start[1]..<start[1]+windowSize {
                    if matrix[i][j] == "0" {
                        return false
                    }
                }
            }
            return true
        }
        
        while windowSize <= max(n,m) {
            var valid: Bool = false
            for i in 0..<n {
                for j in 0..<m {
                    valid = isValid(start: [i,j])
                    if valid {
                        break
                    }
                }
                if valid {
                    result = max(result, windowSize * windowSize)
                    break
                }
            }
            windowSize += 1
        }
        
        return result
    }
    
    // DP
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        let m = matrix[0].count
        let n = matrix.count
        var result: Int = 0
        
        var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1)
        
        for i in 1...n {
            for j in 1...m {
                if matrix[i-1][j-1] == "1" {
                    dp[i][j] = min(min(dp[i][j-1], dp[i-1][j-1]), dp[i-1][j]) + 1
                    result = max(result, dp[i][j])
                }
            }
        }
        
        return result * result
    }
}
let a = Solution()
print(a.maximalSquare([["0","1"],["1","0"]]))
print(a.maximalSquare([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]))
print(a.maximalSquare([["0"]]))
print(a.maximalSquare([["0","0"]]))
