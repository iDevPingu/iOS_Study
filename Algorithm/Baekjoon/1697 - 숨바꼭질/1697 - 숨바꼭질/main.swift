//
//  main.swift
//  1697 - 숨바꼭질
//
//  Created by Ick on 2020/09/08.
//  Copyright © 2020 ick. All rights reserved.
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

func solution() -> Int{
    let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
    let n = firstLine[0]
    let k = firstLine[1]
    
    var result = 0
    if n == k {
        return 0
    }
    
    let queue: Queue = Queue([n])
    var visited: [Int] = [Int](repeating: 0, count: 100001)
    
    while queue.count != 0{
        result += 1
        for _ in 0..<queue.count{
            guard let nowPosition = queue.pop() else { fatalError() }
            visited.append(nowPosition)
            visited[nowPosition] = 1
            if nowPosition > k {
                let a = nowPosition - 1
                if a >= 0 && a <= 100000{
                    if visited[a] == 0{
                        if a == k{
                            return result
                        }
                        queue.push(a)
                    }
                }
                
            } else {
                for i in 0..<3{
                    switch i {
                    case 0:
                        let a = nowPosition - 1
                        if a >= 0 && a <= 100000{
                            if visited[a] == 0{
                                if a == k{
                                    return result
                                }
                                queue.push(a)
                            }
                        }
                        
                    case 1:
                        let a = nowPosition + 1
                        if a >= 0 && a <= 100000{
                            if visited[a] == 0{
                                if a == k{
                                    return result
                                }
                                queue.push(a)
                            }
                        }
                    case 2:
                        let a = nowPosition * 2
                        if a >= 0 && a <= 100000{
                            if visited[a] == 0{
                                if a == k{
                                    return result
                                }
                                queue.push(a)
                            }
                        }
                    default:
                        continue
                    }
                }
            }
        }
    }
    return result
}

print(solution())

