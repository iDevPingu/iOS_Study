//
//  main.swift
//  11725 - 트리의 부모 찾기
//
//  Created by Ick on 2020/09/27.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution(){
    let n = Int(readLine()!)!
    var lines: [[Int]] = [[Int]](repeating: [], count: n+1)
    
    var visited: [Int] = [Int](repeating: 0, count: n+1)
    for _ in 0..<n-1{
        let line = readLine()!.split(separator: " ").map({Int(String($0))!})
        lines[line[0]].append(line[1])
        lines[line[1]].append(line[0])
    }
    
//    print(lines)
    dfs(1, &lines, &visited)

    for i in 2..<visited.count{
        print(visited[i])
    }
}

func dfs(_ start: Int,_ graph: inout [[Int]],_ parents: inout [Int] ){
    for i in graph[start]{
        if parents[i] == 0{
            parents[i] = start
            dfs(i, &graph, &parents)
        }
    }
}
solution()
