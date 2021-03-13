//
//  main.swift
//  13460 - 구슬 탈출 2
//
//  Created by Ick on 2021/01/11.
//

import Foundation

class Queue<T> {
    var enqueue: [T]
    var dequeue: [T] = []
    var count: Int {
        return enqueue.count + dequeue.count
    }
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    init(_ n: [T]) {
        self.enqueue = n
    }
    func push(_ n: T) {
        enqueue.append(n)
    }
    func pop() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
}

func solution() {
    let firstLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let n = firstLine[0]
    let m = firstLine[1]
    // 상하좌우
    let dx: [Int] = [0,0,-1,1]
    let dy: [Int] = [-1,1,0,0]
    
    var board: [[String]] = []
    for _ in 0..<n {
        board.append(readLine()!.map({String($0)}))
    }
    var visited = [[[[Bool]]]](repeating: [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 10), count: 10), count: 10), count: 10)
    var startPosition: [Int] = []
    for i in 0..<n {
        for j in 0..<m {
            if board[i][j] == "R" {
                startPosition += [i,j]
            }
        }
    }
    for i in 0..<n {
        for j in 0..<m {
            if board[i][j] == "B" {
                startPosition += [i,j]
            }
        }
    }
    // 몇 번 굴렸는지에 대한 정보
    startPosition.append(0)
    print(startPosition)
    // 처음 지점 방문 체크!
    visited[startPosition[0]][startPosition[1]][startPosition[2]][startPosition[3]] = true
    let queue = Queue([startPosition])
    var result: Int = -1
    while !queue.isEmpty {
        let now = queue.pop()!
        if now[4] > 10 {
            break
        }
        if board[now[0]][now[1]] == "O" && board[now[2]][now[3]] != "O" {
            result = now[4]
            break
        }
        for i in 0..<4 {
            var nextRed = [now[0], now[1]]
            var nextBlue = [now[2], now[3]]
            while true {
                if board[nextRed[0]][nextRed[1]] != "#" && board[nextRed[0]][nextRed[1]] != "O" {
                    nextRed[0] += dy[i]
                    nextRed[1] += dx[i]
                } else {
                    if board[nextRed[0]][nextRed[1]] == "#" {
                        nextRed[0] -= dy[i]
                        nextRed[1] -= dx[i]
                    }
                    break
                }
            }
            
            while true {
                if board[nextBlue[0]][nextBlue[1]] != "#" && board[nextBlue[0]][nextBlue[1]] != "O" {
                    nextBlue[0] += dy[i]
                    nextBlue[1] += dx[i]
                } else {
                    if board[nextBlue[0]][nextBlue[1]] == "#" {
                        nextBlue[0] -= dy[i]
                        nextBlue[1] -= dx[i]
                    }
                    break
                }
            }
            // 같은 위치에 도달하게 될 때
            if nextRed == nextBlue {
                if board[nextRed[0]][nextRed[1]] != "O" {
                    let distanceRed = abs(nextRed[0] - now[0]) + abs(nextRed[1] - now[1])
                    let distanceBlue = abs(nextBlue[0] - now[2]) + abs(nextBlue[1] - now[3])
                    if distanceRed > distanceBlue {
                        nextRed[0] -= dy[i]
                        nextRed[1] -= dx[i]
                    } else {
                        nextBlue[0] -= dy[i]
                        nextBlue[1] -= dx[i]
                    }
                }
            }
            if !visited[nextRed[0]][nextRed[1]][nextBlue[0]][nextBlue[1]] {
                visited[nextRed[0]][nextRed[1]][nextBlue[0]][nextBlue[1]] = true
                queue.push(nextRed + nextBlue + [now[4] + 1])
            }
        }
    }
    print(result)
}
solution()

