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
    func removeAll() {
        dequeue = []
        enqueue = []
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
//    var sharkSize: Int = 2
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
    
    // 가장 위에 있는 물고기 혹은 가장 왼쪽에 있는 물고기를 먼저 먹어야 하므로
    // 상좌우하
    let dx: [Int] = [0,-1,1,0]
    let dy: [Int] = [-1,0,0,1]
    
    let queue = Queue([[shark!.x, shark!.y]])
    var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    var canEatNow: [[Int]] = []
    
    func bfs() {
        while !queue.isEmpty {
            let now = queue.pop()!
            for i in 0..<dx.count {
                let newX = now[0] + dx[i]
                let newY = now[1] + dy[i]
                if newX < 0 || newY < 0 || newX >= water.count || newY >= water.count {
                    continue
                } else {
                    // 이미 방문한곳이거나 물고기가 상어보다 큰 경우엔 넘어간다
                    if visited[newY][newX] || water[newY][newX] > shark!.size {
                        continue
                    } else {
                        // 이미 물고기가 없거나 크기가 같아서 지나갈 수만 있을 때
                        if water[newY][newX] == 0 || water[newY][newX] == shark!.size {
                            
                        } else {
                            // 물고기가 상어보다 작다? -> 먹을 수 있는 경우의수에 추가!
                            canEatNow.append([newX, newY])
                        }
                        visited[newY][newX] = true
                        queue.push([newX, newY])
                    }
                }
            }
        }
    }
    
    while true {
        bfs()
        
        if canEatNow.isEmpty {
            break
        } else {
            canEatNow.sort { (fish1, fish2) -> Bool in
                return fish1[2] < fish2[2]
            }
            let distance = canEatNow[0][2]
            canEatNow = canEatNow.filter { (fish) -> Bool in
                return fish[2] == distance
            }
            
            canEatNow.sort { (fish1, fish2) -> Bool in
                return fish1[1] < fish1[2]
            }
            let minY = canEatNow[0][1]
            canEatNow = canEatNow.filter({ (fish) -> Bool in
                return fish[1] == minY
            })
            canEatNow.sort { (fish1, fish2) -> Bool in
                return fish1[0] < fish2[0]
            }
            let fish = canEatNow[0]
            water[shark!.y][shark!.x] = 0
            water[fish[1]][fish[0]] = 9
            shark!.x = fish[0]
            shark!.y = fish[1]
            shark!.time += fish[2]
            shark!.eating += 1
            
            if shark!.eating == shark!.size {
                shark!.size += 1
                shark!.eating = 0
            }
            canEatNow = []
            visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
            queue.push([shark!.x, shark!.y])
        }
    }
    print(shark!.time)
}

solution()
