//
//  main.swift
//  [Kakao] 2021 Blind - 합승 택시 요금
//
//  Created by Ick on 2021/03/20.
//

import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    let inf = 123456789
    var graph: [[Int]] = [[Int]](repeating: [Int](repeating: inf, count: n+1), count: n+1)
    for fare in fares {
        graph[fare[0]][fare[1]] = fare[2]
        graph[fare[1]][fare[0]] = fare[2]
    }
    for i in 0...n {
        for j in 0...n {
            for k in 0...n {
                if j == k {
                    graph[j][k] = 0
                    continue
                }
                graph[j][k] = min(graph[j][i] + graph[i][k], graph[j][k])
            }
        }
    }
    // 합승 안하고 각자 갈 때
    var result: Int = graph[s][a] + graph[s][b]
    for i in 1...n {
        let 합승요금 = graph[s][i] + graph[i][a] + graph[i][b]
        result = min(result, 합승요금)
    }

    return result
}
//print(solution(6, 4, 6, 2, [[4, 1, 10], [3, 5, 24], [5, 6, 2], [3, 1, 41], [5, 1, 24], [4, 6, 50], [2, 4, 66], [2, 3, 22], [1, 6, 25]]))
//print(solution(7, 3, 4, 1, [[5, 7, 9], [4, 6, 4], [3, 6, 1], [3, 2, 3], [2, 1, 6]]))
print(solution(6, 4, 5, 6, [[2,6,6], [6,3,7], [4,6,7], [6,5,11], [2,5,12], [5,3,20], [2,4,8], [4,3,9]]))
