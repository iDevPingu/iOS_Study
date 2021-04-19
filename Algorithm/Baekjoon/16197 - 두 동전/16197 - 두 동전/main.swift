//
//  main.swift
//  16197 - 두 동전
//
//  Created by Ick on 2021/04/20.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0], m = firstLine[1]
    var board: [[String]] = []
    for i in 0..<n {
        board.append(readLine()!.map({String($0)}))
    }
    
}
solution()
