//
//  main.swift
//  순위
//
//  Created by Ick on 2021/04/23.
//

import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var graph = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    for result in results {
        graph[result[0]-1][result[1]-1] = true
    }
    
    for i in 0..<n {
        for j in 0..<n {
            for k in 0..<n {
                if graph[j][i] && graph[i][k] {
                    graph[j][k] = true
                }
            }
        }
    }
    
    var result: Int = 0
    
    for i in 0..<n {
        var count: Int = 0
        for j in 0..<n {
            if i == j {
                continue
            }
            if graph[i][j] || graph[j][i] {
                count += 1
            }
        }
        if count == n-1 {
            result += 1
        }
    }
    
    return result
}

print(solution(5, [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]]))
