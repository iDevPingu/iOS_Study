//
//  main.swift
//  1707 - 이분 그래프
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
    let k = Int(String(readLine()!))!
    
    for _ in 0..<k {
        let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
        let v = firstLine[0]
        let e = firstLine[1]
        
        var graph = [[[Int]]](repeating: [[Int]](), count: v+1)

        var visited: [Int] = [Int](repeating: 0, count: v+1)
        
        for _ in 0..<e {
            let line = readLine()!.split(separator: " ").map({Int(String($0))!})
            graph[line[0]].append([line[0], line[1]])
            graph[line[1]].append([line[1], line[0]])
        }
        
        let queue = Queue([[Int]]())
        for i in graph[1] {
            queue.push(i)
        }
        visited[1] = 1
        var count = 0
        while !queue.isEmpty {
            let now = queue.pop()!
            
            let front = now[0]
            let end = now[1]
            
            // 아직 방문 안한거
            if visited[end] == 0 {
                if visited[front] == 1 {
                    visited[end] = 2
                } else if visited[front] == 2 {
                    visited[end] = 1
                }
                for i in graph[end] {
                    queue.push(i)
                }
            } else {
                if visited[front] == visited[end] {
                    print("NO")
                    count += 1
                    break
                }
            }
        }
        if count == 0 {
            print("YES")
        }
        
    }
}

solution()
