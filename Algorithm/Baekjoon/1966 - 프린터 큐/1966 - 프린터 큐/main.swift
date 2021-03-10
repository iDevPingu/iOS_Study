//
//  main.swift
//  1966 - 프린터 큐
//
//  Created by Ick on 2021/03/07.
//

import Foundation

class Queue<T> {
    var enqueue: [T]
    var dequeue: [T] = []
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    var count: Int {
        return enqueue.count + dequeue.count
    }
    init(_ n: [T]) {
        enqueue = n
    }
    func push(_ n: T) {
        enqueue.append(n)
    }
    func pop() -> T? {
        if dequeue.isEmpty {
            enqueue.reverse()
            dequeue = enqueue
            enqueue.removeAll()
        }
        
        return dequeue.popLast()
    }
}
func solution() {
    let n = Int(readLine()!)!
    for _ in 0..<n {
        let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
        let n = firstLine[0]
        let m = firstLine[1]
        var priorityCount: [Int: Int] = [:]
        var max: Int = 0
        var result: Int = 0
        var priority = readLine()!.split(separator: " ").map { (job) -> [Int] in
            let jobPriority = Int(job)!
            
            if let _ = priorityCount[jobPriority] {
                priorityCount[jobPriority]! += 1
            } else {
                priorityCount[jobPriority] = 1
            }
            
            if max < jobPriority {
                max = jobPriority
            }
            
            return [Int(job)!, 0]
        }
        // 목표 작업 표시
        priority[m][1] = 1
        let queue = Queue(priority)
        
        while !queue.isEmpty {
            let nowJob = queue.pop()!
            if nowJob[0] == max {
                if nowJob[1] == 1 {
                    result += 1
                    break
                } else {
                    if let _ = priorityCount[nowJob[0]] {
                        priorityCount[nowJob[0]]! -= 1
                        if priorityCount[nowJob[0]]! == 0 {
                            priorityCount[nowJob[0]] = nil
                            max = 0
                            for i in priorityCount.keys {
                                if max < i {
                                    max = i
                                }
                            }
                        }
                    }
                    result += 1
                }
            } else {
                queue.push(nowJob)
            }
        }
        print(result)
    }
}

solution()
