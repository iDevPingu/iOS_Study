//
//  main.swift
//  1476 - 날짜 계산
//
//  Created by Ick on 2021/03/07.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    
    var year: [Int] = [1, 1, 1]
    var result: Int = 1
    
    while year != firstLine {
        for i in 0..<year.count {
            year[i] += 1
            if i == 0 {
                if year[i] >= 16 {
                    year[i] = 1
                }
            } else if i == 1 {
                if year[i] >= 29 {
                    year[i] = 1
                }
            } else if i == 2 {
                if year[i] >= 20 {
                    year[i] = 1
                }
            }
        }
        result += 1
    }
    print(result)
}

solution()
