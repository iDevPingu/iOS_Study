//
//  main.swift
//  136 - Single Number
//
//  Created by Ick on 2021/05/19.
//

import Foundation

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        var onceAppearMap: [Int: Int] = [:]
        var moreThanOnceMap: [Int: Int] = [:]
        
        for i in 0..<nums.count {
            if let value = moreThanOnceMap[nums[i]] {
                moreThanOnceMap[nums[i]] = value + 1
            } else {
                if let _ = onceAppearMap[nums[i]] {
                    onceAppearMap[nums[i]] = nil
                    moreThanOnceMap[nums[i]] = 2
                } else {
                    onceAppearMap[nums[i]] = 1
                }
            }
        }
        
        return onceAppearMap.keys.first!
    }
    
}
let a = Solution()
print(a.singleNumber([2,2,1]))
print(a.singleNumber([1]))
print(a.singleNumber([4,1,2,1,2]))
