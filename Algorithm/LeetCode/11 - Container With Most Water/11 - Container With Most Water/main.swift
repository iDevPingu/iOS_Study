//
//  main.swift
//  11 - Container With Most Water
//
//  Created by Ick on 2021/01/14.
//

import Foundation


class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var result: Int = 0
        var left: Int = 0
        var right: Int = height.count - 1
        
        while left < right {
            let now = min(height[left], height[right]) * (right - left)
            if result < now {
                result = now
            }
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return result
    }
}

let a = Solution()
print(a.maxArea([1,8,6,2,5,4,8,3,7]))
print(a.maxArea([1,1]))
print(a.maxArea([4,3,2,1,4]))
print(a.maxArea([1,2,1]))
