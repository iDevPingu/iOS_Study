//
//  main.swift
//  2588 - 곱셈
//
//  Created by Ick on 2021/02/25.
//

import Foundation

func solution() {
    let first = Int(readLine()!)!
    var second = readLine()!.map({String($0)})
    second.reverse()
    var sum: Int = 0
    for i in 0..<second.count {
        let temp = first * Int(second[i])!
        print(temp)
        sum += (temp * (NSDecimalNumber.init(decimal: pow(10, i)).intValue))
    }
    print(sum)
}

solution()
