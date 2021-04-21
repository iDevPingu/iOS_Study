//
//  main.swift
//  2239 - 스도쿠
//
//  Created by Ick on 2021/04/21.
//

import Foundation

func solution() {
    var sudokuBoard: [[Int]] = []
    for _ in 0..<9 {
        sudokuBoard.append(readLine()!.map({Int(String($0))!}))
    }
    
}
solution()
