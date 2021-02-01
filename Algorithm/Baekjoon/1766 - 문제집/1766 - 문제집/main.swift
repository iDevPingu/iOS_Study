//
//  main.swift
//  1766 - 문제집
//
//  Created by Ick on 2021/01/06.
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

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let m = firstLine[1]
    
    var graph: [Int: [Int]] = [:]
    var forCount: [Int: [Int]] = [:]
    
    for i in 1...n {
        graph[i] = []
        forCount[i] = []
    }
    
    for _ in 0..<m{
        let info = readLine()!.split(separator: " ").map({Int(String($0))!})
        graph[info[1]]!.append(info[0])
        forCount[info[0]]!.append(info[1])
    }

    var result: [Int] = []
    var temp: [Int] = [Int](repeating: 0, count: n+1)
    
    for key in graph.keys {
        temp[Int(key)] = graph[key]!.count
    }
    
    while (result.count != n) {
        for i in 1...n{
            if temp[i] == 0 {
                temp[i] -= 1
                result.append(i)
                for j in forCount[i]! {
                    temp[j] -= 1
                }
                break
            }
        }

    }

    var answer = ""
    for i in 0..<result.count-1 {
        answer += "\(result[i]) "
    }
    answer += "\(result.last!)"
    print(answer)
}

solution()
