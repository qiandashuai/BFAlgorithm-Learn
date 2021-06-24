//
//  BFRecursion.swift
//  BFAlgorithm
//
//  Created by blackstone jericho on 2021/6/6.
//

import Foundation



public class ListNode {
    public var value: Int
    public var next: ListNode?
    public init() {
        self.value = 0
        self.next = nil
    }
    public init(_ value: Int, _ next:ListNode?) {
        self.value = value
        self.next = next
    }
}


class RecursionSolution {
    
    /*
     1137. N-th Tribonacci Number
     */
    func tribonacci(_ n: Int) -> Int {
            
        if n == 0 {
            return 0
        }
        
        if  n == 1 {
            return 1
        }
        
        if n == 2 {
            return 1
        }
        
        var sub0 = 0
        var sub1  = 1
        var sub2 = 1
        var result = 0
        
        for _ in 3...n {
            result = sub0 + sub1 + sub2
            sub0 = sub1
            sub1 = sub2
            sub2 = result
        }
        
        return result
    }

    var solutionDict = [Int:Int]()
      
      func tribonacci2(_ n: Int) -> Int {
          if n == 0 {
              return 0
          }
          
          if  n == 1 {
              return 1
          }
          
          if n == 2 {
              return 1
          }
          
          
          
          if solutionDict.keys.contains(n) {
              return solutionDict[n]!
          }
          
          let result = tribonacci(n-1) + tribonacci(n-2) + tribonacci(n-3)
          solutionDict[n] =  result
          
          
          return result
      }
    
    /*
     21. Merge Two Sorted Lists
     */
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil else {
            return l2
        }
        
        guard l2 != nil else {
            return l1
        }
        
        if l1!.value < l2!.value{
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        } else {
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        }
        
    }

}
