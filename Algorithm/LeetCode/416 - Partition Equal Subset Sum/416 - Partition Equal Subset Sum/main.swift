//
//  main.swift
//  416 - Partition Equal Subset Sum
//
//  Created by Ick on 2021/03/29.
//

import Foundation

class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(0, +)
        
        if sum % 2 != 0 {
            return false
        }
        
        let w = sum / 2
        var dp = [Bool](repeating: false, count: w+1)
        dp[0] = true
        
        for num in nums {
            for i in stride(from: w, to: 0, by: -1) {
                if num <= i {
                    dp[i] = dp[i] || dp[i-num]
                }
            }
        }
        
        return dp[w]
    }
}

let a = Solution()
print(a.canPartition([1,5,11,5]))
print(a.canPartition([1,2,3,5]))
