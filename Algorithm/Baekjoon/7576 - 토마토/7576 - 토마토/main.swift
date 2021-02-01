//
//  main.swift
//  7576 - 토마토
//
//  Created by Ick on 2020/09/08.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

class Queue<T>{
    var enqueue: [T]
    var dequeue: [T] = []
    
    var isEmpty: Bool{
        return enqueue.isEmpty && dequeue.isEmpty
    }
    var count: Int{
        return enqueue.count + dequeue.count
    }
    
    init(_ queue:[T]){
        self.enqueue = queue
    }
    
    func push(_ n: T){
        enqueue.append(n)
    }
    
    func pop() -> T?{
        if dequeue.isEmpty{
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
    
}

func solution(){
    let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
    let m = firstLine[0]
    let n = firstLine[1]

    var tomatoBox: [[Int]] = []
    for _ in 0..<n{
        tomatoBox.append(readLine()!.split(separator: " ").map({Int($0)!}))
    }
    
    let queue: Queue = Queue([])
    var result = -1
    let dx = [0,0,-1,1] //상하좌우
    let dy = [-1,1,0,0]
    
    for i in 0..<n{
        for j in 0..<m{
            if tomatoBox[i][j] == 1 {
                queue.push([i,j])
            }
        }
    }
    
    while queue.count != 0 {
        result += 1
        
        for _ in 0..<queue.count {
            guard let tomatoPosition = queue.pop() as? [Int] else { fatalError() }
            for i in 0..<dx.count{
                let row = tomatoPosition[0] + dy[i]
                let col = tomatoPosition[1] + dx[i]
                if row < 0 || row > n-1 || col < 0 || col > m-1{
                    continue
                } else {
                    if tomatoBox[row][col] == 0 {
                        tomatoBox[row][col] = 1
                        queue.push([row,col])
                    }
                }
            }
        }
    }
    for row in tomatoBox{
        if row.contains(0){
            result = -1
        }
    }
    print(result)
    
    
}

solution()

//func solution(){
//    let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
//    let m = firstLine[0]
//    let n = firstLine[1]
//
//    var todayTomatoBox: [[Int]] = []
//    for _ in 0..<n{
//        todayTomatoBox.append(readLine()!.split(separator: " ").map({Int($0)!}))
//    }
//    var tomorrowTomatoBox = todayTomatoBox
//
//    var result = 0
//
//    func checkTomato(_ todayTomatoBox: [[Int]]) -> Bool{
//        for row in todayTomatoBox{
//            for tomato in row{
//                if tomato == 0 {
//                    return false
//                }
//            }
//        }
//        return true
//    }
//
//    let dx = [0,0,-1,1] //상하좌우
//    let dy = [-1,1,0,0]
//
//    func tomorrowTomato(_ todayTomatoBox: [[Int]],_ tomorrowTomatoBox: inout [[Int]], _ row: Int, _ col: Int,_ a: inout Int){
//        if todayTomatoBox[row][col] == 1 {
//            for i in 0..<dx.count{
//                let nowx = col + dx[i]
//                let nowy = row + dy[i]
//                if nowx < 0 || nowx > m-1 || nowy < 0 || nowy > n-1 {
//                    continue
//                } else {
//                    if todayTomatoBox[nowy][nowx] == 0{
//                        tomorrowTomatoBox[nowy][nowx] = 1
//                        a += 1
//                    }
//                }
//            }
//        }
//    }
//
//    while !checkTomato(todayTomatoBox) {
//        var a = 0
//        for row in 0..<n{
//            for col in 0..<m{
//                if todayTomatoBox[row][col] == 1 {
//                    tomorrowTomato(todayTomatoBox,&tomorrowTomatoBox, row, col, &a)
//                }
//            }
//        }
//        if a != 0 {
//            result += 1
//            todayTomatoBox = tomorrowTomatoBox
//        } else {
//            result = -1
//            break
//        }
//
//    }
//    print(result)
//}
//
//solution()
