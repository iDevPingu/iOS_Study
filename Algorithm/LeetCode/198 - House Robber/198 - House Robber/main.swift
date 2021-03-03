//
//  main.swift
//  198 - House Robber
//
//  Created by Ick on 2021/03/04.
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
    init(_ queue: [T]) {
        self.enqueue = queue
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

class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        } else if nums.count == 1 {
            return nums[0]
        }
        let move: [Int] = [2, 3]
    
        var maxMoney: [Int] = [Int](repeating: 0, count: nums.count)
        maxMoney[0] = nums[0]
        maxMoney[1] = nums[1]
        // [현재 위치, 현재 값]
        let queue: Queue = Queue([[0, nums[0]], [1, nums[1]]])
        while !queue.isEmpty {
            let now = queue.pop()!
            if now[0] >= nums.count {
                continue
            }
            for i in 0..<move.count {
                let next = now[0] + move[i]
                if next >= nums.count {
                    continue
                } else {
                    if maxMoney[next] < now[1] + nums[next] {
                        maxMoney[next] = now[1] + nums[next]
                        queue.push([next, now[1] + nums[next]])
                    }
                }
            }
        }
        print(maxMoney)
        return maxMoney.max()!
    }
}
let a = Solution()
print(a.rob([1,2,3,1]))
print(a.rob([2,7,9,3,1]))
