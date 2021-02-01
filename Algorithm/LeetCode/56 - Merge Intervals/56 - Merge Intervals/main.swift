//
//  main.swift
//  56 - Merge Intervals
//
//  Created by Jaeick Hwang on 2021/01/30.
//

import Foundation

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let sortIntervals = intervals.sorted { (a, b) -> Bool in
            return a[0] < b[0]
        }
        var result: [[Int]] = []
        var now: [Int] = sortIntervals[0]
        
        for i in 1..<sortIntervals.count {
            if now[1] >= sortIntervals[i][0] {
                now = [now[0], max(now[1], sortIntervals[i][1])]
            } else {
                result.append(now)
                now = sortIntervals[i]
            }
        }
        result.append(now)
        
        return result
    }
}


let a = Solution()
print(a.merge([[1,3],[2,6],[8,10],[15,18]]))
print(a.merge([[1,4],[4,5]]))
print(a.merge([[1,2],[2,3],[3,20],[10,11]]))
