//
//  main.swift
//  1629 - 곱셈
//
//  Created by Ick on 2020/12/17.
//

import Foundation

// O(n)으로 풀면 안되고 O(logN)으로 풀어야함
func solution() {
    let input = readLine()!.split(separator: " ").map({Int(String($0))!})
    let a = input[0]
    let b = input[1]
    let c = input[2]
    
    func 제곱나머지(_ first: Int, _ second: Int) -> Int {
        if second == 0 {
            return 1
        } else if second == 1 {
            return first
        }
        if second % 2 > 0 {
            return 제곱나머지(first, second - 1) * first
        }
        var half = 제곱나머지(first, second / 2)
        half %= c
        return (half * half) % c
    }
    print(제곱나머지(a, b) % c)
    
}

solution()
