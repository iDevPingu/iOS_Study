//
//  main.swift
//  14681 - 사분면 고르기
//
//  Created by Ick on 2021/02/27.
//

import Foundation

func solution() {
    let x = Int(String(readLine()!))!
    let y = Int(String(readLine()!))!
    
    if x > 0 , y > 0 {
        print("1")
    } else if x > 0 , y < 0 {
        print("4")
    } else if x < 0 , y > 0 {
        print("2")
    } else if x < 0 , y < 0 {
        print("3")
    }
}
solution()
