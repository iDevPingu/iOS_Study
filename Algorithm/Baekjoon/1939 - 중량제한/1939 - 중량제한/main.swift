//
//  main.swift
//  1939 - 중량제한
//
//  Created by Ick on 2021/03/09.
//

import Foundation

// Mady By Pingu
class Queue<T: Equatable> {
    var enqueue: [T]
    var dequeue: [T] = []
    var count: Int {
        return enqueue.count + dequeue.count
    }
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    var first: T? {
        if dequeue.isEmpty {
            return enqueue.first
        } else {
            return dequeue.last
        }
    }
    var last: T? {
        if enqueue.isEmpty {
            return dequeue.first
        } else {
            return enqueue.last
        }
    }
    init(_ queue: [T]) {
        enqueue = queue
    }
    func push(_ n: T) {
        enqueue.append(n)
    }
    func pop() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
    func removeAll() {
        enqueue.removeAll()
        dequeue.removeAll()
    }
    func contains(_ n: T) -> Bool {
        return enqueue.contains(n) || dequeue.contains(n)
    }
}

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let m = firstLine[1]
    
    var graph: [[[Int]]] = [[[Int]]](repeating: [], count: n+1)
    
    for _ in 0..<m {
        let data = readLine()!.split(separator: " ").map({Int(String($0))!})
        let a = data[0], b = data[1], c = data[2]
        // 다리는 양방향이라고 했기 때문에
        graph[a].append([b,c])
        graph[b].append([a,c])
    }
    let lastLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let from = lastLine[0]
    let to = lastLine[1]
    
    var visited: [Bool] = []
    
    let queue = Queue([Int]())
    
    // 목적지에 도착할 수 있는가에 대한 여부
    func bfs(_ w: Int) -> Bool {
        while !queue.isEmpty {
            let now = queue.pop()!
            if now == to {
                return true
            }
            for i in 0..<graph[now].count {
                let next = graph[now][i][0]
                let weight = graph[now][i][1]
                if !visited[next] && w <= weight {
                    queue.push(next)
                    visited[next] = true
                }
            }
        }
        return false
    }
    
    var result = 0
    
    func binarySearch() {
        var left = 1
        var right = 1000000000
        
        while left <= right {
            
            let mid = (left + right) / 2
            visited = [Bool](repeating: false, count: n+1)
            visited[from] = true
            queue.removeAll()
            queue.push(from)
            // 해당 값으로 목적지에 도착할 수 있다면
            if bfs(mid) {
                result = max(result, mid)
                left = mid + 1
            } else {
                // 현재 중간 값으로 목적지에 갈 수 없음
                right = mid - 1
            }
        }
    }
    
    binarySearch()
    
    print(result)
}
solution()

