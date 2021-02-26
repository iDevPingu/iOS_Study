//
//  main.swift
//  10430 - 나머지
//
//  Created by Ick on 2021/02/25.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let a = firstLine[0]
    let b = firstLine[1]
    let c = firstLine[2]
    
    print("\((a+b)%c)")
    print("\(((a%c)+(b%c))%c)")
    print("\((a*b)%c)")
    print("\(((a%c) * (b%c))%c)")
}

solution()
