//
//  main.swift
//  11724 - 연결 요소의 개수
//
//  Created by Ick on 2020/11/09.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let m = firstLine[1]
    
    var graph: [[Int]] = [[Int]](repeating: [], count: n+1)
    var visited: [Bool] = [Bool](repeating: false, count: n+1)
    
    for _ in 0..<m {
        let data = readLine()!.split(separator: " ").map({Int(String($0))!})
        graph[data[0]].append(data[1])
        graph[data[1]].append(data[0])
    }

    var result: Int = 0
    
    func dfs(now: Int) {
        visited[now] = true
        
        for i in 0..<graph[now].count {
            let next = graph[now][i]
            if !visited[next] {
                dfs(now: next)
            }
        }
    }
    
    for i in 1...n {
        if !visited[i] {
            dfs(now: i)
            result += 1
        }
    }
    
    print(result)
    
}

solution()
