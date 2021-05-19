//
//  main.swift
//  10 - Regular Expression Matching
//
//  Created by Ick on 2021/05/12.
//

import Foundation
class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sArray = Array(s).map({String($0)})
        let pArray = Array(p).map({String($0)})
        var dp = Array(repeating: Array(repeating: false, count: p.count + 1), count: s.count + 1)
        dp[0][0] = true
        
        for i in 0..<p.count {
            if pArray[i] == "*" && dp[0][i-1] {
                dp[0][i+1] = true
            }
        }

        for i in 0..<s.count {
            for j in 0..<p.count {
                if pArray[j] == sArray[i] {
                    dp[i+1][j+1] = dp[i][j]
                } else if pArray[j] == "." {
                    dp[i+1][j+1] = dp[i][j]
                } else if pArray[j] == "*" {
                    if pArray[j-1] != sArray[i] && pArray[j-1] != "." {
                        dp[i+1][j+1] = dp[i+1][j-1]
                    } else {
                        dp[i+1][j+1] = (dp[i+1][j] || dp[i][j+1] || dp[i+1][j-1])
                    }
                }
            }
        }
        
        return dp[s.count][p.count]
    }
}

let a = Solution()
print(a.isMatch("aa", "a"))
print(a.isMatch("aa", "a*"))
print(a.isMatch("ab", ".*"))
print(a.isMatch("aab", "c*a*b"))
