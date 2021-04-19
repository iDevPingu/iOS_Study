//
//  main.swift
//  3273 - 두 수의 합
//
//  Created by Ick on 2021/04/20.
//

import Foundation

func solution() {
    let n = Int(String(readLine()!))!
    var numberList = readLine()!.split(separator: " ").map({Int(String($0))!})
    let x = Int(String(readLine()!))!
    
    numberList.sort()
    
    var left: Int = 0
    var right: Int = n - 1
    var result: Int = 0
    
    while left < right {
        let now = numberList[left] + numberList[right]
        if now == x {
            result += 1
            left += 1
            right -= 1
        } else if now > x {
            right -= 1
        } else if now < x {
            left += 1
        }
    }
    print(result)
}
solution()
