//
//  main.swift
//  [Kakao] 2020 Intern - 동굴 탐험
//
//  Created by Ick on 2021/02/21.
//

import Foundation

func solution(_ n:Int, _ path:[[Int]], _ order:[[Int]]) -> Bool {
    var visited = [Bool](repeating: false, count: n)
    
    var graph = [[Int]](repeating: [], count: n)
    var orderCheck = [Int](repeating: 0, count: n)
    for line in path {
        graph[line[0]].append(line[1])
        graph[line[1]].append(line[0])
    }
    for ord in order {
        orderCheck[ord[1]] = ord[0]
    }
    
    var needToVisit = [Int](repeating: 0, count: n)
    
    func visit(_ node: Int) {
        if visited[node] {
            return
        }
        if !visited[orderCheck[node]] {
            needToVisit[orderCheck[node]] = node
            return
        }
        visited[node] = true
        visit(needToVisit[node])
        for i in graph[node] {
            visit(i)
        }
    }
    
    if orderCheck[0] != 0 {
        return false
    }
    
    visited[0] = true
    for i in 0..<graph[0].count {
        visit(graph[0][i])
    }
    
    if visited.contains(false) {
        return false
    } else {
        return true
    }
}

print(solution(9, [[0,1],[0,3],[0,7],[8,1],[3,6],[1,2],[4,7],[7,5]], [[8,5],[6,7],[4,1]]))
print(solution(9, [[8,1],[0,1],[1,2],[0,7],[4,7],[0,3],[7,5],[3,6]], [[4,1],[5,2]]))
print(solution(9, [[0,1],[0,3],[0,7],[8,1],[3,6],[1,2],[4,7],[7,5]], [[4,1],[8,7],[6,5]]))
