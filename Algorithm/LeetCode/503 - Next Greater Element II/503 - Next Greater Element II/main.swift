//
//  main.swift
//  503 - Next Greater Element II
//
//  Created by Ick on 2021/05/04.
//

import Foundation

class Solution {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        var result = [Int](repeating: -1, count: nums.count)
        let doubleNums = nums + nums
        var stack: [Int] = []
        
        for i in 0..<doubleNums.count {
            while !stack.isEmpty && doubleNums[stack.last!] < doubleNums[i] {
                let index = stack.removeLast()
                if index > nums.count - 1 {
                    result[index - nums.count] = doubleNums[i]
                } else {
                    result[index] = doubleNums[i]
                }
            }
            stack.append(i)
        }
        
        stack = []
        
        return result
    }
}
let a = Solution()
print(a.nextGreaterElements([1,2,1]))
print(a.nextGreaterElements([1,2,3,4,3]))
print(a.nextGreaterElements([5,4,3,2,1]))
