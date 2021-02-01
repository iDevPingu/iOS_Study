//
//  main.swift
//  13460 - 구슬 탈출 2
//
//  Created by Ick on 2021/01/11.
//

import Foundation

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let m = firstLine[1]
    
    // 상하좌우
    var dx: [Int] = [0,0,-1,1]
    var dy: [Int] = [-1,1,0,0]
    
    var board: [[String]] = []
    
    for _ in 0..<m {
        board.append(readLine()!.map({String($0)}))
    }
    
    var redVisited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
    var blueVisited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
    
    var startPosition: [Int] = []
    for i in 0..<m {
        for j in 0..<n {
            if board[i][j] == "R" {
                startPosition += [i,j]
            }
        }
    }
    
    for i in 0..<m {
        for j in 0..<n {
            if board[i][j] == "B" {
                startPosition += [i,j]
            }
        }
    }
    // 이동 횟수 저장하기 위한 필드
    startPosition.append(0)
    var stack: [[Int]] = [startPosition]
    while !stack.isEmpty {
        
    }
}

solution()
