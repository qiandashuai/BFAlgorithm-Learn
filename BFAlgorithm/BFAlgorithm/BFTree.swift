//
//  BFTree.swift
//  BFAlgorithm
//
//  Created by blackstone jericho on 2021/6/17.
//

import UIKit


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class BFTree: NSObject {
    /*
     前序遍历
     */
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        
        if root == nil {
            return []
        }
        
        var result = [Int]()
        
        func preOrder(_ root: TreeNode?, _ result: inout [Int]){
            if root == nil {
                return
            }
            preOrder(root?.left, &result)
            preOrder(root?.right, &result)
            result.append(root!.val)
        }
        
        preOrder(root,&result)
        
        return result
    }
    
    /*
     层序遍历
     */
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result:[[Int]] = []
        if root == nil {
            return result
        }
        var levelQueue:[TreeNode?] = [root]
        
        while levelQueue.count != 0 {
            var currentLevel:[Int] = []
            let LevelCount = levelQueue.count
            
            for _ in 0..<LevelCount{
                let node = levelQueue.removeFirst()
                currentLevel.append(node!.val)
                if node?.left != nil {
                    levelQueue.append(node?.left)
                }
                
                if node?.right != nil {
                    levelQueue.append(node?.right)
                }
            }
            result.append(currentLevel)
        }
        
        return result
    }
}
