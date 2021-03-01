//
//  main.swift
//  581 - Shortest Unsorted Continuous Subarray
//
//  Created by Ick on 2021/03/02.
//

import Foundation

//class Solution {
//    func findUnsortedSubarray(_ nums: [Int]) -> Int {
//        if nums.count == 1 {
//            return 0
//        }
//
//        var start: Int = -1
//        var end: Int = -1
//
//
//        var minIndex: Int = 0
//
//        var maxIndex: Int = 0
//
//        for i in 0..<nums.count {
//            if nums[i] <= nums[minIndex] {
//                minIndex = i
//            }
//            if nums[i] >= nums[maxIndex] {
//                maxIndex = i
//            }
//        }
//
//        // 앞에서 부터 본다 -> 다음거가 더 작아지는 부분이 오면 해당 부분부터 정렬해야한다!
//        // 또한 최소값보다 작은 값이 최소값인덱스보다 앞에있다면 거기도 수정시작부분이 될 수 있음
//        for i in 0..<nums.count-1 {
//            if start != -1 {
//                break
//            }
//            if nums[i] > nums[i+1] {
//                start = i
//                break
//            } else if nums[i] < nums[minIndex] {
//                start = i
//                break
//            } else {
//                for j in i+1..<nums.count {
//                    if nums[j] < nums[i] {
//                        start = i
//                        break
//                    }
//                }
//            }
//        }
//        for i in stride(from: nums.count - 1, to: 0, by: -1) {
//            if end != -1 {
//                break
//            }
//            if nums[i] < nums[i-1] {
//                end = i
//                break
//            } else if i > maxIndex {
//                end = i
//                break
//            } else {
//                for j in stride(from: i-1, to: -1, by: -1) {
//                    if nums[j] > nums[i] {
//                        end = i
//                        break
//                    }
//                }
//            }
//        }
//        print(start, end)
//        if start == -1 && end == -1 {
//            return 0
//        }
//        return end - start + 1
//    }
//}
class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        var start: Int = -1
        var end: Int = -1
        
        for i in 0..<nums.count {
            if start != -1 {
                break
            }
            for j in i+1..<nums.count {
                if nums[i] > nums[j] {
                    start = i
                    break
                }
            }
        }
        
        for i in stride(from: nums.count - 1, to: -1, by: -1) {
            if end != -1 {
                break
            }
            for j in stride(from: i, to: -1, by: -1) {
                if nums[i] < nums[j] {
                    end = i
                    break
                }
            }
        }
        print(start, end)
        if start == -1 , end == -1 {
            return 0
        } else {
            return end - start + 1
        }
    }
}
let a = Solution()
//print(a.findUnsortedSubarray([2,6,4,8,10,9,15]))
//print(a.findUnsortedSubarray([1,2,3,4]))
//print(a.findUnsortedSubarray([1]))
//print(a.findUnsortedSubarray([4,6,2,5,10]))
//print(a.findUnsortedSubarray([1,1]))
//print(a.findUnsortedSubarray([2,3,3,2,4]))
print(a.findUnsortedSubarray([2,1]))
