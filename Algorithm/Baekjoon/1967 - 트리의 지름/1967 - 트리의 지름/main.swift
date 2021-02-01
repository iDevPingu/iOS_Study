//
//  main.swift
//  1967 - 트리의 지름
//
//  Created by Ick on 2020/10/07.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() {
    let n = Int(readLine()!)!
    
    // 간선의 정보를 저장한 Array
    var graph: [[(Int,Int,Int)]] = [[(Int,Int,Int)]](repeating: [], count: n+1)
    
    // 입력 받는 중
    for _ in 0..<n-1 {
        let line = readLine()!.split(separator: " ").map({Int(String($0))!})
        graph[line[0]].append((line[0],line[1],line[2]))
        graph[line[1]].append((line[1],line[0],line[2]))
    }
    
    // 어떤 정점에 가기 위한 가중치를 저장하는 Array. 초기 값을 0으로 설정.
    var visited: [Int] = [Int](repeating: 0, count: n+1)
    
    // 트리의 정점을 모두 확인하기 위한 dfs
    func dfs (_ start: (Int,Int,Int)) {
        var stack: [(Int,Int,Int)] = [start]
        
        while !stack.isEmpty {
            let now = stack.popLast()!
            
            if visited[now.1] == 0 {
                visited[now.1] = visited[now.0] + now.2
                
                stack += graph[now.1]
            }
        }
    }
    
    // 트리의 어떤 정점에서 시작했을 때 가중치가 가장 큰 값이 트리의 지름을 구성하는 두 점 중 하나.
    dfs((1,1,0))
    let max = visited.max()!
    var temp = 0
    
    for i in 0..<visited.count {
        if visited[i] == max {
            temp = i
            break
        }
    }
    // 구해진 한점을 기준으로 모든 정점으로 가는 가중치를 구한다.
    visited = [Int](repeating: 0, count: n+1)
    dfs((temp,temp,0))
    // 정점에 도달하는 가중치의 최댓값이 정답
    print(visited.max()!)
}

solution()
