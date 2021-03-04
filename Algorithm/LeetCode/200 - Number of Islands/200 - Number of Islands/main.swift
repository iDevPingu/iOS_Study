//
//  main.swift
//  200 - Number of Islands
//
//  Created by Ick on 2021/03/05.
//

import Foundation

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        
        let dx: [Int] = [0,0,-1,1]
        let dy: [Int] = [-1,1,0,0]
        
        var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        
        var stack: [[Int]] = []
        var numberOfIslands: Int = 0
        
        func dfs() {
            if stack.isEmpty {
                return
            }
            let now = stack.removeLast()
            visited[now[1]][now[0]] = true
            for i in 0..<dx.count {
                let newX = now[0] + dx[i]
                let newY = now[1] + dy[i]
                if newX < 0 || newX >= n || newY < 0 || newY >= m {
                    continue
                } else {
                    if grid[newY][newX] == "0" {
                        continue
                    } else {
                        if visited[newY][newX] {
                            continue
                        } else {
                            stack.append([newX, newY])
                            dfs()
                        }
                    }
                }
            }
        }
        
        for y in 0..<m {
            for x in 0..<n {
                if grid[y][x] == "0" {
                    continue
                } else {
                    if visited[y][x] {
                        continue
                    } else {
                        numberOfIslands += 1
                        stack.append([x,y])
                        dfs()
                    }
                }
            }
        }
        
        return numberOfIslands
    }
}
let a = Solution()
print(a.numIslands([["1","0","1","1","0","1","1"]]))
