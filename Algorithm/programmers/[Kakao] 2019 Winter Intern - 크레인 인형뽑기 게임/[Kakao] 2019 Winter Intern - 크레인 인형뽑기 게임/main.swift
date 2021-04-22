//
//  main.swift
//  [Kakao] 2019 Winter Intern - 크레인 인형뽑기 게임
//
//  Created by Ick on 2021/04/22.
//

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    var result: Int = 0
    var stack: [Int] = []
    
    for move in moves {
        for i in 0..<board.count {
            let index = move - 1
            if board[i][index] != 0 {
                if stack.isEmpty {
                    stack.append(board[i][index])
                    board[i][index] = 0
                } else {
                    if stack.last! == board[i][index] {
                        result += 2
                        stack.removeLast()
                        board[i][index] = 0
                    } else {
                        stack.append(board[i][index])
                        board[i][index] = 0
                    }
                }
                break
            }
        }
    }
    
    return result
}
print(solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4]))
