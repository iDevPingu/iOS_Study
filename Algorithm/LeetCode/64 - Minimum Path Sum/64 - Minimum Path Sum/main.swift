//
//  main.swift
//  64 - Minimum Path Sum
//
//  Created by Jaeick Hwang on 2021/01/30.
//

import Foundation

//class Solution {
//    func minPathSum(_ grid: [[Int]]) -> Int {
//        let n = grid[0].count
//        let m = grid.count
//        let dx: [Int] = [0,1]
//        let dy: [Int] = [1,0]
//
//        var sum: [[Int]] = [[Int]](repeating: [Int](repeating: -1, count: n), count: m)
//        sum[0][0] = grid[0][0]
//        var stack: [[Int]] = [[0,0]]
//
//        while !stack.isEmpty {
//            let nowPosition = stack.popLast()!
//            let nowPath = sum[nowPosition[0]][nowPosition[1]]
//
//            for i in 0..<2 {
//                let newX = nowPosition[1] + dx[i]
//                let newY = nowPosition[0] + dy[i]
//
//                if newX < 0 || newY < 0 || newX > n-1 || newY > m-1 {
//                    continue
//                } else {
//                    // 방문한 적이 없는 경우
//                    if sum[newY][newX] == -1 {
//                        // 현재 위치에 대한 거리와 새로운 위치에 대한 거리를 더한 값으로 업데이트
//                        sum[newY][newX] = nowPath + grid[newY][newX]
//                        stack.append([newY, newX])
//                    } else {
//                        // 새로운 위치에 대한 기존 값과 현재 위치에 대한 값에 대한 대소 비교 후 더 작은거로 선택
//                        if sum[newY][newX] <= grid[newY][newX] + nowPath {
//                            continue
//                        } else {
//                            sum[newY][newX] = grid[newY][newX] + nowPath
//                            stack.append([newY, newX])
//                        }
//                    }
//                }
//            }
//        }
//
//        return sum[m-1][n-1]
//    }
//}
class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var result: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 && j == 0 {
                    result[i][j] = grid[i][j]
                } else if i == 0 {
                    result[i][j] = result[i][j-1] + grid[i][j]
                } else if j == 0 {
                    result[i][j] = result[i-1][j] + grid[i][j]
                } else {
                    result[i][j] = min(result[i-1][j] + grid[i][j], result[i][j-1] + grid[i][j])
                }
            }
        }
        
        return result[m-1][n-1]
    }
}

let a = Solution()
print(a.minPathSum([[1,3,1], [1,5,1], [4,2,1]]))
print(a.minPathSum([[0,0], [0,0]]))
print(a.minPathSum([[5,4,2,9,6,0,3,5,1,4,9,8,4,9,7,5,1],
                    [3,4,9,2,9,9,0,9,7,9,4,7,8,4,4,5,8],
                    [6,1,8,9,8,0,3,7,0,9,8,7,4,9,2,0,1],
                    [4,0,0,5,1,7,4,7,6,4,1,0,1,0,6,2,8],
                    [7,2,0,2,9,3,4,7,0,8,9,5,9,0,1,1,0],
                    [8,2,9,4,9,7,9,3,7,0,3,6,5,3,5,9,6],
                    [8,9,9,2,6,1,2,5,8,3,7,0,4,9,8,8,8],
                    [5,8,5,4,1,5,6,6,3,3,1,8,3,9,6,4,8],
                    [0,2,2,3,0,2,6,7,2,3,7,3,1,5,8,1,3],
                    [4,4,0,2,0,3,8,4,1,3,3,0,7,4,2,9,8],
                    [5,9,0,4,7,5,7,6,0,8,3,0,0,6,6,6,8],
                    [0,7,1,8,3,5,1,8,7,0,2,9,2,2,7,1,5],
                    [1,0,0,0,6,2,0,0,2,2,8,0,9,7,0,8,0],
                    [1,1,7,2,9,6,5,4,8,7,8,5,0,3,8,1,5],
                    [8,9,7,8,1,1,3,0,1,2,9,4,0,1,5,3,1],
                    [9,2,7,4,8,7,3,9,2,4,2,2,7,8,2,6,7],
                    [3,8,1,6,0,4,8,9,8,0,2,5,3,5,5,7,5],
                    [1,8,2,5,7,7,1,9,9,8,9,2,4,9,5,4,0],
                    [3,4,4,1,5,3,3,8,8,6,3,5,3,8,7,1,3]]))
