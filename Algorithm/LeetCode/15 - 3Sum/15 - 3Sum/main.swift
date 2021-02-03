//
//  main.swift
//  15 - 3Sum
//
//  Created by Ick on 2021/01/17.
//

import Foundation

//class Solution {
//    func threeSum(_ nums: [Int]) -> [[Int]] {
//        if nums.count < 3 {
//            return []
//        }
//
//        var result: [[Int]] = []
//
//        let nums = nums.sorted()
//
//        var isZero: Bool = false
//        // +,- 부호 바뀌는 곳 혹은 0의 위치
//        var firstZeroIndex: Int = -1
//        var lastZeroIndex: Int = -1
//
//        // 배열의 첫번째 값이 0보다 크면 볼 필요가 없다
//        if nums[0] > 0 {
//            return []
//        }
//        // 배열의 마지막 값이 0보다 작으면 볼 필요가 없다.
//        if nums[0] < 0 && nums.last! <= 0 {
//            return []
//        }
//
//        for i in 0..<nums.count {
//            if nums[i] == 0 && firstZeroIndex == -1 {
//                isZero = true
//                firstZeroIndex = i
//                continue
//            } else if nums[i] == 0 && firstZeroIndex != -1 && lastZeroIndex < i {
//                isZero = true
//                lastZeroIndex = i
//                continue
//            } else if firstZeroIndex == -1 && lastZeroIndex == -1 && nums[i] > 0 {
//                isZero = false
//                firstZeroIndex = i
//                lastZeroIndex = i
//                break
//            } else if firstZeroIndex != -1 && lastZeroIndex == -1 && nums[i] > 0 {
//                isZero = true
//                lastZeroIndex = firstZeroIndex
//                break
//            } else if nums[i] > 0 {
//                break
//            }
//        }
//
//        if lastZeroIndex - firstZeroIndex >= 2 {
//            result.append([0,0,0])
//        }
//
//        for m in 0..<firstZeroIndex {
//            for pl in lastZeroIndex..<nums.count {
//                if nums[m] + nums[pl] == 0 && isZero{
//                    result.append([nums[m], 0, nums[pl]])
//                } else if nums[m] + nums[pl] != 0 {
//                    for pr in pl+1..<nums.count {
//                        if nums[m] + nums[pl] + nums[pr] == 0 {
//                            result.append([nums[m], nums[pl], nums[pr]])
//                        }
//                    }
//                }
//            }
//        }
//
//        for p in lastZeroIndex..<nums.count {
//            for ml in 0..<firstZeroIndex {
//                for mr in ml+1..<firstZeroIndex {
//                    if nums[p] + nums[ml] + nums[mr] == 0 {
//                        result.append([nums[ml], nums[mr], nums[p]])
//                    }
//                }
//            }
//        }
//
//
//        result = Array(Set(result))
//
//        return result
//    }
//}

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else { return [[Int]]() }
        let sorted = nums.sorted()
        var result = [[Int]]()
        for i in 0..<sorted.count {
            // 같은건 안본다
            if i != 0 && sorted[i] == sorted[i-1] {
                continue
            }
            var j = i + 1
            // 마지막 값
            var k = sorted.count-1
            // j > k 일 때 종료
            while j < k {
                let sum = sorted[i] + sorted[j] + sorted[k]
                if sum == 0 {
                    result.append([sorted[i], sorted[j], sorted[k]])
                    j += 1
                    // 같은건 안본다
                    while j < k, sorted[j] == sorted[j-1] {
                        j += 1
                    }
                } else if sum < 0 {
                    j += 1
                } else {
                    k -= 1
                }
            }
        }
        return result
    }
}

let a = Solution()
print(a.threeSum([-1,0,1,2,-1,-4]))
print(a.threeSum([]))
print(a.threeSum([0]))
print(a.threeSum([-5,-4,-7,1,2,3,6]))
print(a.threeSum([0,0,0,0,0,0,1]))
print(a.threeSum([-3,-3,0,-5]))
