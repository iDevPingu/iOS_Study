//
//  main.swift
//  7562 - 나이트의 이동
//
//  Created by Ick on 2021/01/07.
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
    
    // 나이트가 이동할 수 있는 모든 경우의 수
    let dx = [-1, -2, -1, -2, 1, 2, 2, 1]
    let dy = [-2, -1, 2, 1, -2, -1, 1, 2]
    
    for _ in 0..<n {
        let size = Int(String(readLine()!))!
        let start = readLine()!.split(separator: " ").map({Int(String($0))!})
        let end = readLine()!.split(separator: " ").map({Int(String($0))!})
        
        let queue = Queue([[Int]]())
        // 시작점과 몇 번 움직인 것인지를 나타낼 값을 같이 queue에 넣습니다.
        queue.push(start + [0])
        // 방문 여부를 표시할 배열
        var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: size), count: size)
        // 시작 점은 방문했다고 표시합니다
        visited[start[0]][start[1]] = true
        
        if start == end {
            print(0)
            continue
        }
        
        while(!queue.isEmpty) {
            let now = queue.pop()!
            let position = [now[0], now[1]]
            let times = now[2]
            // 만약 현재 위치와 도착 위치가 같다면 현재 이동횟수를 출력하고 반복을 종료합니다.
            if position == end {
                print(times)
                break
            }
            for i in 0..<8 {
                let newX = position[1] + dx[i]
                let newY = position[0] + dy[i]
                
                if newX >= size || newY >= size || newX < 0 || newY < 0 {
                    continue
                } else if !visited[newY][newX]{
                    queue.push([newY, newX, times+1])
                    visited[newY][newX] = true
                }
            }
        }
    }
    
}

solution()
