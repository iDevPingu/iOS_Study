//
//  main.swift
//  15 - 3Sum
//
//  Created by Ick on 2021/01/17.
//

import Foundation

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return []
        }
        var result: [[Int]] = []
        
        let nums = nums.sorted()
        
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                for k in j+1..<nums.count {
                    if nums[i] + nums[j] + nums[k] == 0 {
                        result.append([nums[i], nums[j], nums[k]])
                    }
                }
            }
        }
        
        result = Array(Set(result))
        
        return result
    }
}

let a = Solution()
print(a.threeSum([-1,0,1,2,-1,-4]))
