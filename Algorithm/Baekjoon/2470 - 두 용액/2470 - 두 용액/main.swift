//
//  main.swift
//  2470 - 두 용액
//
//  Created by Ick on 2021/04/20.
//

import Foundation

func solution() {
    let n = Int(String(readLine()!))!
    var list = readLine()!.split(separator: " ").map({Int(String($0))!})
    list.sort()
    
    var left: Int = 0
    var right: Int = n - 1
    var closeValue: Int = 9999999999999
    var result: [Int] = []
    while left < right {
        let now = list[left] + list[right]
        if abs(closeValue) > abs(now) {
            closeValue = now
            result = [list[left], list[right]]
        }
        if now > 0 {
            right -= 1
        } else if now < 0 {
            left += 1
        } else if now == 0 {
            result = [list[left], list[right]]
            break
        }
    }
    result.sort()
    print(result[0], result[1])
}

solution()
