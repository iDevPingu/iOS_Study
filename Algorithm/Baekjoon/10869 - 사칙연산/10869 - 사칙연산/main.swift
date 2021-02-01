//
//  main.swift
//  10869 - 사칙연산
//
//  Created by Ick on 2020/09/22.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution(){
    let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
    let a = firstLine[0]
    let b = firstLine[1]
    
    print(a+b)
    print(a-b)
    print(a*b)
    print(a/b)
    print(a%b)
}
solution()
