//
//  main.swift
//  1931 - 회의실배정
//
//  Created by Ick on 2020/07/29.
//  Copyright © 2020 Ick. All rights reserved.
//

import Foundation

guard let N = Int(readLine()!) else { fatalError() }
var conferences = [(Int, Int)]()
var now: Int = -1
var answer = 0
for _ in 0..<N{
    guard let time = readLine()?.split(separator: " ").map({Int($0)!}) else { fatalError() }
    conferences.append((time[0], time[1]))
}

conferences.sort { (a: (Int,Int), b :(Int,Int)) -> Bool in
    if a.1 == b.1{
        return a.0 < b.0
    } else {
        return a.1 < b.1
    }
}

print(conferences)

for conference in conferences {
    if conference.0 >= now {
        now = conference.1
        answer += 1
    }
}

print(answer)
