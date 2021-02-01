//
//  main.swift
//  1932 - 정수 삼각형
//
//  Created by Ick on 2020/10/07.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution(){
    let n = Int(readLine()!)!
    var triangle: [[Int]] = []
    
    for _ in 0..<n{
        triangle.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
    
    
    var result: [[Int]] = []
    for i in 1...n {
        result.append([Int](repeating: 0, count: i))
    }
    
    for i in 0..<n{
        for j in 0..<triangle[i].count{
            if i == 0 {
                result[i][j] = triangle[i][j]
            } else {
                // 맨왼쪽
                if j == 0 {
                    result[i][j] = result[i-1][j] + triangle[i][j]
                // 맨 오른쪽
                } else if j == i {
                    result[i][j] = result[i-1][i-1] + triangle[i][j]
                // 사이에 있는 애들
                } else {
                    let temp1 = result[i-1][j-1] + triangle[i][j]
                    let temp2 = result[i-1][j] + triangle[i][j]
                    if temp1 > temp2 {
                        result[i][j] = temp1
                    } else {
                        result[i][j] = temp2
                    }
                }
            }
        }
    }
    print(result[n-1].max()!)
    
}

solution()
