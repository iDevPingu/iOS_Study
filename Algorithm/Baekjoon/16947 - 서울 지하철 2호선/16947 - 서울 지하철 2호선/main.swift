//
//  main.swift
//  16947 - 서울 지하철 2호선
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
func solution() {
    let n = Int(String(readLine()!))!
    
    var graph: [Int: [Int]] = [:]
    for _ in 0..<n {
        let data = readLine()!.split(separator: " ").map({Int(String($0))!})
        if let value = graph[data[0]] {
            graph[data[0]] = value + [data[1]]
        } else {
            graph[data[0]] = [data[1]]
        }
        
        if let value = graph[data[1]] {
            graph[data[1]] = value + [data[0]]
        } else {
            graph[data[1]] = [data[0]]
        }
    }
    
    var visited = [Bool](repeating: false, count: n+1)
    
    var circularPath: [Int] = []
    var isAlreadyCome: Bool = false
    func getCircularPath(start: Int, next: Int, nowPath: [Int]) {
        if start == next && isAlreadyCome {
            circularPath = nowPath
            return
        } else if start == next && nowPath.count != 1 {
            isAlreadyCome = true
        }
        
        guard let temp = graph[next] else { return }
        for i in 0..<temp.count {
            if !visited[temp[i]] {
                visited[temp[i]] = true
                getCircularPath(start: start, next: temp[i], nowPath: nowPath + [temp[i]])
                visited[temp[i]] = false
            }
            if !circularPath.isEmpty {
                return
            }
        }
    }
    
    for i in 1...n {
        if circularPath.isEmpty {
            
            isAlreadyCome = false
            getCircularPath(start: i, next: i, nowPath: [i])
        } else {
            break
        }
    }
    
    
    let queue = Queue([Int]())
    var result: [String] = []
    
    for i in 1...n {
        if circularPath.contains(i) {
            result.append(String(0))
        } else {
            var count = 0
            visited = [Bool](repeating: false, count: n+1)
            queue.push(i)
            visited[i] = true
            while !queue.isEmpty {
                count += 1
                for _ in 0..<queue.count {
                    let now = queue.pop()!
                    guard let temp = graph[now] else { continue }
                    for i in 0..<temp.count {
                        if circularPath.contains(temp[i]) {
                            queue.removeAll()
                            break
                        } else {
                            if !visited[temp[i]] {
                                visited[temp[i]] = true
                                queue.push(temp[i])
                            }
                        }
                    }
                    if queue.isEmpty {
                        break
                    }
                }
            }

            result.append(String(count))
        }
    }
    
    print(result.joined(separator: " "))
}
solution()
