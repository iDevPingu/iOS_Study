//
//  main.swift
//  53 - Maximum Subarray
//
//  Created by Ick on 2021/01/22.
//

import Foundation

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var result: Int = 0
        var temp: Int = 0
        for i in 0..<nums.count {
            temp += nums[i]
            if temp < 0 {
                temp = 0
            } else {
                if temp > result {
                    result = temp
                }
            }
        }
        if result == 0 {
            return nums.max()!
        }
        
        return result
    }
}

let a = Solution()
print(a.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
print(a.maxSubArray([1]))
print(a.maxSubArray([-1]))
