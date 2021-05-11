//
//  main.swift
//  4 - Median of Two Sorted Array
//
//  Created by Ick on 2021/05/11.
//

import Foundation

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var nums1Index: Int = 0
        var nums2Index: Int = 0
        
        if nums1.isEmpty {
            if nums2.count % 2 == 0 {
                let temp = nums2[nums2.count / 2] + nums2[(nums2.count / 2) - 1]
                return Double(temp) / 2.0
            } else {
                return Double(nums2[nums2.count / 2])
            }
        } else if nums2.isEmpty {
            if nums1.count % 2 == 0 {
                let temp = nums1[nums1.count / 2] + nums1[(nums1.count / 2) - 1]
                return Double(temp) / 2.0
            } else {
                return Double(nums1[nums1.count / 2])
            }
        }
        var newArray: [Int] = []
        while nums1Index < nums1.count && nums2Index < nums2.count {
            if nums1[nums1Index] >= nums2[nums2Index] {
                newArray.append(nums2[nums2Index])
                nums2Index += 1
            } else {
                newArray.append(nums1[nums1Index])
                nums1Index += 1
            }
        }
        
        if nums1Index >= nums1.count {
            newArray += Array(nums2[nums2Index...])
        } else if nums2Index >= nums2.count {
            newArray += Array(nums1[nums1Index...])
        }
        
        if newArray.count % 2 == 0 {
            let temp = newArray[newArray.count / 2] + newArray[(newArray.count / 2) - 1]
            return Double(temp) / 2.0
        } else {
            return Double(newArray[newArray.count / 2])
        }
    }
}

let a = Solution()
print(a.findMedianSortedArrays([1,3], [2]))
print(a.findMedianSortedArrays([1,2], [3,4]))
print(a.findMedianSortedArrays([0,0], [0,0]))
print(a.findMedianSortedArrays([], [1]))
print(a.findMedianSortedArrays([2], []))
