//
//  main.swift
//  621 - Task Scheduler
//
//  Created by Ick on 2021/02/17.
//

import Foundation

class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        if n == 0 {
            return tasks.count
        }
        
        var count: [Int] = [Int](repeating: 0, count: 26)
        for task in tasks {
            count[Int(task.asciiValue!) - Int(Character("A").asciiValue!)] += 1
        }
        count.sort()
        var mostFrequentUniqueChars = 0
        let topFrequency = count[25]
        
        for i in 0..<26 where count[i] == topFrequency {
            mostFrequentUniqueChars += 1
        }
        print(mostFrequentUniqueChars)
        return max(tasks.count, (topFrequency - 1) * (n + 1) + mostFrequentUniqueChars)
    }
}
let a = Solution()
print(a.leastInterval(["A","A","A","B","B","B"], 2))
print(a.leastInterval(["A","A","A","B","B","B"], 0))
print(a.leastInterval(["A","A","A","A","A","A","B","C","D","E","F","G"], 2))
