//
//  main.swift
//  34 - Find First and Last Position of Element in Sorted Array
//
//  Created by Ick on 2021/01/22.
//

import Foundation

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        
        if nums.count == 0 {
            return [-1,-1]
        }
        
        var left: Int = 0
        var mid: Int = nums.count / 2
        var right: Int = nums.count - 1
        
        while left <= right {
            if nums[mid] == target {
                break
            } else if nums[mid] < target {
                left = mid + 1
                mid = (left + right) / 2
            } else if nums[mid] > target {
                right = mid - 1
                mid = (left + right) / 2
            }
        }
        
        if left > right {
            return [-1,-1]
        }
        
        var min: Int = mid
        var max: Int = mid
            
        var findMin: Bool = false
        var findMax: Bool = false

        while !(findMin && findMax) {
            if min - 1 >= 0 {
                if !findMin && nums[min - 1] == target {
                    min -= 1
                } else if !findMin && nums[min - 1] != target {
                    findMin = true
                }
            } else {
                findMin = true
            }
            
            if max + 1 <= nums.count - 1{
                if !findMax && nums[max + 1] == target {
                    max += 1
                } else if !findMax && nums[max + 1] != target {
                    findMax = true
                }
            } else {
                findMax = true
            }
        }
        
        return [min,max]
    }
}

let a = Solution()
print(a.searchRange([5,7,7,8,8,10], 8))
print(a.searchRange([5,7,7,8,8,10], 6))
print(a.searchRange([1], 1))
