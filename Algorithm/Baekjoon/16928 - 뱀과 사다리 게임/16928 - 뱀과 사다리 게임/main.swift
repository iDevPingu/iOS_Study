//
//  main.swift
//  16928 - 뱀과 사다리 게임
//
//  Created by Ick on 2021/04/30.
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

func solution() -> Int {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0], m = firstLine[1]
    
    // 출발 : 도착
    var 사다리정보: [Int: Int] = [:]
    var 뱀정보: [Int: Int] = [:]
    
    var visited = [Bool](repeating: false, count: 101)
    
    for _ in 0..<n {
        let data = readLine()!.split(separator: " ").map({Int(String($0))!})
        사다리정보[data[0]] = data[1]
    }
    for _ in 0..<m {
        let data = readLine()!.split(separator: " ").map({Int(String($0))!})
        뱀정보[data[0]] = data[1]
    }
    
    let queue = Queue([[Int]]())
    
    // 현재 위치, 현재 위치에 도달하기까지 주사위 던진 횟수
    queue.push([1,0])
    visited[1] = true
    
    while !queue.isEmpty {
        let now = queue.pop()!
        for dice in 1...6 {
            let nextPosition = now[0] + dice
            if nextPosition >= 100 {
                return now[1] + 1
            }
            if visited[nextPosition] {
                continue
            } else {
                if let 사다리 = 사다리정보[nextPosition] {
                    visited[nextPosition] = true
                    queue.push([사다리, now[1] + 1])
                    continue
                }
                if let 뱀 = 뱀정보[nextPosition] {
                    visited[nextPosition] = true
                    queue.push([뱀, now[1] + 1])
                    continue
                }
                visited[nextPosition] = true
                queue.push([nextPosition, now[1] + 1])
            }
        }
    }
    return 0
}
print(solution())
