//
//  main.swift
//  15658 - 연산자 끼워넣기 (2)
//
//  Created by Ick on 2021/04/05.
//

import Foundation

func solution() {
    let n = Int(String(readLine()!))!
    let nums = readLine()!.split(separator: " ").map({Int(String($0))!})
    // + - * ÷
    var operators = readLine()!.split(separator: " ").map({Int(String($0))!})
    
    var maxResult: Int = -1000000001
    var minResult: Int = 1000000001
    
    var stack: [Int] = [nums[0]]
    func bruteForce(_ index: Int, _ now: Int, _ plus: Int, _ minus: Int, _ multiply: Int, _ divide: Int) {
        if index == n {
            maxResult = max(maxResult, now)
            minResult = min(minResult, now)
            return
        }
        
        if plus > 0 {
            bruteForce(index + 1, now + nums[index], plus - 1, minus, multiply, divide)
        }
        if minus > 0 {
            bruteForce(index + 1, now - nums[index], plus, minus - 1, multiply, divide)
        }
        if multiply > 0 {
            bruteForce(index + 1, now * nums[index], plus, minus, multiply - 1, divide)
        }
        if divide > 0 {
            bruteForce(index + 1, now / nums[index], plus, minus, multiply, divide - 1)
        }
    }
    bruteForce(1, nums[0], operators[0], operators[1], operators[2], operators[3])
    
    print(maxResult)
    print(minResult)
}
solution()
