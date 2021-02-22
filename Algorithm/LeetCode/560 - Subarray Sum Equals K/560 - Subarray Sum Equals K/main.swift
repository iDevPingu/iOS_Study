//
//  main.swift
//  560 - Subarray Sum Equals K
//
//  Created by Ick on 2021/02/20.
//

import Foundation
//brute force
//class Solution {
//    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
//        var result: Int = 0
//
//        for i in 0..<nums.count {
//            var temp = nums[i]
//            if temp == k {
//                result += 1
//            }
//            for j in i+1..<nums.count {
//                temp += nums[j]
//                if temp == k {
//                    result += 1
//                }
//            }
//        }
//
//        return result
//    }
//}

class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var result: Int = 0
        var dict: [Int: Int] = [0:1]
        var sum: Int = 0
        
        for i in 0..<nums.count {
            sum += nums[i]
            // 만약 sum - k가 있었다면? 그 값을 더한다. -> 현재 sum이 되기전에 k인 적이 있었다. 그걸 지금 더한다.
            if let count = dict[sum-k] {
                result += count
            }
            // 현재 dict에 sum이 있다면
            if let value = dict[sum] {
                // 현재 sum key의 value값에 +1
                dict[sum] = value + 1
            // 현재 dict에 sum이 없다면
            } else {
                dict[sum] = 1
            }
        }
        
        return result
    }
}

let a = Solution()
print(a.subarraySum([1,1,1], 2))
print(a.subarraySum([1,2,3], 3))
print(a.subarraySum([0,0], 0))
