//
//  main.swift
//  [Kakao] 2019 Winter Intern - 호텔 방 배정
//
//  Created by Ick on 2021/04/19.
//

import Foundation

func solution(_ k:Int64, _ room_number:[Int64]) -> [Int64] {
    var bookedMap: [Int64 : Int64] = [:]
    var result: [Int64] = []
    
    for i in 0..<room_number.count {
        var temp = room_number[i]
        var visited = [temp]
        while let nextRoom = bookedMap[temp] {
            temp = nextRoom
            visited.append(nextRoom)
        }
        result.append(temp)
        for j in visited {
            bookedMap[j] = temp + 1
        }
    }
    
    return result
}

print(solution(10, [1,3,4,1,3,1]))
print(solution(10, [1,1,1,1,1,1,1,1,1]))
