//
//  main.swift
//  10872 - 팩토리얼
//
//  Created by Ick on 2021/02/27.
//

import Foundation

func factorial(_ num: Int) -> Int {
    if num < 1 {
        return 1
    } else {
        return num * factorial(num - 1)
    }
}

func solution() {
    let n = Int(String(readLine()!))!
    print(factorial(n))
}

solution()
