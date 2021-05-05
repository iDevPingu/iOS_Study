//
//  main.swift
//  [Kakao] 2019 Bilnd - 블록게임
//
//  Created by Ick on 2021/05/06.
//

import Foundation

func solution(_ board:[[Int]]) -> Int {
    var board = board
    var result: Int = 0
    // 위만 체크하면 된다.
    // 위가 0이거나 위에 뭔가 있다면 넣을 수 없다.
    func fillBlackBlock() {
        for y in 0..<board.count {
            for x in 0..<board.count {
                if y == 0 {
                    // 검은 블록으로 채운다
                    if board[y][x] == 0 {
                        board[y][x] = -1
                    }
                } else {
                    if board[y][x] == 0 {
                        let upY = y - 1
                        
                        if board[upY][x] == -1 {
                            board[y][x] = -1
                        }
                    }
                }
            }
        }
    }
    func checkAvailable(points: [[Int]]) -> Bool {
        var temp: [Int] = []
        for point in points {
            if point[0] < 0 || point[1] < 0 || point[0] >= board.count || point[1] >= board.count {
                return false
            } else {
                if board[point[0]][point[1]] == 0 {
                    return false
                } else {
                    temp.append(board[point[0]][point[1]])
                }
            }
        }
        var number: Int = -1
        var count: Int = 0
        var minusOneCount: Int = 0
        for i in temp {
            if number == -1 {
                if i != -1 {
                    number = i
                    count += 1
                } else {
                    minusOneCount += 1
                }
            } else {
                if number == i {
                    count += 1
                } else if i == -1 {
                    minusOneCount += 1
                }
            }
        }
        if count == 4 && minusOneCount == 2 {
            return true
        } else {
            return false
        }
        
    }
    while true {
        fillBlackBlock()
        for i in board {
            print(i)
        }
        print("next")
        var isFind: Bool = false
        // 2*3
        for y in 0..<board.count {
            if isFind {
                break
            }
            for x in 0..<board.count {
                if board[y][x] == 0 {
                    continue
                }
                let points = [[y,x], [y,x+1], [y+1,x], [y+1,x+1], [y+2,x], [y+2,x+1]]
                if checkAvailable(points: points) {
                    for point in points {
                        board[point[0]][point[1]] = 0
                    }
                    result += 1
                    isFind = true
                    break
                }
            }
        }
        
        // 3*2
        for y in 0..<board.count {
            if isFind {
                break
            }
            for x in 0..<board.count {
                if board[y][x] == 0 {
                    continue
                }
                let points = [[y,x], [y,x+1], [y,x+2], [y+1,x], [y+1,x+1], [y+1,x+2]]
                if checkAvailable(points: points) {
                    for point in points {
                        board[point[0]][point[1]] = 0
                    }
                    result += 1
                    isFind = true
                    break
                }
            }
        }
        
        if isFind {
            continue
        } else {
            break
        }
    }
    
    return result
}
//print(solution([[0,0,0,0,0,0,0,0,0,0],
//                [0,0,0,0,0,0,0,0,0,0],
//                [0,0,0,0,0,0,0,0,0,0],
//                [0,0,0,0,0,0,0,0,0,0],
//                [0,0,0,0,0,0,4,0,0,0],
//                [0,0,0,0,0,0,4,4,0,0],
//                [0,0,0,0,3,0,4,0,0,0],
//                [1,0,0,2,3,0,0,0,5,5],
//                [1,0,2,2,3,3,0,0,0,5],
//                [1,1,0,2,0,0,0,0,0,5]]))
print(solution([[0, 0, 0, 0, 0],
                [1, 0, 0, 2, 0],
                [1, 2, 2, 2, 0],
                [1, 1, 0, 0, 0],
                [0, 0, 0, 0, 0]]))
