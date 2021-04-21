//
//  main.swift
//  279 - Perfect Squares
//
//  Created by Ick on 2021/04/21.
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
class Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.count == rhs.count && lhs.sum == rhs.sum
    }
    
    var count: Int
    var sum: Int
    init(count: Int, sum: Int) {
        self.count = count
        self.sum = sum
    }
}
class Solution {
    func numSquares(_ n: Int) -> Int {
        var squares: [Int] = []
        let sqrtN = Int(Double(n).squareRoot())
        for i in 1...sqrtN {
            squares.append(i*i)
        }
        squares.sort(by: >)
        if squares.contains(n) {
            return 1
        }
        
        let queue = Queue([Node]())
        var visited: [Bool] = [Bool](repeating: false, count: n+1)
        for i in 0..<squares.count {
            queue.push(Node(count: 1, sum: squares[i]))
        }
        
        while !queue.isEmpty {
            let now = queue.pop()!
            if now.sum == n {
                return now.count
            } else if now.sum > n {
                continue
            }
            visited[now.sum] = true
            
            for i in 0..<squares.count {
                if now.sum + squares[i] == n {
                    return now.count + 1
                }
                if now.sum + squares[i] > n {
                    continue
                } else {
                    if !visited[now.sum + squares[i]] {
                        queue.push(Node(count: now.count + 1, sum: now.sum + squares[i]))
                    }
                }
            }
        }
        
        return n
    }
}
let a = Solution()
print(a.numSquares(12))
print(a.numSquares(13))
print(a.numSquares(44))
print(a.numSquares(99))
print(a.numSquares(7168))
