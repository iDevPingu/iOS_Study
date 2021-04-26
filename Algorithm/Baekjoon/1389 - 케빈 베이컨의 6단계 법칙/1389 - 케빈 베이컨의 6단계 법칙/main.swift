//
//  main.swift
//  1389 - 케빈 베이컨의 6단계 법칙
//
//  Created by Ick on 2021/04/23.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0], m = firstLine[1]
    
    let inf = 77777777
    var graph = [[Int]](repeating: [Int](repeating: inf, count: n), count: n)
    for _ in 0..<m {
        let data = readLine()!.split(separator: " ").map({Int(String($0))!})
        graph[data[0]-1][data[1]-1] = 1
        graph[data[1]-1][data[0]-1] = 1
    }
    
    for i in 0..<n {
        for j in 0..<n {
            for k in 0..<n {
                if i == j {
                    continue
                }
                graph[j][k] = min(graph[j][k], graph[j][i] + graph[i][k])
            }
        }
    }
    
    for i in 0..<n {
        graph[i][i] = 0
    }
    print(graph)
    var minValue: Int = 77777777
    var result: [Int] = []
    for i in 0..<n {
        var kevinBacon: Int = 0
        for j in 0..<n {
            kevinBacon += graph[i][j]
        }
        minValue = min(minValue, kevinBacon)
        result.append(kevinBacon)
    }
    print(result.firstIndex(of: minValue)! + 1)
}
solution()
