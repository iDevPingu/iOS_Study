//
//  main.swift
//  2468 - 안전 영역
//
//  Created by Ick on 2020/11/10.
//

import Foundation

func solution(){
    let n = Int(readLine()!)!
    
    var areas: [[Int]] = []
    var max: Int = 0
    
    for _ in 0..<n {
        let temp = readLine()!.split(separator: " ").map({Int(String($0))!})
        let tempMax = temp.max()!
        if max < tempMax {
            max = tempMax
        }
        areas.append(temp)
    }
    var visited: [[Bool]] = []
    var result: Int = 1
    
    let dx: [Int] = [0,0,-1,1]
    let dy: [Int] = [-1,1,0,0]
    
    func dfs(_ i: Int, _ j: Int, _ h: Int){
        for k in 0..<dx.count {
            let nx = j + dx[k]
            let ny = i + dy[k]
            if nx < 0 || nx > n-1 || ny < 0 || ny > n-1 {
                continue
            } else {
                if !visited[ny][nx] && areas[ny][nx] > h {
                    visited[ny][nx] = true
                    dfs(ny,nx,h)
                }
            }
        }
    }
    
    for rain in 1...max {
        var count: Int = 0
        visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        for i in 0..<n{
            for j in 0..<n{
                if areas[i][j] > rain && !visited[i][j] {
                    visited[i][j] = true
                    dfs(i,j,rain)
                    count += 1
                }
            }
        }
        if result < count {
            result = count
        }
    }
    
    print(result)
}

solution()
