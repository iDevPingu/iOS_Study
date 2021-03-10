//
//  main.swift
//  3020 - 개똥벌레
//
//  Created by Ick on 2021/03/08.
//

import Foundation

// 완전 탐색 -> 시간초과
func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let h = firstLine[1]

    var 종유석: [Int] = []
    var 석순: [Int] = []
    for i in 0..<n {
        let stone = Int(readLine()!)!
        if i % 2 == 0 {
            석순.append(stone)
        } else {
            종유석.append(stone)
        }
    }
    
    석순.sort()
    종유석.sort()

    var min = Int.max
    var count = 0
    
    func binarySearchCount(_ target: Int, _ list: [Int]) -> Int {
        var left: Int = 0
        var right: Int = list.count - 1
        
        while left <= right {
            let mid = (left + right) / 2
            if list[mid] <= target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return list.count - (right + 1)
    }
    
    for i in 1...h {
        let sucksun = binarySearchCount(i - 1, 석순)
        let jongUsuck = binarySearchCount(h - i, 종유석)
        
        let sum = sucksun + jongUsuck
        
        if min > sum {
            min = sum
            count = 1
        } else if min == sum {
            count += 1
        }
    }
    
    print("\(min) \(count)")
}

solution()
