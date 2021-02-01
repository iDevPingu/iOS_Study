//
//  main.swift
//  2231 - 분해합
//
//  Created by Ick on 2020/10/13.
//

import Foundation

func solution() -> Int {
    let n = Int(String(readLine()!))!
    var result: Int = 1
    
    for i in 1..<n {
        var temp = i
        result = i
        if i >= 1 && i < 10 {
            result = 2 * i
            if result == n {
                return i
            }
        } else {
            while (temp != 0){
                result += temp % 10
                temp /= 10
            }
            if result == n {
                return i
            }
        }
    }
    
    return 0
    
}

print(solution())
