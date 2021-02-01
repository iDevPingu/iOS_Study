//
//  main.swift
//  1261 - 알고스팟
//
//  Created by Ick on 2020/09/22.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

class Queue<T>{
    var enqueue: [T]
    var dequeue: [T] = []
    
    var isEmpty: Bool{
        return enqueue.isEmpty && dequeue.isEmpty
    }
    var count: Int{
        return enqueue.count + dequeue.count
    }
    
    init(_ queue:[T]){
        self.enqueue = queue
    }
    
    func push(_ n: T){
        enqueue.append(n)
    }
    
    func pop() -> T?{
        if dequeue.isEmpty{
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
    
}

func solution(){
    let inf = 777777777
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let m = firstLine[0], n = firstLine[1]
    var maze: [[Int]] = []
    for _ in 0..<n{
        maze.append(readLine()!.map({Int(String($0))!}))
    }
    let dydx = [[-1,0],[1,0],[0,-1],[0,1]] //상하좌우
    
    var visited: [[Int]] = [[Int]](repeating: [Int](repeating: inf, count: m), count: n)
    visited[0][0] = 0
    
    let queue: Queue = Queue([[Int]]())
    queue.push([0,0])
    
    while(!queue.isEmpty){
        let now = queue.pop()!
        let nowy = now[0]
        let nowx = now[1]
        for i in 0..<dydx.count{
            let nextY = now[0] + dydx[i][0]
            let nextX = now[1] + dydx[i][1]
            if nextY < 0 || nextX < 0 || nextY > n-1 || nextX > m-1 {
                continue
            } else {
                // 벽이라면
                if maze[nextY][nextX] == 1{
                    // 방문 안했다면 -> 무조건 지금거 + 1 넣기
                    if visited[nextY][nextX] == inf{
                        visited[nextY][nextX] = visited[nowy][nowx] + 1
                        queue.push([nextY,nextX])
                    // 방문 한 경우 -> 지금거 + 1 거보다 큰지 확인한다
                    } else {
                        // 만약 지금 벽 부수고 가는게 더 이득이면
                        if visited[nextY][nextX] > visited[nowy][nowx] + 1{
                            visited[nextY][nextX] = visited[nowy][nowx] + 1
                            queue.push([nextY,nextX])
                        // 만약 지금 벽 부수고 가는게 더 손해면
                        } else {
                            continue
                        }
                    }
                // 벽이 아니라면
                // 방문 안했다면 그냥 지금거 넣기
                } else {
                    if visited[nextY][nextX] == inf{
                        visited[nextY][nextX] = visited[nowy][nowx]
                        queue.push([nextY,nextX])
                    } else {
                        // 만약 방문 한 곳인데 지금 가는 것이 더 이득이라면
                        if visited[nextY][nextX] > visited[nowy][nowx]{
                            visited[nextY][nextX] = visited[nowy][nowx]
                            queue.push([nextY,nextX])
                        }
                    }
                    
                }
            }
        }
    }
    print(visited[n-1][m-1])
    
}

solution()
