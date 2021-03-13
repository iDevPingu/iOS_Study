//
//  main.swift
//  2573 - 빙산
//
//  Created by Ick on 2021/03/14.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let m = firstLine[1]
    
    var map: [[Int]] = []
    for _ in 0..<n {
        map.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
    
    var stack: [[Int]] = []
    let dx: [Int] = [0,0,-1,1]
    let dy: [Int] = [-1,1,0,0]
    
    var year: Int = 0
    var result: Int = 0
    var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    
    var tempMap = map
    func meltIckBerg(_ position: [Int]) {
        for i in 0..<4 {
            let newX = position[1] + dx[i]
            let newY = position[0] + dy[i]
            if newX < 0 || newY < 0 || newX >= m || newY >= n {
                continue
            } else {
                if map[newY][newX] == 0 {
                    if tempMap[position[0]][position[1]] != 0 {
                        tempMap[position[0]][position[1]] -= 1
                    }
                }
            }
        }
    }
    func dfs() {
        if stack.isEmpty {
            return
        }
        let position = stack.popLast()!
        
        for i in 0..<4 {
            let newX = position[1] + dx[i]
            let newY = position[0] + dy[i]
            if newX < 0 || newY < 0 || newX >= m || newY >= n {
                continue
            } else {
                if map[newY][newX] == 0 {
                    continue
                } else {
                    if !visited[newY][newX] {
                        stack.append([newY, newX])
                        visited[newY][newX] = true
                        dfs()
                    }
                }
            }
        }
    }
    while true {
        year += 1
        var iceBerg: Int = 0
        visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
        for i in 0..<n {
            for j in 0..<m {
                if map[i][j] != 0 {
                    meltIckBerg([i,j])
                }
            }
        }
        map = tempMap
        for i in 0..<n {
            for j in 0..<m {
                if map[i][j] != 0 {
                    if !visited[i][j] {
                        iceBerg += 1
                        visited[i][j] = true
                        stack.append([i,j])
                        dfs()
                    }
                }
            }
        }
        if iceBerg == 0 {
            result = 0
            break
        } else if iceBerg > 1 {
            result = year
            break
        }
    }

    print(result)
}
solution()
