//
//  array.swift
//  
//
//  Created by blackstone jericho on 2021/2/2.
//

import Foundation

// 283 move-zero
func moveZero(_ numers: inout [Int]) -> [Int] {
    if numers.count < 2 {
        return numers
    }
    
    var zeroIndex = 0
    
    for index in (0..<numers.count) {
        if numers[index] != 0 {
            numers.swapAt(zeroIndex, index)
            zeroIndex = zeroIndex + 1;
        }
    }
    return numers
}

// 11. Container With Most Water
// 1. 暴力法: 枚举左柱子

func MaxArea(_ height: [Int]) -> Int {
    
    var resultArray:[Int] = [Int]()
    
    
    for i in 0 ..< height.count - 1 {
        var maxArea = 0
        for j in (i + 1) ..< height.count {
            maxArea = max(maxArea, (j - i ) * min(height[i], height[j]))
            resultArray.append(maxArea);
        }
    }
    
    
    return resultArray.max()!
}

let maxArea =  MaxArea([4,3,2,1,4])
//print(maxArea)

// 2. 双指针解法

func MaxArea2(_ heights: [Int]) -> Int {
    if heights.count < 1 {
        return 0
    }
    
    if heights.count == 2 {
        return min(heights.first!, heights.last!)
    }
    
    var maxWater = (heights.count - 1) * min(heights[0], heights.last!)
    var right = heights.count - 1
    var left = 0
    while left < right {
        if heights[left] < heights[right] {
            left = left + 1
        } else {
            right = right - 1
        }
        maxWater = max(maxWater, (right - left ) * min(heights[left], heights[right]) )
    }
    return maxWater
    
}

let maxArea2 =  MaxArea2([2,3,4,5,18,17,6])
print(maxArea2)


// 70 climb stairs
func climbStairs(_ n : Int) -> Int {
    var total = 0
    
    if n <= 2 {
        return n
    }
    
    var (f1, f2) = (1, 2)
    
    for _ in 3...n  {
        total = f1 + f2
        f1 = f2
        f2 = total
    }
    
    return total
}

//func climbStairs(_ n : Int) -> Int {
//    var total = 0
//
//    if n <= 2 {
//        return n
//    }
//
//    var (f1, f2) = (1, 2)
//
//    for _ in 3...n  {
//        total = f1 + f2
//        f1 = f2
//        f2 = total
//    }
//
//    return total
//}
//
//print(climbStairs(2))
//print(climbStairs(3))
//print(climbStairs(5))


// 1. 3重循环遍历, 超出时间。。
//func threeSum(_ nums: [Int]) -> [[Int]] {
//    var result:[[Int]] = [];
//
//    if nums.count < 3 {
//        return [];
//    }
//
//    for i in 0..<nums.count-2 {
//        for j in i+1..<nums.count-1 {
//            for k in j+1..<nums.count {
//                if nums[i] + nums[j] + nums[k] == 0 {
//                   let currentArray =  [nums[i], nums[j], nums[k]].sorted()
//                    if !result.contains(currentArray) {
//                        result.append([nums[i], nums[j], nums[k]].sorted())
//                    }
//                }
//            }
//        }
//    }
//
//
//
//    return result
//}

// 2. 排序+ 双指针
// 先排序，双指针+左右下标推进。。。。

func threeSum2(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 {
        return []
    }
    
    let numbers = nums.sorted()
    print(numbers)
    var res:[[Int]] = []
    
    for k in 0..<numbers.count - 2 {
        if numbers[k] > 0 {
            break
        }
        if k > 0 && numbers[k] == numbers[k-1] {
            print("jump k is \(k)")
            continue
        }
        print("current k is \(k)")
        
        var ( i, j ) = (k + 1, numbers.count - 1)
        
        while i < j {
            let a = numbers[i] + numbers[j] + numbers[k]
            print("current \(numbers[k]) --- \(numbers[i]) ----\(numbers[j])")
            
            if a < 0 {
                i = i + 1
                while i < j && numbers[i] == numbers[i - 1] {
                    i = i + 1
                }
            } else if (a > 0) {
                j = j - 1
                while i < j && numbers[j] == numbers[j + 1] {
                    j = j - 1
                }
            } else {
                res.append([numbers[k], numbers[i], numbers[j]])
                i = i  + 1
                j = j - 1
                while i < j && numbers[i] == numbers[i - 1] {
                    i = i + 1
                }
                while i < j && numbers[j] == numbers[j + 1] {
                    j = j - 1
                }
            }
        }
    }
    
    
    
    return res
}

//let result = threeSum2([0,0,0,0,0,0,0,0])
//print(result)

let result1 = threeSum2([-2,0,3,-1,4,0,3,4,1,1,1,-3,-5,4,0])
print(result1)


//
//func checkMoney(_ moneys: [Int]) -> Bool {
//
//    if moneys.count < 1 || moneys.first != 5 {
//        return false
//    }
//
//    var i = 0
//
//    for j in 1 ..< moneys.count - 1 {
//        if moneys[j] != 5{
//            var currentMoney = moneys[j]
//            for index in i..<j {
//               currentMoney = currentMoney - moneys[i]
//                i = i + 1
//                if currentMoney == 0 {
//                    break
//                }
//            }
//            if currentMoney != 0 {
//                return false
//            }
//        }
//    }
//
//    return true
//}
//
//let cancheck = checkMoney([5, 5, 10, 5, 20])
//print(cancheck)


// 链表: 206, 141

// 反转单链表
public class ListNode {
    public var val: Int?
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func reverseList(_ head: ListNode?) -> ListNode? {
    var pre:ListNode? = nil
    var cur:ListNode? = head
    
    while cur != nil {
        let tempNode = cur?.next
        cur?.next = pre
        pre = cur
        cur = tempNode
    }
    return pre
}

let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)
let node5 = ListNode(5)
let node6 = ListNode(6)
let node7 = ListNode(7)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6
node6.next = node7

var cur:ListNode? = node1
while cur?.next != nil {
    cur = cur?.next
    print("current node is \(cur!.val as Optional)")
    
}


// 141 环形链表，given head, the head od a linked list ,determine if the linked list has a cycle in it

// 1. hasMap , cache all node , the check is contained the node

func hasCycle(_ head: ListNode?) -> Bool {
    
    if head == nil || head?.next == nil {
        return false
    }
    
    var slow = head
    var fast = head?.next
    
    while slow !== fast {
        if fast == nil || fast?.next == nil {
            return false
        }
        
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    return true
 }


