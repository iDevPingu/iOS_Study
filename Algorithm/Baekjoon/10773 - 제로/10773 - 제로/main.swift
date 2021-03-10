//
//  main.swift
//  10773 - 제로
//
//  Created by Ick on 2021/03/07.
//

import Foundation

func solution() {
    let k = Int(readLine()!)!
    var moneyList: [Int] = []
    var sum: Int = 0
    for _ in 0..<k {
        let money = Int(readLine()!)!
        if money == 0 {
            moneyList.removeLast()
        } else {
            moneyList.append(money)
        }
    }
    
    for money in moneyList {
        sum += money
    }
    print(sum)
}

solution()
