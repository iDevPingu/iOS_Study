//
//  main.swift
//  3190 - 뱀
//
//  Created by Ick on 2021/03/10.
//

import Foundation

// Made by Pingu
class Deque<T: Equatable> {
    var enqueue: [T]
    var dequeue: [T] = []
    var count: Int {
        return enqueue.count + dequeue.count
    }
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    var first: T? {
        if dequeue.isEmpty {
            return enqueue.first
        }
        return dequeue.last
    }
    init(_ queue: [T]) {
        enqueue = queue
    }
    func pushFirst(_ n: T) {
        dequeue.append(n)
    }
    func pushLast(_ n: T) {
        enqueue.append(n)
    }
    func popFirst() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
        
    }
    func popLast() -> T? {
        var returnValue: T?
        if enqueue.isEmpty {
            dequeue.reverse()
            returnValue = dequeue.popLast()
            dequeue.reverse()
        } else {
            returnValue = enqueue.popLast()
        }
        return returnValue
    }
    func contains(_ n: T) -> Bool {
        return enqueue.contains(n) || dequeue.contains(n)
    }
    func removeAll() {
        enqueue.removeAll()
        dequeue.removeAll()
    }
}

func solution() {
    // 보드의 크기
    let n = Int(readLine()!)!
    // 사과의 개수
    let k = Int(readLine()!)!

    var applePosition: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n+1), count: n+1)
    
    for _ in 0..<k {
        let position = readLine()!.split(separator: " ").map({Int(String($0))!})
        applePosition[position[0]][position[1]] = true
    }
    let l = Int(readLine()!)!
    var changeTime: [Int] = []
    var changeDirection: [String] = []
    for _ in 0..<l {
        let line = readLine()!.split(separator: " ").map({String($0)})
        changeTime.append(Int(line[0])!)
        changeDirection.append(line[1])
    }
    
    changeTime.reverse()
    changeDirection.reverse()
    
    // 제일 처음엔 동쪽을 향함
    var snakeDirection: Int = 1
    // 북동남서
    let move: [[Int]] = [[-1,0], [0,1], [1,0], [0,-1]]
    var time: Int = 0
    
    let deque = Deque([[1,1]])
    
    while true {
        let head = deque.first!
        time += 1
        let next = [head[0] + move[snakeDirection][0], head[1] + move[snakeDirection][1]]
        
        // 자기 몸통과 부딪힘
        if deque.contains(next) {
            break
        }
        
        if next[0] < 1 || next[1] < 1 || next[0] > n || next[1] > n {
            break
        } else {
            deque.pushFirst(next)
            // 사과가 있었다면
            if applePosition[next[0]][next[1]] {
                applePosition[next[0]][next[1]] = false
            } else {
                // 사과가 없었다면
                let _ = deque.popLast()
            }
            
            // 방향전환 처리
            if !changeTime.isEmpty {
                if time == changeTime.last {
                    changeTime.removeLast()
                    let turn = changeDirection.popLast()!
                    
                    // 왼쪽
                    if turn == "L" {
                        snakeDirection -= 1
                        if snakeDirection < 0 {
                            snakeDirection = 3
                        }
                        // 오른쪽
                    } else if turn == "D" {
                        snakeDirection += 1
                        if snakeDirection > 3 {
                            snakeDirection = 0
                        }
                    }
                }
            }
        }
    }
    print(time)
}
solution()
//func solution() {
//    // 보드의 크기
//    let n = Int(readLine()!)!
//    // 사과의 개수
//    let k = Int(readLine()!)!
//
//    var applePosition: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
//    var snakeBody: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
//    snakeBody[0][0] = true
//    for _ in 0..<k {
//        let position = readLine()!.split(separator: " ").map({Int(String($0))!})
//        applePosition[position[0]-1][position[1]-1] = true
//    }
//
//    let l = Int(readLine()!)!
//    var changeTime: [Int] = []
//    var changeDirection: [String] = []
//    for _ in 0..<l {
//        let line = readLine()!.split(separator: " ").map({String($0)})
//        changeTime.append(Int(line[0])!)
//        changeDirection.append(line[1])
//    }
//
//    changeTime.reverse()
//    changeDirection.reverse()
//
//    var snakeHead: [Int] = [0,0]
//    var snakeTail: [Int] = [0,0]
//    var snakeLength: Int = 1
//    // 제일 처음엔 동쪽을 향함
//    var snakeDirection: Int = 1
//    // 북동남서
//    let move: [[Int]] = [[-1,0], [0,1], [1,0], [0,-1]]
//    var time: Int = 0
//
//    while true {
//        time += 1
//        // 머리 이동전 현재 위치 몸통으로 표시
//        snakeBody[snakeHead[0]][snakeHead[1]] = true
//
//        snakeHead[0] += move[snakeDirection][0]
//        snakeHead[1] += move[snakeDirection][1]
//        // 벽을 만난다면 게임오버
//        if snakeHead[0] < 0 || snakeHead[1] < 0 || snakeHead[0] > n-1 || snakeHead[1] > n-1 {
//            break
//        }
//        // 자기자신과 만난다면 게임오버
//        if snakeBody[snakeHead[0]][snakeHead[1]] {
//            break
//        }
//        // 사과가 없다면 꼬리 이동
//        if !applePosition[snakeHead[0]][snakeHead[1]] {
//            // 기존 꼬리 위치는 더이상 뱀의 몸통에 포함되지 않음
//            snakeBody[snakeTail[0]][snakeTail[1]] = false
//
//            if snakeDirection == 0 || snakeDirection == 2{
//                // 북, 남
//                if snakeTail[1] == snakeHead[1] {
//                    // 꼬리 이동
//                    snakeTail[0] += move[snakeDirection][0]
//                    snakeTail[1] += move[snakeDirection][1]
//                } else {
//                    if snakeTail[1] > snakeHead[1] {
//                        snakeTail[1] -= 1
//                    } else {
//                        snakeTail[1] += 1
//                    }
//                }
//            } else if snakeDirection == 1 || snakeDirection == 3 {
//                // 동, 서
//                if snakeTail[0] == snakeHead[0] {
//                    // 꼬리 이동
//                    snakeTail[0] += move[snakeDirection][0]
//                    snakeTail[1] += move[snakeDirection][1]
//                } else {
//                    if snakeTail[0] > snakeHead[0] {
//                        snakeTail[0] += 1
//                    } else {
//                        snakeTail[0] -= 1
//                    }
//                }
//            }
//        } else {
//            // 사과가 있다면 먹어서 길이 증가
//            snakeLength += 1
//        }
//        // 방향전환 확인
//        if !changeTime.isEmpty {
//            if changeTime.last! == time {
//                changeTime.removeLast()
//                if changeDirection.last! == "D" {
//                    // 오른쪽
//                    snakeDirection += 1
//                    if snakeDirection > 3 {
//                        snakeDirection = 0
//                    }
//                } else {
//                    // 왼쪽
//                    snakeDirection -= 1
//                    if snakeDirection < 0 {
//                        snakeDirection = 3
//                    }
//                }
//                changeDirection.removeLast()
//            }
//        }
//    }
//    print(time)
//}

