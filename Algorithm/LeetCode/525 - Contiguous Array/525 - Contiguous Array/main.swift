//
//  main.swift
//  525 - Contiguous Array
//
//  Created by Ick on 2020/08/18.
//  Copyright © 2020 jaicoco. All rights reserved.
//

import Foundation

class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        var count = 0
        if nums.count % 2 == 1{
            count = nums.count - 1
        } else {
            count = nums.count
        }
        
        for i in stride(from: count, through: 1, by: -2){
            for index in 0..<nums.count-i+1{
                let sum = nums[index..<index+i].reduce(0, +)

                if sum == (i / 2){
                    
                    return i
                }
            }
            
        }
        
        return 0
    }
}

//let total = a.reduce(0, +)
//print(total)

let b = Solution()
print(b.findMaxLength(a))

