//
//  main.swift
//  39 - Combination Sum
//
//  Created by Jaeick Hwang on 2021/01/26.
//

import Foundation

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        
        var result: [[Int]] = []
        
        func combination(_ nowCombinagion: [Int], _ nowSum: Int, _ index: Int) {
            if nowSum == target {
                result.append(nowCombinagion)
                return
            }
            
            if index >= candidates.count {
                return
            }
            
            for i in index..<candidates.count {
                if nowSum + candidates[i] <= target {
                    combination(nowCombinagion + [candidates[i]], nowSum + candidates[i], i)
                }
            }
        }
        
        combination([], 0, 0)
        
        return result
    }
}

let a = Solution()
print(a.combinationSum([2,3,5], 8))
print(a.combinationSum([2,3,6,7], 7))
print(a.combinationSum([1,2,3,4,5,6,7,8,9], 10))
print(a.combinationSum([2], 1))
print(a.combinationSum([1], 1))
