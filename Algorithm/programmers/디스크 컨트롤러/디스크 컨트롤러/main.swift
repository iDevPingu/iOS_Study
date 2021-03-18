//
//  main.swift
//  디스크 컨트롤러
//
//  Created by Ick on 2021/03/17.
//

import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var queue = jobs
    let readyWork = Heap([Job](), isMaxHeap: false)
    
    queue.sort { (a, b) -> Bool in
        return a[0] < b[0]
    }
    
    var time: Int = 0
    var result: Int = 0
    while !queue.isEmpty || !readyWork.isEmpty {
        var until: Int = 0
        for i in 0..<queue.count {
            if queue[i][0] <= time {
                readyWork.push(Job(queue[i][0], queue[i][1]))
                until = i + 1
            } else {
                break
            }
        }
        for _ in 0..<until {
            queue.removeFirst()
        }
        
        guard let nextJob = readyWork.popRoot() else {
            time += 1
            continue
        }
        result += (nextJob.processTime + (time - nextJob.getTime))
        time += nextJob.processTime
    }
    
    result /= jobs.count
    return result
}
print(solution([[0, 3], [1, 9], [2, 6]]))
class Job: Comparable {
    static func < (lhs: Job, rhs: Job) -> Bool {
        return lhs.processTime < rhs.processTime
    }
    
    static func == (lhs: Job, rhs: Job) -> Bool {
        return (lhs.getTime == rhs.getTime) && (lhs.processTime == rhs.processTime)
    }
    
    let getTime: Int
    let processTime: Int
    init(_ get: Int, _ process: Int) {
        self.getTime = get
        self.processTime = process
    }
    
}
// Made By Pingu
class Heap<T: Comparable> {
    var heapArray: [T]
    var count: Int {
        return heapArray.count
    }
    var isEmpty: Bool {
        return heapArray.isEmpty
    }
    var isMaxHeap: Bool
    
    init(_ n: [T], isMaxHeap: Bool) {
        heapArray = n
        self.isMaxHeap = isMaxHeap
        if isMaxHeap {
            maxHeapify()
        } else {
            minHeapify()
        }
    }
    func isLeftChildExist(_ parent: Int) -> Bool {
        if parent * 2 + 1 >= count {
            return false
        } else {
            return true
        }
    }
    func isRightChildExist(_ parent: Int) -> Bool {
        if parent * 2 + 2 >= count {
            return false
        } else {
            return true
        }
    }
    func parentIndex(_ child: Int) -> Int {
        return child / 2
    }
    func leftChildIndex(_ parent: Int) -> Int {
        return parent * 2 + 1
    }
    func rightChildIndex(_ parent: Int) -> Int {
        return parent * 2 + 2
    }
    func maxHeapify() {
        isMaxHeap = true
        var i = count / 2
        while i >= 0 {
            var bigChild: Int = 0
            if isLeftChildExist(i) && isRightChildExist(i) {
                if heapArray[leftChildIndex(i)] <= heapArray[rightChildIndex(i)] {
                    bigChild = rightChildIndex(i)
                } else {
                    bigChild = leftChildIndex(i)
                }
            } else if isLeftChildExist(i) && !isRightChildExist(i) {
                bigChild = leftChildIndex(i)
            } else if !isLeftChildExist(i) && !isRightChildExist(i) {
                i -= 1
                continue
            }
            
            if heapArray[bigChild] >= heapArray[i] {
                let temp = heapArray[bigChild]
                heapArray[bigChild] = heapArray[i]
                heapArray[i] = temp
            }
            i -= 1
        }
    }
    func minHeapify() {
        isMaxHeap = false
        var i = count / 2
        while i >= 0 {
            var smallChild: Int = 0
            if isLeftChildExist(i) && isRightChildExist(i) {
                if heapArray[leftChildIndex(i)] >= heapArray[rightChildIndex(i)] {
                    smallChild = rightChildIndex(i)
                } else {
                    smallChild = leftChildIndex(i)
                }
            } else if isLeftChildExist(i) && !isRightChildExist(i) {
                smallChild = leftChildIndex(i)
            } else if !isLeftChildExist(i) && !isRightChildExist(i) {
                i -= 1
                continue
            }
            
            if heapArray[smallChild] <= heapArray[i] {
                let temp = heapArray[smallChild]
                heapArray[smallChild] = heapArray[i]
                heapArray[i] = temp
            }
            i -= 1
        }
    }
    func popRoot() -> T? {
        if !heapArray.isEmpty {
            let temp = heapArray[heapArray.count - 1]
            heapArray[heapArray.count - 1] = heapArray[0]
            heapArray[0] = temp
        }
        let rootValue = heapArray.popLast()
        if isMaxHeap {
            maxHeapify()
        } else {
            minHeapify()
        }
        return rootValue
    }
    func push(_ n: T) {
        heapArray.append(n)
        if isMaxHeap {
            maxHeapify()
        } else {
            minHeapify()
        }
    }
}
