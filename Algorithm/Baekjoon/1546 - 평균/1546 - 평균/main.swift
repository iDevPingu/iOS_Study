//
//  main.swift
//  1546 - 평균
//
//  Created by Ick on 2020/09/30.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution() {
    let n = Int(readLine()!)!
    let scoreList = readLine()!.split(separator: " ").map({Float(String($0))!})
    guard let m = scoreList.max() else { return }
    var sum: Float = 0
    for i in scoreList {
        sum += i
    }
    let result: Float = roundf(((sum / Float(n)) / m) * 100 * 100)
    print(result/100)
}
solution()
