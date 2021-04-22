//
//  main.swift
//  [Kakao] 2019 Blind - 길 찾기 게임
//
//  Created by Ick on 2021/04/22.
//

import Foundation

class Node {
    var x: Int
    var y: Int // LEVEL
    var index: Int
    var left: Node?
    var right: Node?
    
    init(x: Int, y: Int, index: Int) {
        self.x = x
        self.y = y
        self.index = index
    }
    init() {
        self.x = 0
        self.y = 0
        self.index = 0
    }
}

extension Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.x < rhs.x
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    // 각 노드의 깊이(y값)에 따라 노드를 트리에 배치해야하므로 레벨별 노드를 구분하기 위한 딕셔너리
    var levelMap: [Int: [Node]] = [:]
    
    // 주어진 nodeinfo에서 레벨별로 노드를 분류한다
    for i in 0..<nodeinfo.count {
        let value = levelMap[nodeinfo[i][1], default: []]
        let newNode = Node(x: nodeinfo[i][0], y: nodeinfo[i][1], index: i)
        levelMap[nodeinfo[i][1]] = value + [newNode]
    }
    // 레벨의 종류를 levelMap의 Key값으로 얻어낸다
    var level: [Int] = []
    for key in levelMap.keys {
        level.append(Int(key))
        levelMap[key]!.sort()
    }
    // 딕셔너리는 순서를 보장하지 않으므로 얻어낸 level을 정렬한다.
    level.sort(by: >)
    
    // root 노드를 만든다.
    // 가장 높은 레벨의 노드는 하나인데, 그 노드가 바로 root 노드이다.
    let root: Node = levelMap[level[0]]!.first!
    
    // root, insert를 넣으면 root노드의 적절한 위치에 insert 노드를 넣는 메서드
    func insertNode(root: Node?, insert: Node?) {
        guard root != nil, insert != nil else { return }
        // 만약 root의 x값이 insert의 x값보다 크다면 왼쪽 노드에 추가해야한다.
        if root!.x > insert!.x {
            // 만약 현재 root노드의 왼쪽 노드가 없다면 바로 집어넣는다.
            if root?.left == nil {
                root?.left = insert
            } else {
                // 만약 현재 root 노드의 왼쪽노드가 존재한다면 그 노드를 root노드로 설정하고 다시 insertNode를 수행한다.
                insertNode(root: root?.left, insert: insert)
            }
            // 만약 root의 x값이 insert의 x값보다 작다면 오른쪽 노드에 추가해야한다.
        } else if root!.x < insert!.x {
            if root?.right == nil {
                root?.right = insert
            } else {
                insertNode(root: root?.right, insert: insert)
            }
        }
    }
    // 레벨순서대로 root노드에 노드들을 집어넣는다.
    for i in 1..<level.count {
        let nowLevelNodes = levelMap[level[i], default: []]
        for node in nowLevelNodes {
            insertNode(root: root, insert: node)
        }
    }
    
    // 전위순회를 얻어내는 메서드
    func getPreorder(root: Node?) -> [Int] {
        guard let root = root else { return [] }
        let leftTree = getPreorder(root: root.left)
        let rightTree = getPreorder(root: root.right)
        
        return [root.index + 1] + leftTree + rightTree
    }
    // 후위순회를 얻어내는 메서드
    func getPostOrder(root: Node?) -> [Int] {
        guard let root = root else { return [] }
        let leftTree = getPostOrder(root: root.left)
        let rightTree = getPostOrder(root: root.right)
        return leftTree + rightTree + [root.index + 1]
    }
    
    let preorder: [Int] = getPreorder(root: root)
    let postorder: [Int] = getPostOrder(root: root)
    
    return [preorder, postorder]
}

print(solution([[5,3],[11,5],[13,3],[3,5],[6,1],[1,3],[8,6],[7,2],[2,2]]))
