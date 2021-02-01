//
//  main.swift
//  78 - Subsets
//
//  Created by Jaeick Hwang on 2021/01/30.
//

import Foundation

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        if nums.count == 0 {
            return result
        }
        
        result.append([])
        
        for i in 0..<nums.count {
            let count = result.count
            for j in 0..<count {
                result.append(result[j] + [nums[i]])
            }
        }
        
        return result
    }
}

let a = Solution()
print(a.subsets([1,2,3,4]))
