//
//  main.swift
//  2263 - 트리의 순회
//
//  Created by Ick on 2020/10/03.
//  Copyright © 2020 ick. All rights reserved.
//

import Foundation

func solution(){
    let n = Int(readLine()!)!
    let inorder = readLine()!.split(separator: " ").map({Int(String($0))!})
    var inorderIndex: [Int] = [Int](repeating: 0, count: n+1)
    for i in 0..<inorder.count {
        inorderIndex[inorder[i]] = i
    }
    let postorder = readLine()!.split(separator: " ").map({Int(String($0))!})
    
    var preorder: [Int] = []
    func makePreorder(_ inorderStart: Int, _ inorderEnd: Int, _ postorderStart: Int, _ postorderEnd: Int) {
        if inorderStart > inorderEnd || postorderStart > postorderEnd {
            return
        }
        preorder.append(postorder[postorderEnd])
        var index = inorderIndex[postorder[postorderEnd]]
        
        makePreorder(inorderStart, index - 1, postorderStart, postorderStart + index - inorderStart - 1)
        makePreorder(index + 1, inorderEnd, postorderStart + index - inorderStart, postorderEnd - 1)
        
    }
//    var postIndex: Int = postorder.count - 1
//    func makePreorder(inorderStart: Int, inorderEnd: Int) -> [Int] {
//        if inorderStart == inorderEnd {
//            return [inorder[inorderEnd]]
//        }
//        // 후위순회를 처음부터 돈다.
//        for i in stride(from: postIndex, to: -1, by: -1) {
//            if inorder[inorderStart..<inorderEnd].contains(postorder[i]) {
//                for j in inorderStart..<inorderEnd {
//                    // 중위순회에서 루트가 어딘지 찾는 곳
//                    if inorder[j] == postorder[i] {
//                        let temp = postIndex
//                        postIndex = i
//                        let left = makePreorder(inorderStart: 0, inorderEnd: j)
//                        postIndex = temp
//                        let right = makePreorder(inorderStart: j + 1, inorderEnd: 2 * j)
//                        return [postorder[i]] + left + right
//                    }
//                }
//            }
//        }
//        return []
//    }
//    preorder = makePreorder(tempInorder: inorder)
    makePreorder(0, n - 1, 0, n - 1)
    var result = ""
    for i in preorder {
        result += "\(i) "
    }
    print(result)
        
}

solution()
//7
//4 2 1 5 3 6 7
//4 2 5 7 6 3 1

//7
//1 2 4 7 6 3 5
//1 4 2 6 5 3 7
