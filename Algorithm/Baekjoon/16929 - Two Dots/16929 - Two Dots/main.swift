//
//  main.swift
//  16929 - Two Dots
//
//  Created by Ick on 2021/04/07.
//

import Foundation
class Queue<T> {
    var enqueue: [T]
    var dequeue: [T] = []
    
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
func solution() -> String {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0], m = firstLine[1]
    
    var gameBoard: [[String]] = []
    
    for _ in 0..<n {
        gameBoard.append(readLine()!.map({String($0)}))
    }
    
    var isCycle: Bool = false
    var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    let dx: [Int] = [0,0,-1,1]
    let dy: [Int] = [-1,1,0,0]
    
    let queue = Queue([(Int, Int, Int, Int)]())
    
    for i in 0..<n {
        for j in 0..<m {
            if !visited[i][j] {
                queue.push((i,j,0,0))
                visited[i][j] = true
                while !queue.isEmpty {
                    let nowData = queue.pop()!
                    let now = (nowData.0, nowData.1)
                    let before = (nowData.2, nowData.3)
                    
                    for i in 0..<4 {
                        let newX = now.1 + dx[i]
                        let newY = now.0 + dy[i]
                        
                        if newX < 0 || newY < 0 || newX >= m || newY >= n {
                            continue
                        } else {
                            if visited[newY][newX] {
                                if gameBoard[newY][newX] == gameBoard[now.0][now.1] && (newY, newX) != before {
                                    return "Yes"
                                }
                            } else {
                                if gameBoard[newY][newX] == gameBoard[now.0][now.1] {
                                    visited[newY][newX] = true
                                    queue.push((newY,newX,now.0,now.1))
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    return "No"
}
print(solution())
