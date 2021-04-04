//
//  main.swift
//  13913 - 숨바꼭질 4
//
//  Created by Ick on 2021/04/02.
//

import Foundation
class Queue<T>{
    var enqueue: [T]
    var dequeue: [T] = []
    
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    var count: Int {
        return enqueue.count + dequeue.count
    }
    
    init(_ queue:[T]) {
        self.enqueue = queue
    }
    
    func push(_ n: T) {
        enqueue.append(n)
    }
    
    func pop() -> T? {
        if dequeue.isEmpty{
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
    func removeAll() {
        enqueue.removeAll()
        dequeue.removeAll()
    }
}
func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0], k = firstLine[1]
    
    let queue = Queue([n])
    var visited = [Bool](repeating: false, count: 100001)
    var route = [Int](repeating: 0, count: 100001)
    visited[n] = true
    route[n] = n
    var result: [Int] = []
    while !queue.isEmpty {
        let nowPosition = queue.pop()!
        
        if nowPosition == k {
            break
        }
        
        if nowPosition * 2 <= 100000 && !visited[nowPosition * 2] {
            visited[nowPosition * 2] = true
            route[nowPosition * 2] = nowPosition
            queue.push(nowPosition * 2)
        }
        if nowPosition - 1 >= 0 && !visited[nowPosition - 1] {
            visited[nowPosition - 1] = true
            route[nowPosition - 1] = nowPosition
            queue.push(nowPosition - 1)
        }
        if nowPosition + 1 <= 100000 && !visited[nowPosition + 1] {
            visited[nowPosition + 1] = true
            route[nowPosition + 1] = nowPosition
            queue.push(nowPosition + 1)
        }
    }
    
    var traking = k
    while traking != n {
        result.append(traking)
        traking = route[traking]
    }
    result.append(n)
    
    print(result.count - 1)
    
    var path: String = ""
    for num in result.reversed() {
        path += "\(num) "
    }
    print(path)
    
}
solution()
