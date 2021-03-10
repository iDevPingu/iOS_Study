//
//  main.swift
//  494 - Target Sum
//
//  Created by Ick on 2021/02/22.
//

import Foundation


// brute force -> 당연히 시간초과가 뜬다. 이유는 시간 복잡도가 2^n 인 문제이므로 최대 2^20번의 연산을 한 번에 해줘야하므로
//class Solution {
//    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
//
//        var bf: [Int] = []
//
//        for i in 0..<nums.count {
//            if bf.isEmpty {
//                bf = [nums[i], -nums[i]]
//            } else {
//                var temp: [Int] = []
//                for j in 0..<bf.count {
//                    temp.append(bf[j] + nums[i])
//                    temp.append(bf[j] - nums[i])
//                }
//                bf = temp
//            }
//        }
//
//        var result: Int = 0
//
//        for num in bf {
//            if num == S {
//                result += 1
//            }
//        }
//
//        return result
//    }
//}

class Solution {
    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        var result: Int = 0
        var hashMap: [String: Int] = [:]
        func dfs(_ index: Int, _ sum: Int) {
            if index == nums.count {
                if sum == S {
                    result += 1
                }
                return
            }
            dfs(index+1, sum + nums[index])
            dfs(index+1, sum - nums[index])
            
        }
        
        func divideAndConquer(_ index: Int, _ sum: Int, _ now: [Int]) -> Int {
            let key = "\(index)->\(sum)"
            if let value = hashMap[key] {
                return value
            }
            if index == nums.count {
                if sum == S {
                    return 1
                } else {
                    return 0
                }
            }
            let add = divideAndConquer(index + 1, sum + nums[index], now + [nums[index]])
            let minus = divideAndConquer(index + 1, sum - nums[index], now + [-nums[index]])
            let temp = add + minus
            
            hashMap[key] = temp
            return temp
        }
        
        result = divideAndConquer(0, 0, [])
        
        return result
    }
}

let a = Solution()
print(a.findTargetSumWays([1,1,1,1,1], 3))
