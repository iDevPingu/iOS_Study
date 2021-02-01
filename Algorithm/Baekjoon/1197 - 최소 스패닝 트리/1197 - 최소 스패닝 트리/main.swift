//
//  main.swift
//  1197 - 최소 스패닝 트리
//
//  Created by Ick on 2020/09/01.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() -> Int{
    
    let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
    let v = firstLine[0]
    let e = firstLine[1]
    
    var parent = Array(0...v)
    var graph: [[Int]] = []
    var lines = 0
    var result = 0
    
    // 부모 노드를 찾는 함수
    func findParent(_ index: Int) -> Int{
        
        if parent[index] == index {
            return index
        } else {
            parent[index] = findParent(parent[index])
            return parent[index]
        }
    }

    // 부모 노드를 합치는 함수
    func unionParent(_ a: Int, _ b: Int) {
        let num1 = findParent(a)
        let num2 = findParent(b)
        if a < b {
            parent[num2] = num1
        } else {
            parent[num1] = num2
        }
        
    }
    
    
    for _ in 0..<e {
        graph.append(readLine()!.split(separator: " ").map({Int($0)!}))
    }
    
    graph.sort { (a, b) -> Bool in
        return a[2] < b[2]
    }
    
    for index in 0..<graph.count {
        if lines == v - 1 {
            break
        }
        if findParent(graph[index][0]) != findParent(graph[index][1]) {
            result += graph[index][2]
            lines += 1
            unionParent(graph[index][0], graph[index][1])
        }
    }
    
    return result
}

print(solution())
