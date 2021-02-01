//
//  main.swift
//  11053 - 가장 긴 증가하는 부분 수열
//
//  Created by Ick on 2020/10/09.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() -> Int {
    let n = Int(String(readLine()!))!

    let numbers: [Int] = readLine()!.split(separator: " ").map({Int(String($0))!})
    
    if n == 1 {
        return 1
    }
    // 10 : 1, 20 : 2,30 : 3, 50 : 4
    var dp: [Int: Int] = [0:0]
    var length: [Int] = []
    
    // 모든 숫자에 대해서 비교한다
    for i in 0..<numbers.count{
        // dp 딕셔너리에 숫자가 있다면 : 이 말은 전에 한 번이라도 본 적이 있는 숫자
        if dp.keys.contains(numbers[i]) {
            // 현재 숫자의 배열 길이을 저장
            let now = dp[numbers[i]]!
            var len = 0
            // dp의 키들을 가지고온다
            for j in dp.keys {
                // 키를 가져온 j는 숫자이다.
                // 만약 현재 숫자가 지금 보려는 숫자보다 작다면
                if j < numbers[i] {
                    // 그리고 그 숫자의 배열 길이 중 최대값을 구한다.
                    if dp[j]! > len {
                        len = dp[j]!
                    }
                }
            }
            // 현재 길이와 새로 구한 길이의 최대값을 구한다.
            length.append(max(len + 1, now))
            // 현재 숫자의 배열 길이 초기화
            dp[numbers[i]] = max(len + 1,now)
        } else {
            // 만약 숫자를 본 적이 없다면
            var len: Int = 0
            // dp의 키들 즉 앞에서 본 숫자들을 확인한다.
            for j in dp.keys {
                // 지금 숫자보다 작은 숫자의 값중 최대값 구한다.
                if j < numbers[i] {
                    if dp[j]! > len {
                        len = dp[j]!
                    }
                }
            }
            length.append(len + 1)
            dp[numbers[i]] = len + 1
        }
    }
    
    return length.max()!
    
}
print(solution())
