//
//  main.swift
//  1260 - DFS와 BFS
//
//  Created by Ick on 2020/07/28.
//  Copyright © 2020 Ick. All rights reserved.
//

import Foundation

let firstLine = readLine()!.split(separator: " ").map(){Int(String($0))!}
let N = firstLine[0]
let M = firstLine[1]
let V = firstLine[2]
var graph = [Int: [Int]]()

for _ in 0..<M {
    let line = readLine()!.split(separator: " ").map(){Int(String($0))!}
    let start = line[0]
    let end = line[1]

    if graph[start] == nil {
        graph[start] = [end]
    } else {
        graph[start]?.append(end)
    }
    if graph[end] == nil {
        graph[end] = [start]
    } else {
        graph[end]?.append(start)
    }
}
for key in graph.keys {
    graph[key]?.sort(by: >)
}
var dfsResult = ""
for i in DFS(graph,V) {
    dfsResult += String(i) + " "
}

for key in graph.keys {
    graph[key]?.sort(by: <)
}
var bfsResult = ""
for i in BFS(graph,V) {
    bfsResult += String(i) + " "
}

print(dfsResult)
print(bfsResult)

func DFS(_ graph: [Int: [Int]], _ start: Int ) -> [Int]{

    var visited = [Int]()
    var stack = [start]

    while stack.count != 0 {
        let node = stack.popLast()!
        if visited.contains(node) {
            continue
        } else {
            visited.append(node)
            if let nodeWay = graph[node] {
                stack += nodeWay
            }
        }
    }
    return visited
}

func BFS(_ graph: [Int: [Int]], _ start: Int) -> [Int]{
    var visited = [Int]()
    var queue = [start]
    
    while queue.count != 0 {
        let node = queue.remove(at: 0)
        if visited.contains(node){
            continue
        } else {
            visited.append(node)
            if let nodeWay = graph[node] {
                queue += nodeWay
            }
        }
    }
    return visited
}
