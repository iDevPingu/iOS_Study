//
//  main.swift
//  10845 - 큐
//
//  Created by Ick on 2021/04/02.
//

import Foundation

class Queue<T> {
    var enqueue: [T]
    var dequeue: [T] = []
    
    var size: Int {
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
    
    init(_ n: [T]) {
        enqueue = n
    }
    func pop() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue = []
        }
        return dequeue.popLast()
    }
    func push(_ n: T) {
        enqueue.append(n)
    }
    
}
func solution() {
    let n = Int(String(readLine()!))!
    
    let queue = Queue([Int]())
    
    for _ in 0..<n {
        let line = readLine()!.split(separator: " ").map({String($0)})
        let op = line[0]
        if op == "push" {
            let num = Int(String(line[1]))!
            queue.push(num)
        } else if op == "front" {
            if !queue.isEmpty {
                print(queue.first!)
            } else {
                print(-1)
            }
        } else if op == "back" {
            if !queue.isEmpty {
                print(queue.last!)
            } else {
                print(-1)
            }
        } else if op == "size" {
            print(queue.size)
        } else if op == "empty" {
            if queue.isEmpty {
                print(1)
            } else {
                print(0)
            }
        } else if op == "pop" {
            if queue.isEmpty {
                print(-1)
            } else {
                print(queue.pop()!)
            }
        }
    }
}
solution()
