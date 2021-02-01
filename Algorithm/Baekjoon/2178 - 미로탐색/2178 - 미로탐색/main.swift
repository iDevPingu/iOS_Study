//
//  main.swift
//  2178 - 미로탐색
//
//  Created by Ick on 2020/09/08.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
    let n = firstLine[0]
    let m = firstLine[1]
    
    var maze = [[Int]]()
    
    for _ in 0..<n{
        maze.append(readLine()!.map({Int(String($0))!}))
    }
    
    // 방문한 노드인지 확인하는 배열
    var visited:[[Int]] = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
    // BFS에 필요한 큐
    var queue: [[Int]] = [[0,0]]
    
    let dx: [Int] = [0,0,-1,1] // 상하좌우
    let dy: [Int] = [-1,1,0,0] // 상하좌우
    
    // 시작점에서 어떤 노드에 도달하기 위한 바로 직전의 노드
    var predecessor: [[[Int]]] = [[[Int]]](repeating: [[Int]](repeating: [-1,-1], count: m), count: n)
    predecessor[0][0] = [0,0]
    
    // 시작점에서 어떤 노드에 도달하는 거리
    var distance: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    distance[0][0] = 1
    
    while queue.count != 0 {
        let now = queue.remove(at: 0)
        
        // 방문하지 않은 노드만 확인
        if visited[now[0]][now[1]] == -1 {
            visited[now[0]][now[1]] = 1
            for i in 0..<dx.count{
                let nowdx = now[0] - dx[i]
                let nowdy = now[1] - dy[i]
                
                if nowdx < 0 || nowdx > n-1 || nowdy < 0 || nowdy > m-1{
                    continue
                } else {
                    if maze[nowdx][nowdy] == 1 && visited[nowdx][nowdy] == -1{
                        predecessor[nowdx][nowdy] = now
                        distance[nowdx][nowdy] = distance[now[0]][now[1]] + 1
                        queue.append([nowdx,nowdy])
                    }
                }
            }
        }
    }
    print(distance[n-1][m-1])
}

solution()
