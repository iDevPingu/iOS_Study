//
//  main.swift
//  2580 - 스도쿠
//
//  Created by Ick on 2020/11/11.
//

import Foundation

func solution() {
    var sudoku: [[Int]] = []
    
    for _ in 0..<9 {
        sudoku.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
    print(sudoku)
}

solution()
