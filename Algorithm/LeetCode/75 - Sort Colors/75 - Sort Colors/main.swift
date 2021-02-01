//
//  main.swift
//  75 - Sort Colors
//
//  Created by Jaeick Hwang on 2021/01/30.
//

import Foundation

class Solution {
    func sortColors(_ nums: inout [Int]) {
        var hashTable: [Int: Int] = [:]
        hashTable[0] = 0
        hashTable[1] = 0
        hashTable[2] = 0
        
        for i in nums {
            hashTable[i]! += 1
        }
        
        var red = hashTable[0]!
        var white = hashTable[1]!
        var blue = hashTable[2]!
    
        
        for i in 0..<nums.count{
            if red != 0 {
                nums[i] = 0
                red -= 1
            } else if red == 0 && white != 0 {
                nums[i] = 1
                white -= 1
            } else if red == 0 && white == 0 && blue != 0 {
                nums[i] = 2
                blue -= 1
            }
        }
    }
}

let a = Solution()
var nums = [2,0,2,1,1,0]
a.sortColors(&nums)
print(nums)

