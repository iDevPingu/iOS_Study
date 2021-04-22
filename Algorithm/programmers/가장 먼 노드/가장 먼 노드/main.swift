//
//  main.swift
//  가장 먼 노드
//
//  Created by Ick on 2021/04/23.
//

import Foundation

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
func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph = [[Int]](repeating: [], count: n+1)
    for i in 0..<edge.count {
        graph[edge[i][0]].append(edge[i][1])
        graph[edge[i][1]].append(edge[i][0])
    }
    
    var edgeCount = [Int](repeating: -1, count: n)
    edgeCount[0] = 0
    let queue = Queue([[Int]]())
    queue.push([1,0])
    
    while !queue.isEmpty {
        let now = queue.pop()!
        for i in 0..<graph[now[0]].count {
            if edgeCount[graph[now[0]][i] - 1] == -1 {
                edgeCount[graph[now[0]][i] - 1] = now[1] + 1
                queue.push([graph[now[0]][i], now[1] + 1])
            }
        }
    }
    print(edgeCount)
    let maxValue = edgeCount.max()!
    var result: Int = 0
    for i in 0..<edgeCount.count {
        if edgeCount[i] == maxValue {
            result += 1
        }
    }
    return result
}
print(solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]))
