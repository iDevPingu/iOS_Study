//
//  main.swift
//  207 - Course Schedule
//
//  Created by Ick on 2021/03/05.
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
            dequeue = enqueue.reversed()
            enqueue = []
        }
        return dequeue.popLast()
    }
}

class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        if prerequisites.isEmpty {
            return true
        }
        var matrix: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: numCourses), count: numCourses)
        var inDegree: [Int] = [Int](repeating: 0, count: numCourses)
        var count: Int = 0
        for i in 0..<prerequisites.count {
            let task = prerequisites[i][0]
            let haveToDo = prerequisites[i][1]
            if matrix[haveToDo][task] == 0 {
                inDegree[task] += 1
            }
            matrix[haveToDo][task] = 1
        }
        
        let queue: Queue = Queue([Int]())
        
        for i in 0..<numCourses {
            if inDegree[i] == 0 {
                queue.push(i)
            }
        }
        
        while !queue.isEmpty {
            let course = queue.pop()!
            count += 1
            for i in 0..<numCourses {
                if matrix[course][i] != 0 {
                    inDegree[i] -= 1
                    if inDegree[i] == 0 {
                        queue.push(i)
                    }
                }
            }
        }
        
        return count == numCourses
    }
}
let a = Solution()
//print(a.canFinish(2, [[1,0]]))
//print(a.canFinish(2, [[1,0], [0,1]]))
//print(a.canFinish(3, [[1,0],[1,2],[0,1]]))
print(a.canFinish(5, [[1,4],[2,4],[3,1],[3,2]]))
