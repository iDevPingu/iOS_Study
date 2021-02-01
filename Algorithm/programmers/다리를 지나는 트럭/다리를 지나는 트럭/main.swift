//
//  main.swift
//  다리를 지나는 트럭
//
//  Created by Ick on 2020/11/14.
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

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var weights = Array(truck_weights.reversed())
    
    var time: Int = 0
    var nowWeight: Int = 0
    var crossedTruck: [Int] = []
    var crossingTruck: [[Int]] = []
    
    while crossedTruck.count != truck_weights.count {
        if weights.count == 0 {
            for i in 0..<crossingTruck.count {
                crossingTruck[i][1] += 1
            }
            for _ in 0..<crossingTruck.count {
                if crossingTruck[0][1] >= bridge_length {
                    crossedTruck.append(crossingTruck[0][0])
                    nowWeight -= crossingTruck.removeFirst()[0]
                }
            }
            
        } else {
            for i in 0..<crossingTruck.count {
                crossingTruck[i][1] += 1
            }
            
            for _ in 0..<crossingTruck.count {
                if crossingTruck[0][1] >= bridge_length {
                    crossedTruck.append(crossingTruck[0][0])
                    nowWeight -= crossingTruck.removeFirst()[0]
                }
            }
            
            if weights.last! + nowWeight <= weight {
                nowWeight += weights.last!
                crossingTruck.append([weights.popLast()!, 0])
            }
        
            
        }
        time += 1
    }
    
    return time
}

print(solution(2, 10, [7,4,5,6]))
print(solution(100, 100, [10]))
//print(solution(100, 100, [10,10,10,10,10,10,10,10,10,10]))
print(solution(10, 10, [10]))
