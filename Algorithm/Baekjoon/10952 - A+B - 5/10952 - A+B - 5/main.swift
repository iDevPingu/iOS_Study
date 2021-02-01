//
//  main.swift
//  10952 - A+B - 5
//
//  Created by Ick on 2021/01/07.
//

import Foundation

func solution() {
    var input:[Int] = []
    while (true) {
        input = readLine()!.split(separator: " ").map({Int(String($0))!})
        if input[0] == 0 && input[1] == 0 {
            break
        }
        print(input[0] + input[1])
    }
}
solution()
