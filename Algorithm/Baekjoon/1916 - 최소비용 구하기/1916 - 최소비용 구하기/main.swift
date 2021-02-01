//
//  main.swift
//  1916 - 최소비용 구하기
//
//  Created by Ick on 2020/09/22.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation


public struct Heap<T> {
  var nodes: [T] = []
  let comparer: (T,T) -> Bool

  var isEmpty: Bool {
      return nodes.isEmpty
  }

  init(comparer: @escaping (T,T) -> Bool) {
      self.comparer = comparer
  }

  func peek() -> T? {
      return nodes.first
  }

  mutating func insert(_ element: T) {
      var index = nodes.count

      nodes.append(element)

      while index > 0, !comparer(nodes[index],nodes[(index-1)/2]) {
          nodes.swapAt(index, (index-1)/2)
          index = (index-1)/2
      }
  }

  mutating func delete() -> T? {
      guard !nodes.isEmpty else {
          return nil
      }

      if nodes.count == 1 {
          return nodes.removeFirst()
      }

      let result = nodes.first
      nodes.swapAt(0, nodes.count-1)
      _ = nodes.popLast()

      var index = 0

      while index < nodes.count {
          let left = index * 2 + 1
          let right = left + 1

          if right < nodes.count {
              if comparer(nodes[left], nodes[right]),
                  !comparer(nodes[right], nodes[index]) {
                  nodes.swapAt(right, index)
                  index = right
              } else if !comparer(nodes[left], nodes[index]){
                  nodes.swapAt(left, index)
                  index = left
              } else {
                  break
              }
          } else if left < nodes.count {
              if !comparer(nodes[left], nodes[index]) {
                  nodes.swapAt(left, index)
                  index = left
              } else {
                  break
              }
          } else {
              break
          }
      }

      return result
  }
}

extension Heap where T: Comparable {
    init() {
        self.init(comparer: >)
    }
}
struct EdgeData : Comparable{
    static func < (lhs: EdgeData, rhs: EdgeData) -> Bool {
        lhs.cost < rhs.cost
    }
    
    var cost : Int
    var node : Int
}

func solution(){
    let inf = 777777777
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    
    var graph: [[(Int,Int)]] = [[(Int,Int)]](repeating: [(Int, Int)](), count: n)
    for _ in 0..<m{
        let data = readLine()!.split(separator: " ").map({Int(String($0))!})
        graph[data[0]-1].append((data[1]-1,data[2]))
    }
    
    let lastLine = readLine()!.split(separator: " ").map({Int(String($0))!})
    let start = lastLine[0] - 1
    let depart = lastLine[1] - 1
    
    var result: [Int] = [Int](repeating: inf, count: n)
    result[start] = 0
    
    var pq: Heap<EdgeData> = Heap<EdgeData>()
    pq.insert(EdgeData(cost: 0, node: start))
    
    while (!pq.isEmpty) {
        let now = pq.delete()!
        if result[now.node] < now.cost{
            continue
        }
        
        for next in graph[now.node]{
            if next.1 + now.cost < result[next.0]{
                result[next.0] = next.1 + now.cost
                pq.insert(EdgeData(cost: next.1 + now.cost, node: next.0))
            }
        }
    }
    
    print(result[depart])
}

solution()
