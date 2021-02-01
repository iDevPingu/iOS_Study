//
//  main.swift
//  48 - Rotate Image
//
//  Created by Jaeick Hwang on 2021/01/26.
//

import Foundation

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for i in 0..<n {
            var temp: [Int] = []
            for j in stride(from: n - 1, to: -1, by: -1) {
                temp.append(matrix[j][i])
            }
            matrix.append(temp)
        }
        
        for _ in 0..<(matrix.count / 2) {
            matrix.removeFirst()
        }
    }
}

let a = Solution()
var b = [[1,2,3],[4,5,6],[7,8,9]]
a.rotate(&b)
print(b)


