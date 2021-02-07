//
//  main.swift
//  96 - Unique Binary Search Tree
//
//  Created by Ick on 2021/02/04.
//

import Foundation

class Solution {
    func numTrees(_ n: Int) -> Int {
        // 1 -> 1
        // 2 -> 2
        // 3 -> 5
        // 4 -> 17
        if n == 1 {
            return 1
        } else if n == 2 {
            return 2
        }
        var result: [Int] = [0,1,2]
        var count: Int = 2
        
        while count != n {
            var temp: Int = 0
            for i in 1..<result.count {
                temp += result[i] * i
            }
            result.append(temp)
            count += 1
        }
        print(result)
        return result[n]
    }
}

let a = Solution()
print(a.numTrees(3))
print(a.numTrees(4))
