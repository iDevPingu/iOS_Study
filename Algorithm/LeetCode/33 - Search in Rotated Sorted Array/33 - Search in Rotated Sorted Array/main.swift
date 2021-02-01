//
//  main.swift
//  33 - Search in Rotated Sorted Array
//
//  Created by Ick on 2021/01/22.
//

import Foundation
// 문제의 의도가 뭘까?
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        for i in 0..<nums.count {
            if nums[i] == target {
                return i
            }
        }
        return -1
    }
}

let a = Solution()
print(a.search([4,5,6,7,0,1,2], 0))
print(a.search([4,5,6,7,0,1,2], 3))
print(a.search([1], 0))
