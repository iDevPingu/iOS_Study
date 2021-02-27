//
//  main.swift
//  2753 - 윤년
//
//  Created by Ick on 2021/02/27.
//

import Foundation

func solution() {
    let year = Int(String(readLine()!))!
    
    if year % 4 == 0 && ( year % 100 != 0 || year % 400 == 0 ) {
        print("1")
    } else {
        print("0")
    }
}
solution()
