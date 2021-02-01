//
//  main.swift
//  10162 - 전자레인지
//
//  Created by Ick on 2020/08/27.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() -> String {
    var t = Int(readLine()!)!
    var result = ["0","0","0"]
    let button = [300,60,10]
 
    for index in 0..<3{
        if button[index] <= t {
            result[index] = String((t / button[index]))
            t = (t - (t / button[index]) * button[index])
        }
        if t == 0{
            let answer = result.joined(separator: " ")
            return answer
        }
    }
    return "-1"
}
print(solution())
