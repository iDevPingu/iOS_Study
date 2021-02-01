//
//  main.swift
//  11066 - 파일 합치기
//
//  Created by Ick on 2020/10/18.
//

import Foundation

func solution() {
    let t = Int(readLine()!)!
    var testdata: [[Int]] = []
    
    for _ in 0..<t {
        let k = Int(String(readLine()!))!
        let data = readLine()!.split(separator: " ").map({Int(String($0))!})
        testdata.append(data)
    }
    var result: [Int] = [Int](repeating: 0, count: t)
    for i in 0..<testdata.count {
        
        while !testdata[i].isEmpty {
            if testdata[i].count == 1 {
//                result[i] += testdata[i].popLast()!
                break
            }
            
            testdata[i] = testdata[i].sorted(by: >)
            let a = testdata[i].popLast()!
            let b = testdata[i].popLast()!
            result[i] += (a+b)
            testdata[i].append(a+b)
        }
    }
    print(result)
}
solution()
