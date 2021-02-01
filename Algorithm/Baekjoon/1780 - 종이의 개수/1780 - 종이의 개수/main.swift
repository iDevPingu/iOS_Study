//
//  main.swift
//  1780 - 종이의 개수
//
//  Created by Ick on 2021/01/02.
//

import Foundation

func solution() {
    let n = Int(readLine()!)!
    var paper: [[Int]] = []
    
    for _ in 0..<n {
        paper.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    }
    
    var zero: Int = 0
    var plusOne: Int = 0
    var minusOne: Int = 0
    
//    func divide(_ p: [[Int]], size: Int, startCol :Int, startRow: Int) -> [[Int]] {
//        var temp: [[Int]] = []
//
//        for i in 0..<size {
//            temp.append(Array(p[startCol+i][startRow..<startRow+size]))
//        }
//
//        return temp
//    }
    
    func check(_ p: [[Int]]) {
        
        // 만약 1*1 행렬이면 그냥 바로 더한다.
        if p.count == 1 {
            if p[0][0] == 0 {
                zero += 1
            } else if p[0][0] == -1 {
                minusOne += 1
            } else if p[0][0] == 1 {
                plusOne += 1
            }
            return
        }
        
        let first = p[0][0]
        
        // 값이 달라지면 종이를 자른다
        for i in 0..<p.count {
            for j in 0..<p.count {
                if p[i][j] != first {
                    // 종이를 잘라서 체크한다.
                    let len = p.count / 3
                    for k in 0..<3 {
                        for l in 0..<3 {
                            var temp: [[Int]] = []
                            
                            for i in 0..<len {
                                temp.append(Array(p[len*k+i][len*l..<len*l+len]))
                            }
                            check(temp)
                        }
                    }
                    return
                }
            }
        }
        
        // 만약 값이 모두 같았다면 더한다.
        if first == 0 {
            zero += 1
        } else if first == -1 {
            minusOne += 1
        } else if first == 1 {
            plusOne += 1
        }
    }
    
    check(paper)
    
    print(minusOne)
    print(zero)
    print(plusOne)
}

solution()
