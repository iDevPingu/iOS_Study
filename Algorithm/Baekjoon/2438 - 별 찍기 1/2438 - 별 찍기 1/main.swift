//
//  main.swift
//  2438 - 별 찍기 1
//
//  Created by Ick on 2020/12/29.
//

import Foundation

func solution() {
    let n = Int(readLine()!)!
    
    for i in 0..<n {
        var star = ""
        for _ in 0..<i+1{
            star += "*"
        }
        print(star)
    }
}
solution()
