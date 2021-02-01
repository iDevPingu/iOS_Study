//
//  main.swift
//  1311 - 할 일 정하기1
//
//  Created by Ick on 2021/01/08.
//

import Foundation

func solution() {
    let n = Int(readLine()!)!
    var workTable: [[Int]] = []
    
    for _ in 0..<n {
        workTable.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
    
    var result = 0
    
    for i in 0..<n {
        result += workTable[i].min()!
    }
    print(result)
}
solution()
