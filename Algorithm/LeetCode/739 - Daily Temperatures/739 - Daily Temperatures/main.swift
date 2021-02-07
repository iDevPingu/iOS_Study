//
//  main.swift
//  739 - Daily Temperatures
//
//  Created by Ick on 2021/02/07.
//

import Foundation
// Stack 사용 문제
class Solution {
    func dailyTemperatures(_ T: [Int]) -> [Int] {
        var result: [Int] = [Int](repeating: 0, count: T.count)
        if T.count < 2 {
            return result
        }
        var stack: [Int] = []
        for i in 0..<T.count {
            while !stack.isEmpty && T[i] > T[stack.last!] {
                let higherIndex = stack.removeLast()
                result[higherIndex] = i - higherIndex
            }
            stack.append(i)
        }
        
        return result
    }
}

let a = Solution()
print(a.dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73]))

print(a.dailyTemperatures([1,30000]))
