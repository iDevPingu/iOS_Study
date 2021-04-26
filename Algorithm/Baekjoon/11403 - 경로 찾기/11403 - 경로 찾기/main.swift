//
//  main.swift
//  11403 - 경로 찾기
//
//  Created by Ick on 2020/11/15.
//
// 플로이드 와샬
import Foundation

func solution() {
    let n = Int(readLine()!)!
    var graph: [[Int]] = []
    
    for _ in 0..<n {
        graph.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
    
    for i in 0..<n {
        for j in 0..<n {
            for k in 0..<n {
                if graph[j][i] == 1 && graph[i][k] == 1 {
                    graph[j][k] = 1
                }
            }
        }
    }
    
    for i in 0..<n {
        var str = ""
        for j in 0..<n {
            str += "\(graph[i][j]) "
        }
        print(str)
    }
    
}

solution()
