//
//  main.swift
//  300 - Longest Increasing Subsequence
//
//  Created by Ick on 2021/02/15.
//

import Foundation
class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp: [Int] = [Int](repeating: 1, count: nums.count)
        dp[0] = 1
        var max: Int = 1
        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[i] > nums[j] {
                    if dp[i] < dp[j] + 1 {
                        dp[i] = dp[j] + 1
                        if max < dp[j] + 1 {
                            max = dp[j] + 1
                        }
                    }
                }
            }
        }
        
        return max
    }
}

let a = Solution()
print(a.lengthOfLIS([10,9,2,5,3,7,101,18]))
print(a.lengthOfLIS([0,1,0,3,2,3]))
print(a.lengthOfLIS([7,7,7,7,7,7,7]))
print(a.lengthOfLIS([1,3,6,7,9,4,10,5,6]))
