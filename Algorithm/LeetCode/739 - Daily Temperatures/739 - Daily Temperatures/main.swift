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
        var stack: [Int] = []
        var result = [Int](repeating: 0, count: T.count)
        for i in 0..<T.count {
            // 스택이 비어있거나 현재 온도가 스택의 마지막 값보다 클 경우
            // -> 이 경우가 이 문제에서 찾고자 하는 부분!
            while !stack.isEmpty && T[i] > T[stack.last!] {
                let index = stack.removeLast()
                result[index] = i - index
            }
            stack.append(i)
        }
        return result
    }
    // O(n^2) 방법
//    func dailyTemperatures(_ T: [Int]) -> [Int] {
//        var result = [Int](repeating: 0, count: T.count)
//        for i in 0..<T.count {
//            for j in i+1..<T.count {
//                if T[i] < T[j] {
//                    result[i] = j - i
//                    break
//                }
//            }
//        }
//        return result
//    }
}
let a = Solution()
print(a.dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73]))

print(a.dailyTemperatures([1,30000]))
