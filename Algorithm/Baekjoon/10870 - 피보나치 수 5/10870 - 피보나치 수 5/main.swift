//
//  main.swift
//  10870 - 피보나치 수 5
//
//  Created by Ick on 2021/02/27.
//

import Foundation

// 재귀를 사용하기
// 물론 DP를 사용하는게 더 빠르다

func fibonacci(_ num: Int) -> Int {
    if num == 0 {
        return 0
    } else if num == 1 {
        return 1
    } else if num == 2 {
        return 1
    } else {
        return fibonacci(num - 2) + fibonacci(num - 1)
    }
}

func solution() {
    let n = Int(String(readLine()!))!
    print(fibonacci(n))
}

solution()
