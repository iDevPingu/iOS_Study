//
//  main.swift
//  2439 - 별 찍기 2
//
//  Created by Ick on 2020/12/29.
//

import Foundation

func solution() {
    let n = Int(readLine()!)!
    
    for i in 0..<n{
        var star: String = ""
        for _ in 0..<n-i-1{
            star += " "
        }
        for _ in 0..<i+1{
            star += "*"
        }
        print(star)
    }
}
solution()
