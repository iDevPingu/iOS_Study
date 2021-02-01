//
//  main.swift
//  1912 - 연속합
//
//  Created by Ick on 2020/10/09.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() -> Int {
    let _ = Int(String(readLine()!))!
    let numbers = readLine()!.split(separator: " ").map({Int(String($0))!})
    
    // 만약 입력된 수 중 최대값이 음수라면 최대값이 정답!
    // 최대값이 음수이다 -> 입력된 모든 값이 음수이다!
    let maxValue = numbers.max()!
    if maxValue < 0 {
        return maxValue
    }
    
    var result: Int = 0
    var sum: Int = 0
    
    for i in numbers {
        sum += i
        // sum이 음수가 되면 수열을 끊어야 하므로 0으로 초기화
        if sum < 0 {
            sum = 0
        }
        // 매번 result값과 현재 sum 값을 비교해준다
        if result < sum {
            result = sum
        }
    }
    
    return result
}
print(solution())
