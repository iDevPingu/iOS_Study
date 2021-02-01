//
//  main.swift
//  4963 - 섬의 개수
//
//  Created by Ick on 2020/11/10.
//

import Foundation

func solution() {
    // 상하좌우 대각선들
    let dx: [Int] = [0,0,-1,1,-1,1,-1,1]
    let dy: [Int] = [-1,1,0,0,-1,-1,1,1]
    while true {
        let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
        if firstLine == [0,0] {
            break
        }
        let w = firstLine[0]
        let h = firstLine[1]
        var map: [[Int]] = []

        for _ in 0..<h {
            map.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
        }
        
        var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: w), count: h)
        var count: Int = 0
        
        func dfs(_ x: Int, _ y: Int) {
            for i in 0..<dx.count {
                let nx = x + dx[i]
                let ny = y + dy[i]
                if nx < 0 || nx > w-1 || ny < 0 || ny > h-1 {
                    continue
                } else {
                    if !visited[ny][nx] && map[ny][nx] == 1 {
                        visited[ny][nx] = true
                        dfs(nx,ny)
                    }
                }
            }
        }
        
        for i in 0..<h {
            for j in 0..<w {
                if map[i][j] == 1 && !visited[i][j] {
                    visited[i][j] = true
                    dfs(j,i)
                    count += 1
                }
            }
        }
        print(count)
    }
}

solution()
