//
//  main.swift
//  2884 - 알람 시계
//
//  Created by Ick on 2021/02/27.
//

import Foundation

func solution() {
    let time = readLine()!.split(separator: " ").map({Int(String($0))!})
    let hour = time[0]
    let minute = time[1]
    
    if minute >= 45 {
        print("\(hour) \(minute - 45)")
    } else {
        if hour == 0 {
            print("\(23) \(15 + minute)")
        } else {
            print("\(hour - 1) \(15 + minute)")
        }
        
    }
    
}
solution()
