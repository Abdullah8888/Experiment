//
//  LeetcodeTwo.swift
//  Experiment
//
//  Created by Abdullah on 28/11/2022.
//

import Foundation
//Definition for a binary tree node.
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
class Solution {
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        var nodeList: [TreeNode?] = []
        var sum = 0
        var count = 0
        var avgArr: [Double] = []
        
        nodeList.append(root)
        
        while !nodeList.isEmpty {
            
            var tempNodeList: [TreeNode?] = []
            if !nodeList.isEmpty {
                for node in nodeList {
                    sum = sum + node!.val
                    count = count + 1

                    if node?.left != nil {
                        tempNodeList.append(node?.left)
                    }
                    if node?.right != nil {
                        tempNodeList.append(node?.right)
                    }
                }
                nodeList = tempNodeList
                
                avgArr.append(Double(sum)/Double(count))
                sum = 0
                count = 0
            }
        }
        
        return avgArr
    }
}
