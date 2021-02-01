//
//  main.swift
//  1330 - 두 수 비교하기
//
//  Created by Ick on 2020/12/29.
//

import Foundation

let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
if firstLine[0] > firstLine[1] {
    print(">")
} else if firstLine[0] < firstLine[1] {
    print("<")
} else {
    print("==")
}
