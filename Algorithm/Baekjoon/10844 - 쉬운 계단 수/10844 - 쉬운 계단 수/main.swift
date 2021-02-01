//
//  main.swift
//  10844 - 쉬운 계단 수
//
//  Created by Ick on 2020/10/08.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() -> Int {
    let n = Int(String(readLine()!))!
    let mod = 1000000000
    if n == 1{
        return 9
    } else {
        var result: Int = 0
        var num1: [Int] = [Int](repeating: 1, count: 10)
        var num2: [Int] = [Int](repeating: 0, count: 10)
        num1[0] = 0
        
        for i in 1..<n{
            for j in 0..<num1.count {
                if i % 2 == 1 {
                    if j == 0 {
                        num2[0] = (num1[1]) % mod
                    } else if j == 9 {
                        num2[9] = (num1[8]) % mod
                    } else {
                        num2[j] = (num1[j+1] + num1[j-1]) % mod
                    }
                } else {
                    if j == 0 {
                        num1[0] = (num2[1]) % mod
                    } else if j == 9 {
                        num1[9] = (num2[8]) % mod
                    } else {
                        num1[j] = (num2[j+1] + num2[j-1]) % mod
                    }
                }
            }
        }

        if n % 2 == 1 {
            for i in num1 {
                result += i
            }
        } else {
            for i in num2 {
                result += i
            }
        }
        
        return result % mod
    }
}
print(solution())
