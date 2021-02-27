//
//  main.swift
//  8393 - 합
//
//  Created by Ick on 2021/02/27.
//

import Foundation

func solution() {
    let n = Int(String(readLine()!))!
    
    var sum: Int = 0
    
    for i in 1...n {
        sum += i
    }
    print(sum)
}

solution()

