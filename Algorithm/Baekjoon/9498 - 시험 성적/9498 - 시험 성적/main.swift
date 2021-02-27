//
//  main.swift
//  9498 - 시험 성적
//
//  Created by Ick on 2021/02/27.
//

import Foundation

func solution() {
    let score = Int(String(readLine()!))!
    
    if score >= 90 {
        print("A")
    } else if score >= 80 && score < 90 {
        print("B")
    } else if score >= 70 && score < 80 {
        print("C")
    } else if score >= 60 && score < 70 {
        print("D")
    } else {
        print("F")
    }
}

solution()
