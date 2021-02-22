//
//  main.swift
//  96 - Unique Binary Search Tree
//
//  Created by Ick on 2021/02/04.
//

import Foundation

class Solution {
    func numTrees(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        }
        
        var dp: [Int] = [1,1]
        
        for i in 2...n {
            var temp = 0
            for j in 1...i {
                temp += dp[j-1] * dp[i-j]
            }
            dp.append(temp)
        }
        
        return dp[n]
    }
}

let a = Solution()
print(a.numTrees(3))
print(a.numTrees(4))
