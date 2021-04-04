//
//  main.swift
//  14226 - 이모티콘
//
//  Created by Ick on 2021/04/04.
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

func solution() -> Int {
    let s = Int(String(readLine()!))!
    
    var alreadyMake = [[Int]](repeating: [], count: 2001)
    alreadyMake[1].append(0)
    
    // 현재 이모티콘 개수, 클립보드에 복사된 이모티콘 개수
    let queue = Queue([[1, 0]])
    var time: Int = 0
    while !queue.isEmpty {
        
        for _ in 0..<queue.count {
            let now = queue.pop()!
            let nowCount = now[0]
            let nowClipBoard = now[1]
            
            if nowCount == s {
                return time
            }
            
            if nowCount - 1 >= 0 && !alreadyMake[nowCount - 1].contains(nowClipBoard) {
                alreadyMake[nowCount - 1].append(nowClipBoard)
                queue.push([nowCount - 1, nowClipBoard])
            }
            if nowCount + nowClipBoard <= 2000 && !alreadyMake[nowCount + nowClipBoard].contains(nowClipBoard) {
                alreadyMake[nowCount + nowClipBoard].append(nowClipBoard)
                queue.push([nowCount + nowClipBoard, nowClipBoard])
            }
            // 현재 것을 복사
            queue.push([nowCount, nowCount])
        }
        time += 1
    }
    return time
}
print(solution())
