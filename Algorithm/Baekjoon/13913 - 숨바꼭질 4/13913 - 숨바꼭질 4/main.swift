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
    func removeAll() {
        enqueue.removeAll()
        dequeue.removeAll()
    }
}
func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0], k = firstLine[1]
    
    let queue = Queue([[[n],[n]]])
    var visited = [Bool](repeating: false, count: 100001)
    var result: [Int] = []
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            if queue.isEmpty {
                break
            }
            let nowData = queue.pop()!
            let nowPosition = nowData[0][0]
            visited[nowPosition] = true
            if nowPosition > k {
                if nowPosition - 1 == k {
                    result = nowData[1] + [nowPosition - 1]
                    queue.removeAll()
                    break
                } else {
                    if nowPosition - 1 >= 0 && nowPosition - 1 <= 100000 && !visited[nowPosition - 1] {
                        queue.push([[nowPosition - 1], nowData[1] + [nowPosition - 1]])
                        break
                    }
                }
            } else {
                for i in 0..<3 {
                    switch i {
                    case 0:
                        let nextPosition = nowPosition + 1
                        if nextPosition == k {
                            result = nowData[1] + [nextPosition]
                            queue.removeAll()
                            break
                        }
                        if nextPosition >= 0 && nextPosition <= 100000 && !visited[nextPosition] {
                            queue.push([[nextPosition], nowData[1] + [nextPosition]])
                        }
                    case 1:
                        let nextPosition = nowPosition - 1
                        if nextPosition == k {
                            result = nowData[1] + [nextPosition]
                            queue.removeAll()
                            break
                        }
                        if nextPosition >= 0 && nextPosition <= 100000 && !visited[nextPosition] {
                            queue.push([[nextPosition], nowData[1] + [nextPosition]])
                        }
                    case 2:
                        let nextPosition = nowPosition * 2
                        if nextPosition == k {
                            result = nowData[1] + [nextPosition]
                            queue.removeAll()
                            break
                        }
                        if nextPosition >= 0 && nextPosition <= 100000 && !visited[nextPosition] {
                            queue.push([[nextPosition], nowData[1] + [nextPosition]])
                        }
                    default:
                        continue
                    }
                }
            }
        }
    }
    print(result.count - 1)
    var path: String = ""
    for num in result {
        path += "\(num) "
    }
    print(path)
    
}
solution()
