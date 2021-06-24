//
//  BFStack.swift
//  BFAlgorithm
//
//  Created by blackstone jericho on 2021/6/4.
//

import UIKit

class BFStack: NSObject {
    
    /*
     20. Valid Parentheses
     */
    func isValid(_ s: String) -> Bool {
        
        guard s.count > 1 else {
            return false
        }
        
        guard s.count % 2 == 0 else {
            return false
        }
        
        var stack = [Character]()

        let originInout = Array(s)
        
        let dict = ["}":"{","]":"[",")":"("]

        for item in originInout {
            if dict.keys.contains(String(item)) {
                print(stack)
                if stack.count == 0 || dict[String(item)] != String(stack.last!) {
                    return false
                }
                stack.popLast()
            } else {
                stack.append(item)
            }
            print(stack)
        }
        
        return stack.isEmpty
    }
    
    /*
     155. Min Stack
     */

    class MinStack {

        var stack = [Int]()
        var count = 0
        var minStack = [Int]()
        
        init() {

        }
        
        func push(_ val: Int) {

            if  let firstVal = minStack.firstIndex(where: { $0 > val }) {
                print(firstVal)
                minStack.insert(val, at: firstVal)
            } else {
                minStack.append(val)
            }
            
            stack.append(val)
            
            print("------***********------")
            print("mini stack --- \(minStack)")
            print(stack)
        }
        
        func pop() {
            
           let top = stack.popLast()!
            
            let firstIndex =  minStack.firstIndex(where: {$0 == top})
            minStack.remove(at:firstIndex!)
            
            print("current mini n is \(minStack)")
            print(stack)

        }
        
        func top() -> Int? {
            return stack.last
        }
        
        func getMin() -> Int? {
            return minStack.first
        }
    }
    
    /*
     844. Backspace String Compare
     */
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        guard s.count > 0 && t.count > 0 else {
            return false
        }
        
        var originS = Array(s)
        var originT = Array(t)
        
        var stackS = [Character]()
        var stackT = [Character]()
        var sepeciC = Character("#")
        
        for item in originS {
            if item == sepeciC {
                stackT.popLast()
            } else {
                stackT.append(item)
            }
        }
        
        print(originS)
        
        for item in originT {
            if item == sepeciC {
                stackS.popLast()
            } else {
                stackS.append(item)
            }
        }
        
        return stackS == stackT
    }
    
    /*
     1021. Remove Outermost Parentheses
     */
    
    
    func removeOuterParentheses(_ s: String) -> String {
        
        guard s.count > 1 else {
            return s
        }
        
        let originString = Array(s)
        
        var leftStack = [Character]()
        var rightQueue = [Character]()
        let startC = Character("(")
        
        for item in originString {
            if item == startC {
                if leftStack.last != nil {
                    rightQueue.append(item)
                }
                leftStack.append(item)
            } else {
               leftStack.removeLast()
                if leftStack.last != nil {
                    rightQueue.append(item)
                }
            }
        }
        
        return String(rightQueue)

    }
    
    /*
     1047. Remove All Adjacent Duplicates In String
     */
    
    func removeDuplicates(_ s: String) -> String {

        guard s.count > 1 else {
            return s
        }
        
        let originS = Array(s)
        
        var stack = [Character]()
        
        for item in originS {
            if item == stack.last {
                stack.popLast()
            } else {
                stack.append(item)
            }
        }
        return String(stack)
    }
    
    /*
     1544. Make The String Great
     */
    func makeGood(_ s: String) -> String {
        
        guard s.count > 1 else {
            return s
        }
        
        let originS = Array(s)
        var stack = [Character]()
        
        for item in originS {
            
            if stack.last == nil {
                stack.append(item)
            } else {
                let last = stack.last
                if item.isUppercase && last!.isLowercase && last!.uppercased() == String(item) {
                    stack.popLast()
                } else if item.isLowercase && last!.isUppercase && last!.lowercased() == String(item) {
                    stack.popLast()
                } else {
                    stack.append(item)
                }
            }
        }
        
        return String(stack)
        
    }
    
    /*
     225. Implement Stack using Queues
     */
    
    class MyStack1 {

        var curStack = [Int]()

        /** Initialize your data structure here. */
        init() {

        }
        
        /** Push element x onto stack. */
        func push(_ x: Int) {
            curStack.append(x)
        }
        
        /** Removes the element on top of the stack and returns that element. */
        func pop() -> Int {
            var tempStack = [Int]()
            for i in 0..<curStack.count - 1 {
                tempStack.append(curStack[i])
            }
            let last = curStack[curStack.count - 1]
           curStack.removeAll()
            
            for item in tempStack {
                curStack.append(item)
            }
            return last
        }
        
        /** Get the top element. */
        func top() -> Int {
            var result = 0
            for i in 0..<curStack.count {
                if i == curStack.count - 1 {
                    result =  curStack[i]
                }
            }
            return result
        }
        
        /** Returns whether the stack is empty. */
        func empty() -> Bool {
            return curStack.isEmpty
        }
    }
    
    /*
     232. Implement Queue using Stacks
     */
    
    class MyQueue {

        var curStack = [Int]()
        
        init() {

        }
        
        /** Push element x to the back of queue. */
        func push(_ x: Int) {
            curStack.append(x)
        }
        
        /** Removes the element from in front of queue and returns that element. */
        func pop() -> Int {
            
            if curStack.count == 0 {
                return 0
            }
            var tempStack = [Int]()
            
            for item in curStack {
                tempStack.append(item)
            }
            curStack.removeAll()
            
            let first = tempStack.first!
            tempStack.removeFirst()
            curStack = tempStack
            return first
        }
        
        /** Get the front element. */
        func peek() -> Int {
            if curStack.count == 0 {
                return 0
            }
            var tempStack = [Int]()
            
            for item in curStack {
                tempStack.append(item)
            }
            curStack.removeAll()
            
            let first = tempStack.first!
            curStack = tempStack
            return first
        }
        
        /** Returns whether the queue is empty. */
        func empty() -> Bool {
            return curStack.isEmpty
        }
    }


}

