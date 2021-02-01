//
//  main.swift
//  9251 - LCS
//
//  Created by Ick on 2020/10/16.
//

import Foundation

func solution() {
    let firstString = readLine()!.map({String($0)})
    let secondString = readLine()!.map({String($0)})
    
    var resultTable: [[Int]] = []
    resultTable.append([Int](repeating: 0, count: firstString.count))
    
    for i in 0..<secondString.count {
        resultTable.append([])
        for j in 0..<firstString.count {
            if secondString[i] == firstString[j] {
                if j == 0 || i == 0 {
                    resultTable[i+1].append(1)
                } else {
                    resultTable[i+1].append(resultTable[i][j-1] + 1)
                }
            } else {
                if j == 0 {
                    resultTable[i+1].append(resultTable[i][j])
                } else {
                    resultTable[i+1].append(max(resultTable[i][j], resultTable[i+1][j-1]))
                }
            }
        }
    }
    print(resultTable[secondString.count][firstString.count - 1])
    
    
    
}

solution()
