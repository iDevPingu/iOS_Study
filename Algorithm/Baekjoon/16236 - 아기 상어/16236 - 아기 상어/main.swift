//
//  main.swift
//  16236 - 아기 상어
//
//  Created by Ick on 2021/01/14.
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

class Shark {
    var x: Int
    var y: Int
    var size: Int
    var eating: Int
    var time: Int
    init(x: Int, y: Int, size: Int, eating: Int, time: Int) {
        self.x = x
        self.y = y
        self.size = size
        self.eating = eating
        self.time = time
    }
}

func solution() {
    let n = Int(readLine()!)!
    var water: [[Int]] = []
    var findShark: Bool = false
    var sharkSize: Int = 2
    var shark: Shark?
    for i in 0..<n {
        let info = readLine()!.split(separator: " ").map({Int(String($0))!})
        if !findShark {
            for j in 0..<info.count {
                if info[j] == 9 {
                    shark = Shark(x: j, y: i, size: 2, eating: 0, time: 0)
                    findShark = true
                }
            }
        }
        water.append(info)
    }
    
    // 상하좌우
    // 상좌우하
    let dx: [Int] = [0,-1,1,0]
    let dy: [Int] = [-1,0,0,1]
    
    var time: Int = 0
    // 지금까지 먹은 물고기 수
    var eating: Int = 0
    let queue = Queue([Shark]())
    queue.push(shark!)
    
    while !queue.isEmpty {
        let now = queue.pop()!
        
        for i in 0..<4{
            let nx = now.x + dx[i]
            let ny = now.y + dy[i]
            
            if nx < 0 || ny < 0 || nx > n-1 || ny > n-1 {
                continue
            } else {
                if water[ny][nx] == sharkSize {
                    queue.push(Shark(x: nx, y: ny, size: now.size, eating: now.eating, time: now.time + 1))
                } else if water[ny][nx] < sharkSize {
                    water[ny][nx] = 0
                    eating += 1
                    if eating == sharkSize {
                        sharkSize += 1
                        eating = 0
                    }
                    queue.push([ny,nx,now[2]+1])
                }
            }
        }
    }
    print(sharkSize)
    
    
    
}

solution()
