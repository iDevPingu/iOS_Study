//
//  main.swift
//  5014 - 스타트링크
//
//  Created by Ick on 2021/03/14.
//

import Foundation
class Queue<T> {
    var enqueue: [T]
    var dequeue: [T] = []
    var count: Int {
        return enqueue.count + dequeue.count
    }
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    init(_ n: [T]) {
        enqueue = n
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
}
func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    // 옥상
    let f = firstLine[0]
    // 출발층
    let s = firstLine[1]
    // 도착층
    let g = firstLine[2]
    // 업버튼
    let u = firstLine[3]
    // 다운버튼
    let d = firstLine[4]
    var visited: [Bool] = [Bool](repeating: false, count: f+1)
    visited[s] = true
    let queue = Queue([(s, 0)])
    var result: Int = -1
    while !queue.isEmpty {
        let now = queue.pop()!
//        let nowFloor = now.0
//        let nowTime = now.1
        if now.0 == g {
            result = now.1
            break
        }
        if now.0 + u <= f {
            if !visited[now.0 + u] {
                visited[now.0 + u] = true
                queue.push((now.0 + u, now.1 + 1))
            }
        }
        if now.0 - d >= 1 {
            if !visited[now.0 - d] {
                visited[now.0 - d] = true
                queue.push((now.0 - d, now.1 + 1))
            }
        }
    }
    if result != -1 {
        print(result)
    } else {
        print("use the stairs")
    }
}

solution()
