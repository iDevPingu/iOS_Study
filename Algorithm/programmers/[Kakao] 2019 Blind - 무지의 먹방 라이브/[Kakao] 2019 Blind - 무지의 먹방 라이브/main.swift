//
//  main.swift
//  [Kakao] 2019 Blind - 무지의 먹방 라이브
//
//  Created by Ick on 2021/04/19.
//

import Foundation
// Made By Pingu
class Heap<T: Comparable> {
    var heapArray: [T]
    var root: T? {
        if !isHeap {
            if isMaxHeap {
                maxHeapify()
            } else {
                minHeapify()
            }
            isHeap = true
        }
        return heapArray.first
    }
    var count: Int {
        return heapArray.count
    }
    var isEmpty: Bool {
        return heapArray.isEmpty
    }
    var isMaxHeap: Bool
    var isHeap: Bool = false
    init(_ n: [T], isMaxHeap: Bool) {
        heapArray = n
        self.isMaxHeap = isMaxHeap
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
        if !isHeap {
            if isMaxHeap {
                maxHeapify()
            } else {
                minHeapify()
            }
        } else {
            isHeap = false
        }
        if !heapArray.isEmpty {
            let temp = heapArray[heapArray.count - 1]
            heapArray[heapArray.count - 1] = heapArray[0]
            heapArray[0] = temp
        }
        
        let rootValue = heapArray.popLast()
        
        return rootValue
    }
    func push(_ n: T) {
        heapArray.append(n)
    }
}

class Food: Comparable {
    var food: Int
    var index: Int
    
    init(food: Int, index: Int) {
        self.food = food
        self.index = index
    }
    
    static func < (lhs: Food, rhs: Food) -> Bool {
        return lhs.food < rhs.food
    }
    static func == (lhs: Food, rhs: Food) -> Bool {
        return lhs.index == rhs.index
    }
}

func solution(_ food_times:[Int], _ k:Int64) -> Int {
    guard food_times.reduce(0, +) > k else {
        return -1
    }
    let priorityQueue = Heap([Food](), isMaxHeap: false)
    for index in 0..<food_times.count {
        priorityQueue.push(Food(food: food_times[index], index: index))
    }
    
    var time: Int64 = k
    var cycle: Int = 0
    
    while let root = priorityQueue.root,
          (root.food - cycle) * (priorityQueue.count) <= time {
        root.food -= cycle
        cycle += root.food
        time -= Int64(root.food * (priorityQueue.count))
        _ = priorityQueue.popRoot()
    }
    
    var leftFood = priorityQueue.heapArray
    leftFood.sort { (f1, f2) -> Bool in
        return f1.index < f2.index
    }
    
    time %= Int64(leftFood.count)

    return leftFood[Int(time)].index + 1
}

func solution2(_ food_times: [Int], _ k: Int64) -> Int {
    var foodList = food_times.enumerated().sorted { $0.element < $1.element }
    // 시간
    let k = Int(k)
    // 현재 지난 시간
    var total = 0
    //
    var index = 0
    // 지금까지 먹은 음식의 사이클 수라고 보면 됨 (예를 들어 이 값이 3일때 55인 값에 남은 음식 수는 52)
    var prevTime = 0
    
    while index < foodList.count {
        // 이번턴에 음식에 사용할 시간
        let toBeElasped = (foodList.count - index) * (foodList[index].element - prevTime)
        if total + toBeElasped <= k {
            total += toBeElasped
            prevTime = foodList[index].element
            foodList[index].element = 0
            index += 1
        } else {
            let toEat = (k - total) % (foodList.count - index)
            return foodList.filter( { $0.element != 0 }).sorted(by: { $0.offset < $1.offset })[toEat].offset + 1
        }
    }
    
    return -1
}
print(solution2([3,1,2], 5)) // 1
print(solution2([8,6,4], 15)) // 2
print(solution2([946, 314, 757, 322, 559, 647, 983, 482, 145], 1833)) // 1
print(solution2([1,1,1], 3))

let heap = Heap([946, 314, 757, 322, 559, 647, 983, 482, 145], isMaxHeap: false)

print(heap.popRoot())
print(heap.popRoot())
print(heap.popRoot())
print(heap.popRoot())
print(heap.popRoot())
print(heap.popRoot())
print(heap.popRoot())
print(heap.popRoot())
