//
//  main.swift
//  2665 - 미로만들기
//
//  Created by Ick on 2020/11/08.
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

func solution() {
    let n = Int(String(readLine()!))!
    var maze: [[Int]] = []
    
    for _ in 0..<n {
        maze.append(readLine()!.map({Int(String($0))!}))
    }
    
    let dx: [Int] = [0,0, -1,1]
    let dy: [Int] = [-1,1, 0,0]

    let queue: Queue = Queue([[Int]]())
    // x좌료, y좌표
    queue.push([0,0])
    
    // 벽 부순 횟수
    var visited: [[Int]] = [[Int]](repeating: [Int](repeating: 99999, count: n), count: n)
    visited[0][0] = 0
    
    while(!queue.isEmpty) {
        guard let now = queue.pop() else { fatalError() }
        for i in 0..<dx.count {
            let nextX = now[0] + dx[i]
            let nextY = now[1] + dy[i]
            
            if nextX < 0 || nextX > n-1 || nextY < 0 || nextY > n-1 {
                continue
            } else {
                // 흰방일 때
                if maze[nextY][nextX] == 1 {
                    if visited[nextY][nextX] > visited[now[1]][now[0]] {
                        visited[nextY][nextX] = visited[now[1]][now[0]]
                        queue.push([nextX, nextY])
                    }
                // 검은방일 때
                } else {
                    if visited[nextY][nextX] > visited[now[1]][now[0]] + 1 {
                        visited[nextY][nextX] = visited[now[1]][now[0]] + 1
                        queue.push([nextX, nextY])
                    }
                }
            }
        }
    }
    print(visited[n-1][n-1])
}

solution()
