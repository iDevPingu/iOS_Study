//
//  main.swift
//  1504 - 특정한 최단 경로
//
//  Created by Ick on 2020/09/14.
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

struct EdgeData: Comparable{
    static func < (lhs: EdgeData, rhs: EdgeData) -> Bool {
        lhs.cost < rhs.cost
    }
    var node: Int
    var cost: Int
}

func solution() -> Int{
    let inf = 10000000000
    let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
    let n = firstLine[0]
    let e = firstLine[1]
    var lines: [[(Int,Int)]] = [[(Int,Int)]](repeating: [(Int, Int)](), count: n+1)
    
    
    for _ in 0..<e{
        let data = readLine()!.split(separator: " ").map({Int($0)!})
        lines[data[0]].append((data[1],data[2]))
        lines[data[1]].append((data[0],data[2]))
    }
    
    let edges = readLine()!.split(separator: " ").map({Int($0)!})
    let v1 = edges[0]
    let v2 = edges[1]
    var pq: Heap = Heap<EdgeData>()
    
    var goFrom1: [Int] = [Int](repeating: inf, count: n+1)
    goFrom1[1] = 0
    var goFromV1: [Int] = [Int](repeating: inf, count: n+1)
    goFromV1[v1] = 0
    var goFromV2: [Int] = [Int](repeating: inf, count: n+1)
    goFromV2[v2] = 0
    
    // 1에서 v1으로 가는 최단거리 찾기
    pq.insert(EdgeData(node: 1, cost: 0))
    while(!pq.isEmpty){
        guard let now = pq.delete() else { fatalError() }
        let current = now.node
        let distance = now.cost
        
        if goFrom1[current] < distance {
            continue
        }
        
        for i in 0..<lines[current].count{
            let next = lines[current][i].0
            let nextDistance = lines[current][i].1 + distance
            if nextDistance < goFrom1[next]{
                goFrom1[next] = nextDistance
                pq.insert(EdgeData(node: next, cost: nextDistance))
            }
        }
    }
    
    // v1에서 n으로 가능 최단거리 찾기
    pq = Heap<EdgeData>()
    pq.insert(EdgeData(node: v1, cost: 0))
    while(!pq.isEmpty){
        guard let now = pq.delete() else { fatalError() }
        let current = now.node
        let distance = now.cost
        
        if goFromV1[current] < distance {
            continue
        }
        
        for i in 0..<lines[current].count{
            let next = lines[current][i].0
            let nextDistance = lines[current][i].1 + distance
            if nextDistance < goFromV1[next]{
                goFromV1[next] = nextDistance
                pq.insert(EdgeData(node: next, cost: nextDistance))
            }
        }
    }
    // v2에서 n으로 가는 최단거리 찾기
    pq = Heap<EdgeData>()
    pq.insert(EdgeData(node: v2, cost: 0))
    while(!pq.isEmpty){
        guard let now = pq.delete() else { fatalError() }
        let current = now.node
        let distance = now.cost
        
        if goFromV2[current] < distance {
            continue
        }
        
        for i in 0..<lines[current].count{
            let next = lines[current][i].0
            let nextDistance = lines[current][i].1 + distance
            if nextDistance < goFromV2[next]{
                goFromV2[next] = nextDistance
                pq.insert(EdgeData(node: next, cost: nextDistance))
            }
        }
    }

    if goFrom1[v1] + goFromV1[v2] + goFromV2[n] >= inf && goFrom1[v2] + goFromV2[v1] + goFromV1[n] >= inf{
        return -1
    }
    if goFrom1[v1] + goFromV1[v2] + goFromV2[n] < goFrom1[v2] + goFromV2[v1] + goFromV1[n]{
        return (goFrom1[v1] + goFromV1[v2] + goFromV2[n])
    } else {
        return (goFrom1[v2] + goFromV2[v1] + goFromV1[n])
    }
}
print(solution())
//func solution() -> Int{
//    let inf = 10000000000
//    let firstLine = readLine()!.split(separator: " ").map({Int($0)!})
//    let n = firstLine[0]
//    let e = firstLine[1]
//    var lines: [[[Int]]] = [[[Int]]](repeating: [[Int]](repeating: [], count: 0), count: n+1)
//
//    for _ in 0..<e{
//        let data = readLine()!.split(separator: " ").map({Int($0)!})
//        lines[data[0]].append([data[1],data[2]])
//        lines[data[1]].append([data[0],data[2]])
//    }
//
//    let edges = readLine()!.split(separator: " ").map({Int($0)!})
//    let v1 = edges[0]
//    let v2 = edges[1]
//    var pq: Heap = Heap<EdgeData>()
//
//    var goFrom1: [Int] = [Int](repeating: inf, count: n+1)
//    goFrom1[1] = 0
//    var goFromV1: [Int] = [Int](repeating: inf, count: n+1)
//    goFromV1[v1] = 0
//    var goFromV2: [Int] = [Int](repeating: inf, count: n+1)
//    goFromV2[v2] = 0
//
//    // 1에서 v1으로 가는 최단거리 찾기
//    pq.insert(EdgeData(node: 1, cost: 0))
//    while(!pq.isEmpty){
//        guard let now = pq.delete() else { fatalError() }
//        let current = now.node
//        let distance = now.cost
//
//        if goFrom1[current] < distance {
//            continue
//        }
//
//        for i in 0..<lines[current].count{
//            let next = lines[current][i][0]
//            let nextDistance = lines[current][i][1] + distance
//            if nextDistance < goFrom1[next]{
//                goFrom1[next] = nextDistance
//                pq.insert(EdgeData(node: next, cost: nextDistance))
//            }
//        }
//    }
//
//    // v1에서 n으로 가능 최단거리 찾기
//    pq = Heap<EdgeData>()
//    pq.insert(EdgeData(node: v1, cost: 0))
//    while(!pq.isEmpty){
//        guard let now = pq.delete() else { fatalError() }
//        let current = now.node
//        let distance = now.cost
//
//        if goFromV1[current] < distance {
//            continue
//        }
//
//        for i in 0..<lines[current].count{
//            let next = lines[current][i][0]
//            let nextDistance = lines[current][i][1] + distance
//            if nextDistance < goFromV1[next]{
//                goFromV1[next] = nextDistance
//                pq.insert(EdgeData(node: next, cost: nextDistance))
//            }
//        }
//    }
//    // v2에서 n으로 가는 최단거리 찾기
//    pq = Heap<EdgeData>()
//    pq.insert(EdgeData(node: v2, cost: 0))
//    while(!pq.isEmpty){
//        guard let now = pq.delete() else { fatalError() }
//        let current = now.node
//        let distance = now.cost
//
//        if goFromV2[current] < distance {
//            continue
//        }
//
//        for i in 0..<lines[current].count{
//            let next = lines[current][i][0]
//            let nextDistance = lines[current][i][1] + distance
//            if nextDistance < goFromV2[next]{
//                goFromV2[next] = nextDistance
//                pq.insert(EdgeData(node: next, cost: nextDistance))
//            }
//        }
//    }
//
//    if goFrom1[v1] + goFromV1[v2] + goFromV2[n] >= inf && goFrom1[v2] + goFromV2[v1] + goFromV1[n] >= inf{
//        return -1
//    }
//    if goFrom1[v1] + goFromV1[v2] + goFromV2[n] < goFrom1[v2] + goFromV2[v1] + goFromV1[n]{
//        return (goFrom1[v1] + goFromV1[v2] + goFromV2[n])
//    } else {
//        return (goFrom1[v2] + goFromV2[v1] + goFromV1[n])
//    }
//}
//print(solution())
