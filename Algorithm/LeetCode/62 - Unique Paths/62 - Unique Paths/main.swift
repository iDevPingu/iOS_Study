//
//  main.swift
//  62 - Unique Paths
//
//  Created by Jaeick Hwang on 2021/01/30.
//

import Foundation

//class Solution {
//    func uniquePaths(_ m: Int, _ n: Int) -> Int {
//        var result = 0
//        var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
//        visited[0][0] = true
//        let dx: [Int] = [0, 1]
//        let dy: [Int] = [1, 0]
//        var stack: [[Int]] = [[0,0]]
//
//        func dfs() {
//            if stack.isEmpty {
//                return
//            }
//            let now = stack.popLast()!
//            if now == [m-1, n-1] {
//                result += 1
//                return
//            }
//            for i in 0..<2 {
//                let newX = now[1] + dx[i]
//                let newY = now[0] + dy[i]
//                if newX < 0 || newY < 0 || newX > n-1 || newY > m-1 {
//                    continue
//                } else {
//                    if !visited[newY][newX] {
//                        visited[newY][newX] = true
//                        stack.append([newY, newX])
//                        dfs()
//                        visited[newY][newX] = false
//                    }
//                }
//            }
//        }
//
//        dfs()
//
//        return result
//    }
//}
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var result: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 || j == 0 {
                    result[i][j] = 1
                } else {
                    result[i][j] = min(result[i-1][j] + result[i][j-1], 2000000000)
                }
            }
        }
        
        return result[m-1][n-1]
    }
}
let a = Solution()
print(a.uniquePaths(3, 7))
print(a.uniquePaths(3, 2))
print(a.uniquePaths(7, 3))
print(a.uniquePaths(3, 3))
print(a.uniquePaths(100, 90))
