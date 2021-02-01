//
//  main.swift
//  70 - Climbing Stairs
//
//  Created by Jaeick Hwang on 2021/01/27.
//

import Foundation
class Solution {
    func climbStairs(_ n: Int) -> Int {
        
        var dp: [Int] = [0,1,2]
        
        for i in 3...45 {
            dp.append(dp[i-2]+dp[i-1])
        }
        
        return dp[n]
    }
}

let a = Solution()
print(a.climbStairs(2))
print(a.climbStairs(3))
print(a.climbStairs(5))
print(a.climbStairs(38))
print(a.climbStairs(45))
