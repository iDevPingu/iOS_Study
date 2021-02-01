//
//  main.swift
//  1 - Two Sum
//
//  Created by Ick on 2021/01/14.
//

import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if nums[i] + nums[j] == target {
                    return [i,j]
                }
            }
        }
        return []
    }
}

let a = Solution()
print(a.twoSum([2,7,11,15], 9))
print(a.twoSum([3,2,4], 6))
print(a.twoSum([3,3], 6))
