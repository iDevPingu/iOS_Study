//
//  main.swift
//  46 - Permutations
//
//  Created by Jaeick Hwang on 2021/01/26.
//

import Foundation

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        
        var result: [[Int]] = []
        var visited: [Bool] = [Bool](repeating: false, count: nums.count)
        
        func permutation(_ nowPermute: [Int]) {
            if nowPermute.count == nums.count {
                result.append(nowPermute)
                return
            }
            
            for i in 0..<nums.count {
                if visited[i] {
                    continue
                } else {
                    visited[i] = true
                    permutation(nowPermute + [nums[i]])
                    visited[i] = false
                }
            }
        }
        
        permutation([])
        
        return result
    }
}

let a = Solution()
print(a.permute([1,2,3]))
print(a.permute([0,1]))
print(a.permute([1]))
