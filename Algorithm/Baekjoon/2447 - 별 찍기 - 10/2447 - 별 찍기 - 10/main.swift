//
//  main.swift
//  2447 - 별 찍기 - 10
//
//  Created by Ick on 2021/02/27.
//

import Foundation

func solution() {
    let n = Int(String(readLine()!))!
    var result: [[String]] = [[String]](repeating: [String](repeating: " ", count: n), count: n)
    
    
    
    func draw(_ num: Int, _ x: Int, _ y: Int) {
        if num == 1 {
            result[y][x] = "*"
            return
        }
        
        let div = num / 3
        for i in 0..<3 {
            for j in 0..<3 {
                if i == 1 && j == 1 {
                    continue
                } else {
                    draw(div, x + (j*div), y + (i*div))
                }
            }
        }
    }
    
    draw(n, 0, 0)
    
    for line in 0..<result.count {
        print(result[line].joined())
    }
}

solution()
