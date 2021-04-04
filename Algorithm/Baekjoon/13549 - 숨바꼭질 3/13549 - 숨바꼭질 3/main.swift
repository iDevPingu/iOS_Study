//
//  main.swift
//  13549 - 숨바꼭질 3
//
//  Created by Ick on 2020/11/13.
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

func solution() -> Int {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0], k = firstLine[1]
    let maxPosition = 100001
    var visitedTime = [Int](repeating: 100001, count: maxPosition + 1)
    visitedTime[n] = 0
    let queue = Queue([[n, 0]])
    
    while !queue.isEmpty {
        let now = queue.pop()!
        let nowPosition = now[0], nowTime = now[1]
        
        if nowPosition == k {
            return visitedTime[k]
        }
        if nowPosition * 2 <= maxPosition && visitedTime[nowPosition * 2] > nowTime {
            visitedTime[nowPosition * 2] = nowTime
            queue.push([nowPosition * 2, nowTime])
        }
        if nowPosition + 1 <= maxPosition && visitedTime[nowPosition + 1] > nowTime + 1 {
            visitedTime[nowPosition + 1] = nowTime + 1
            queue.push([nowPosition + 1, nowTime + 1])
        }
        if nowPosition - 1 >= 0 && visitedTime[nowPosition - 1] > nowTime + 1 {
            visitedTime[nowPosition - 1] = nowTime + 1
            queue.push([nowPosition - 1, nowTime + 1])
        }
    }
    return 0
}

print(solution())
