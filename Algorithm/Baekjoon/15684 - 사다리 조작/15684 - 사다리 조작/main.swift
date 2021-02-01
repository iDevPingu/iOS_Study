//
//  main.swift
//  15684 - 사다리 조작
//
//  Created by Ick on 2020/12/27.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let m = firstLine[1]
    let h = firstLine[2]
    
    var lines: [[Int]] = []
    
    for _ in 0..<m {
        lines.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
    
    
    

}

solution()
