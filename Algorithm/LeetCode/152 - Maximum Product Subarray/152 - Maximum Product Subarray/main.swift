//
//  main.swift
//  152 - Maximum Product Subarray
//
//  Created by Ick on 2021/02/27.
//

import Foundation
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var result = nums[0]
        var maxT = 1
        var minT = 1
        
        for i in 0..<nums.count {
            let temp1 = maxT * nums[i]
            let temp2 = minT * nums[i]
            
            result = max(result, temp1, temp2)
            maxT = max(temp1, temp2, 1)
            minT = min(temp1, temp2, 1)
        }
        
        return result
    }
}
let a = Solution()
print(a.maxProduct([2,3,-2,4]))
print(a.maxProduct([-2,0,-1]))
print(a.maxProduct([-3,-1,-1]))
