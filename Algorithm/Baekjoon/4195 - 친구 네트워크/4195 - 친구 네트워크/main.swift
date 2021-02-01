//
//  main.swift
//  4195 - 친구 네트워크
//
//  Created by Ick on 2020/09/22.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution(){
    var friendList: [String:Int] = [String:Int]()
    var parent: [Int] = [Int]()
    let testCase = Int(readLine()!)!
    var personCount = 0
    func find(index: Int) -> Int{
        if parent[index] == index {
            return index
        } else {
            parent[index] = find(index: parent[index])
            return parent[index]
        }
    }
    func union(person1: Int, person2: Int){
        let parent1 = find(index: person1)
        let parent2 = find(index: person2)
        if parent1 < parent2 {
            parent[parent2] = parent[parent1]
        } else {
            parent[parent1] = parent[parent2]
        }
    }
    for _ in 0..<testCase{
        let f = Int(readLine()!)!
        for _ in 0..<f{
            let newFriend = readLine()!.split(separator: " ").map({String($0)})
            let person1 = newFriend[0]
            let person2 = newFriend[1]
            if !friendList.keys.contains(person1) {
                friendList[person1] = personCount
                parent.append(personCount)
                personCount += 1
            }
            if !friendList.keys.contains(person2) {
                friendList[person2] = personCount
                parent.append(personCount)
                personCount += 1
            }
            union(person1: friendList[person1]!, person2: friendList[person2]!)
            print(friendList)
            print(parent)
            
        }
        friendList.removeAll()
        personCount = 0
        parent = []
    }
    

}
solution()

