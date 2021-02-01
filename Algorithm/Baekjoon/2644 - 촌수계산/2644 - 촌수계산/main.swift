//
//  main.swift
//  2644 - 촌수계산
//
//  Created by Ick on 2021/01/11.
//

import Foundation

func dfsSolution() {
    let n = Int(readLine()!)!
    let secondLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let m = Int(readLine()!)!
    
    let inf = 77777777
    var graph: [Int: [[Int]]] = [:]
    for i in 1...n {
        graph[i] = []
    }
    
    for _ in 0..<m{
        let info = readLine()!.split(separator: " ").map({Int(String($0))!})
        graph[info[0]]!.append([info[0], info[1]])
        graph[info[1]]!.append([info[1], info[0]])
    }
    
    var isVisited: [Int] = [Int](repeating: inf, count: n+1)
    isVisited[secondLine[0]] = 0
    var stack = graph[secondLine[0]]!
    
    while !stack.isEmpty {
        let now = stack.popLast()!
        if isVisited[now[1]] > isVisited[now[0]] + 1 {
            stack += graph[now[1]]!
            isVisited[now[1]] = isVisited[now[0]] + 1
        }
    }

    if isVisited[secondLine[1]] == inf {
        print(-1)
    } else {
        print(isVisited[secondLine[1]])
    }
    
}
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

func bfsSolution() {
    let n = Int(readLine()!)!
    let secondLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let m = Int(readLine()!)!
    
    let inf = 77777777
    var graph: [Int: [[Int]]] = [:]
    for i in 1...n {
        graph[i] = []
    }
    
    for _ in 0..<m{
        let info = readLine()!.split(separator: " ").map({Int(String($0))!})
        graph[info[0]]!.append([info[0], info[1]])
        graph[info[1]]!.append([info[1], info[0]])
    }
    
    var isVisited: [Int] = [Int](repeating: inf, count: n+1)
    isVisited[secondLine[0]] = 0
    let queue = Queue([[[Int]]]())
    queue.push(graph[secondLine[0]]!)
    
    while !queue.isEmpty {
        let now = queue.pop()!
        
        for i in 0..<now.count {
            if now[i][1] == secondLine[1] {
                if isVisited[now[i][1]] < isVisited[now[i][0]] + 1 {
                    print(isVisited[now[i][1]])
                    return
                } else {
                    print(isVisited[now[i][0]] + 1)
                    return
                }
            }
            if isVisited[now[i][1]] > isVisited[now[i][0]] + 1 {
                isVisited[now[i][1]] = isVisited[now[i][0]] + 1
                queue.push(graph[now[i][1]]!)
            }
        }
    }
    print(-1)
}
//dfsSolution()
bfsSolution()
