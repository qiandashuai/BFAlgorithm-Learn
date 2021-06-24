//
//  LinkedList.swift
//  BFAlgorithm
//
//  Created by blackstone jericho on 2021/6/1.
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


class linkedListSolution {
    
    /*
     21. Merge Two Sorted Lists
     */
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
        guard  l1 != nil || l2 != nil  else {
            print("ni")
            return nil
        }
    
    
        guard l1 != nil else {
            print("ri")
            return l2
        }
    
        guard l2 != nil else {
            print("li")
            return l1
        }
    
    
        var currentL = l1
        var currentR = l2
        var preHead = ListNode(-1, nil)
        var resut:ListNode? = preHead
        print(currentL)
    
        while currentL != nil && currentR != nil {
            if currentL!.value <= currentR!.value {
                resut?.next = currentL
                currentL = currentL?.next
            } else {
                resut?.next = currentR
                currentR = currentR?.next
            }
            resut = resut?.next
        }
    
    
        if currentL != nil {
            resut?.next = currentL
        } else {
            resut?.next = currentR
        }
    
        return preHead.next
    }
    
    /*
     83. Remove Duplicates from Sorted List
     */
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return head
        }

        guard head?.next != nil else {
            return head
        }
        
        var result:ListNode? = head

        while result?.next != nil {
            if result?.value == result?.next?.value {
                result?.next = result?.next?.next
            } else {
                result = result?.next
            }
        }


        return head
    }
    
    /*
     141. Linked List Cycle
     */
    func hasCycle(_ head: ListNode?) -> Bool {
        guard head != nil else {
            return false
        }
        
        guard head?.next != nil else {
            return false
        }
        
        
        var slowPoint = head
        var fastPoint = head?.next
        
        while slowPoint?.next != nil {
            if slowPoint === fastPoint {
                return true
            }
            slowPoint = slowPoint?.next
            fastPoint = fastPoint?.next?.next
        }
        
        return false
    }
    /*
     160. Intersection of Two Linked Lists
     */
    
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        
        guard headA != nil && headB != nil else {
            return nil
        }
        
        var result = headA
        var preB = headB
        
        
        while result !== preB {
            if result != nil {
                result = result?.next
            } else {
                result = headB
            }
            
            if preB != nil {
                preB = preB?.next
            } else {
                preB = headA
            }
        }
        
        return result
    }
    /*
     203. Remove Linked List Elements
     */
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        
        guard head != nil else {
            return nil
        }
        
        guard !(head?.next == nil && head?.value == val) else {
            return nil
        }
        
        let preHead:ListNode? = ListNode(-1, head)
        preHead?.next = head
        var result = preHead
        
        while result != nil  {
            if result?.next?.value == val {
                result?.next = result?.next?.next
                continue
            }
            result = result?.next
        }
        return preHead?.next
    }
    
    /*
     206. Reverse Linked List
     */
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return nil
        }
        
        guard head?.next != nil else {
            return head
        }
        
        var pre:ListNode? = nil
        var curr = head
        
        while curr != nil {
            let next = curr?.next
            curr?.next = pre
            pre = curr
            curr = next
        }
        
        return pre
    }

    
    /*
     234. Palindrome Linked List
     */
    func isPalindrome(_ head: ListNode?) -> Bool {

        guard head != nil else {
            return false
        }

        guard  head?.next != nil else {
            return true
        }

        guard head?.next?.next != nil else {
            print("okok")
            return head?.value == head?.next?.value
        }
        
        var midNode:ListNode? = middleNodeOfList(head)
        
        var lastNode:ListNode? = reversedListNode(midNode?.next)
        
        print(midNode?.value)
        print(lastNode?.value)
        
        var start = head
        
        while lastNode != nil {
            
            print("current stary --- \(start?.value)")
            print("pre stary --- \(lastNode?.value)")
            if lastNode?.value !=  start?.value {
                return false
            }
            start = start?.next
            lastNode = lastNode?.next
        }
        return true
    }
    
    func middleNodeOfList(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        while fast?.next != nil && fast?.next?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }

    func reversedListNode(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return nil
        }
        
        guard  head?.next != nil else {
            return head
        }
        
        var pre:ListNode? = nil
        var cur = head
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }
    
    /*
     876. Middle of the Linked List
     Given a non-empty, singly linked list with head node head, return a middle node of linked list.

     If there are two middle nodes, return the second middle node.
     */
    func middleNode(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
           return head
        }
        guard head?.next != nil else {
            return head
        }
        var fast = head
        var slow = head
        while fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
    
    /*
     1290. Convert Binary Number in a Linked List to Integer
     */
    
    func getDecimalValue(_ head: ListNode?) -> Int {
        var lastNode = reversedListNode(head)
        
        var current = 0
        var result:Decimal = 0
        while lastNode != nil {
            if lastNode?.value != 0 {
                result += pow(2, current)
            }
            lastNode = lastNode?.next
            current += 1
        }
        
        return Int(truncating: NSDecimalNumber(decimal: result))
    }
    
    /*
     面试题 02.01. Remove Duplicate Node LCCI
     */
    
    func removeDuplicateNodes(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return head
        }
        
        guard  head?.next != nil  else {
            return head
        }
        
        var hashSet = Set<Int>()
        hashSet.insert(head!.value)
        
        var curr = head
        while curr?.next != nil {
            let temp = curr?.next
            if !hashSet.contains(temp!.value) {
                hashSet.insert(temp!.value)
                curr = curr!.next
            } else {
                curr!.next = curr!.next?.next
            }
        }
        
        return head
    }
}
/*
 92. Reverse Linked List II
 */
func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
    guard head != nil  else {
        return nil
    }
    
    guard head?.next != nil else {
        return head
    }

    let pre:ListNode = ListNode(-1, head)
    
    var start:ListNode? = pre
    
    for _ in 0..<left-1 {
        start = start?.next
    }
    
    var end: ListNode? = start
    
    for _ in 0..<right - left + 1 {
        end = end?.next
    }
    
    var leftNode:ListNode? = start?.next
    let curr:ListNode? = end?.next
    end?.next = nil
    start?.next = nil
       
    reversList(leftNode)
    
    start?.next = end
    leftNode?.next = curr
    return pre.next
}


//
//
//import Foundation
//
//
////func lengthOfLongestSubstring(_ s: String) -> Int {
////    let originS = Array(s)
////    print(originS)
////    guard originS.count > 1 else {
////        return s.count
////    }
////
////    var left = 0
////    var right = 0
////    var maxLength = 0
////    var tempResult = Set<Character> ()
////
//    // 超时了
////    while right < s.count {
////        while tempResult.contains(originS[right]) {
////            tempResult.remove(originS[left])
////            left += 1
////        }
////        maxLength = max(maxLength, right - left + 1)
////        tempResult.insert(originS[right])
////        right += 1
////    }
//
////    for item in originS {
////        if tempResult.contains(item) {
////            tempResult.remove(originS[left])
////            left += 1
////        }
////
////        while right < originS.count && !tempResult.contains(originS[right]){
////            tempResult.insert(originS[right])
////            right += 1
////        }
////        maxLength = max(maxLength, right - left)
////    }
//
////    while right < originS.count {
////        while right < originS.count && !tempResult.contains(originS[right]) {
////            tempResult.insert(originS[right])
////            right += 1
////        }
////        maxLength = max(maxLength, right - left)
////        tempResult.remove(originS[left])
////        left += 1
////    }
////    return  maxLength
////}
////
////print(lengthOfLongestSubstring("bbbbb"))
//
////
////func minWindow(_ s: String, _ t: String) -> String {
////    guard t.count <= s.count else {
////        return ""
////    }
////    var left = 0
////    var right = 0
////    let resultSet = [Character:Int](default:0)
////    let originS = Array(s)
////    var tempSet = resultSet
////    var okl = 0
////    var okr = 0
////    var minlength = s.count
////
////
////    while right < originS.count {
////
////    }
////
////
//////    for _ in originS {
//////        while right < originS.count - 1 &&  tempSet.count != 0 {
//////            if resultSet.contains(originS[right]){
//////                tempSet.remove(originS[right])
//////            }
//////            right += 1
//////        }
//////
//////        while left < right && !resultSet.contains(originS[left]) {
//////            let starts = s.index(s.startIndex, offsetBy: left)
//////            let ends = s.index(s.startIndex, offsetBy: right - 1)
//////            print("current string is")
//////            print(String(s[starts..<ends]))
//////            left += 1
//////        }
//////
//////        if resultSet.contains(originS[left]) {
//////            tempSet.insert(originS[left])
//////            if minlength > right  - left {
//////                okl = left
//////                okr = right - 1
//////                minlength = right - left
//////            }
//////            left += 1
//////        }
//////    }
////
////
////    let starts = s.index(s.startIndex, offsetBy: okl)
////    let ends = s.index(s.startIndex, offsetBy: okr)
////    return String(s[starts..<ends])
////}
//
//
////
////print(minWindow("ADOBECODEBANC", "ABC"))
////
////func minOperations(_ nums: [Int], _ x: Int) -> Int {
////    let numl = nums.count
////    var left = 0, right = 0, maxLength = -1, sum = 0
////
////    sum = nums.reduce(0, +)
////
////    let count = sum - x
////
////    guard count >= 0 else {
////        return -1
////    }
////
////    var sumNum = 0
////
////    while right < numl {
////
////        sumNum += nums[right]
////
////        while sumNum > count {
////            sumNum -= nums[left]
////            left += 1
////        }
////        if sumNum == count {
////            maxLength = max(maxLength, right - left + 1)
////        }
////        right += 1
////    }
////
////    if maxLength == -1 {
////        return -1
////    }
////    return numl - maxLength
////
////}
////
////print(minOperations([1,1,4,2,3], 5))
//
////func removeDuplicates(_ nums: inout [Int]) -> Int {
////    guard nums.count > 1 else {
////        return nums.count
////    }
////    var left = nums.count - 1, right = nums.count - 2
////
////    while right >= 0 {
////        if nums[left] == nums[right] {
////            nums.remove(at: left)
////        }
////        right -= 1
////        left -= 1
////
////    }
////
////    return nums.count
////
////}
//
////func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
////    guard nums.count >  0 else {
////        return 0
////    }
////
////    var right = nums.count - 1
////
////    while right >= 0 {
////        if nums[right] == val {
////            nums.remove(at: right)
////            print(nums)
////        }
////        right -= 1
////    }
////    return nums.count
////}
////
////var originList = [1]
//////print(removeDuplicates(&originList))
////print(removeElement(&originList, 2))
//
////func strStr(_ haystack: String, _ needle: String) -> Int {
////    guard needle.count != 0 else {
////        return 0
////    }
////
////    var left = 0, right = needle.count - 1, result = -1
////
////    while right < haystack.count {
////
////        let startIndex = haystack.index(haystack.startIndex, offsetBy: left)
////        let endIndex = haystack.index(haystack.startIndex, offsetBy: right)
////        let subStr = String(haystack[startIndex...endIndex])
////        print(subStr)
////
////        if subStr == needle {
////            return left
////        }
////
////        right += 1
////        left += 1
////    }
////
////    return result
////
////}
//
////func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
////
////    guard m != 0 else {
////        return nums1 = nums2
////    }
////
////    guard n != 0 else {
////        return
////    }
////
////    var left = 0, right = 0
////    var temList = Array(nums1[0..<m])
////    print(temList)
////
////
////    while left < temList.count{
////        while right < n && temList[left] >= nums2[right] {
////            temList.insert(nums2[right], at: left)
////            right += 1
////        }
////        print(temList)
////        left += 1
////    }
////
////    while  right < n {
////        temList.append(nums2[right])
////        print(temList)
////        right += 1
////    }
////
////    nums1 = temList
////}
////
////print(strStr("hdjahdjahjda", "ah"))
//
////var originString = [2,0]
////merge(&originString, 1, [1], 1)
////print(originString)
//
////func isPalindrome(_ s: String) -> Bool {
////
////    let originS = Array(s)
////
////    var left = 0, right = s.count - 1, ret = true
////
////    while left < right {
////        if !originS[left].isLetter && !originS[left].isNumber {
////            left += 1
////            continue
////        }
////
////        if !originS[right].isNumber && !originS[right].isLetter {
////            right -= 1
////            continue
////        }
////
////        let leftNum = originS[left].lowercased()
////        let rightNum = originS[right].lowercased()
////
////
////        if  leftNum != rightNum{
////            ret =  false
////        }
////
////        left += 1
////        right -= 1
////    }
////    return ret
////}
////
////print(isPalindrome(".,"))
////print("ok")
//
//
////func reverseVowels(_ s: String) -> String {
////    guard s.count > 1 else {
////        return s
////    }
////
////    var left = 0, right = s.count - 1, result = Array(s)
////    let vowel = Set("aeiouAEIOU")
////
////
////    while left < right {
////
////        if  !vowel.contains(result[left]) {
////            left += 1
////            continue
////        }
////
////        if !vowel.contains(result[right]) {
////            right -= 1
////            continue
////        }
////
////        let temp = result[left]
////        result[left] = result[right]
////        result[right] = temp
////        left += 1
////        right -= 1
////    }
////    return String(result)
////}
////
////print(reverseVowels("aA"))
////print("ok")
//
////func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
////
////
////
////    guard nums1.count != 0 && nums2.count != 0 else {
////        return []
////    }
////
////
////    let num2Set = Set(nums2)
////    var left = 0, result = Set<Int>()
////
////    while  left < nums1.count {
////        if num2Set.contains(nums1[left])  && !result.contains(nums1[left]){
////            result.insert(nums1[left])
////        }
////        left += 1
////    }
////
////    return Array(result)
////
////}
//
//
////print(intersection([4,9,5], [9,4,9,8,4]))
//
//
////func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
////
////        guard nums1.count != 0 && nums2.count != 0 else {
////            return []
////        }
////
////    var containSet = [Int]()
////    var originList = [Int]()
////    if nums1.count > nums2.count {
////        containSet  = nums1
////        originList = nums2
////    } else {
////        containSet  = nums2
////        originList = nums1
////    }
////
////
////        var left = 0, result = [Int]()
////
////        while  left < originList.count {
////            if containSet.contains(originList[left]){
////                result.append(originList[left])
////                if     let first = containSet.firstIndex(of: originList[left]) {
////                    containSet.remove(at: first)
////                }
////            }
////            left += 1
////        }
////
////        return result
////
////}
////
////print(intersect([3,1,2], [1,1]))
//
//class ListNode {
//    public var value:Int
//    public var next:ListNode?
//
//    init(_ value: Int, _ next: ListNode?) {
//        self.value = value
//        self.next = next
//    }
//
//}
//
////func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
////
////    guard  l1 != nil || l2 != nil  else {
////        print("ni")
////        return nil
////    }
////
////
////    guard l1 != nil else {
////        print("ri")
////        return l2
////    }
////
////    guard l2 != nil else {
////        print("li")
////        return l1
////    }
////
////
////    var currentL = l1
////    var currentR = l2
////    var preHead = ListNode(-1, nil)
////    var resut:ListNode? = preHead
////    print(currentL)
////
////    while currentL != nil && currentR != nil {
////        if currentL!.value <= currentR!.value {
////            resut?.next = currentL
////            currentL = currentL?.next
////        } else {
////            resut?.next = currentR
////            currentR = currentR?.next
////        }
////        resut = resut?.next
////    }
////
////
////    if currentL != nil {
////        resut?.next = currentL
////    } else {
////        resut?.next = currentR
////    }
////
////    return preHead.next
////}
//
//
////func deleteDuplicates(_ head: ListNode?) -> ListNode? {
////    guard head != nil else {
////        return head
////    }
////
////    guard head?.next != nil else {
////        return head
////    }
////
////    var result:ListNode? = head
////
////    while result?.next != nil {
////        if result?.value == result?.next?.value {
////            result?.next = result?.next?.next
////        } else {
////            result = result?.next
////        }
////    }
////
////
////    return head
////}
//
////
////func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
////
////    guard headA != nil && headB != nil else {
////        return nil
////    }
////
////    var result = headA
////    var preB = headB
////
////
////    while result !== preB {
////        if result != nil {
////            result = result?.next
////        } else {
////            result = headB
////        }
////
////        if preB != nil {
////            preB = preB?.next
////        } else {
////            preB = headA
////        }
////    }
////
////    return result
////}
//
//
////func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
////
////    guard head != nil else {
////        return nil
////    }
////
////    guard !(head?.next == nil && head?.value == val) else {
////        return nil
////    }
////
////    var preHead:ListNode? = ListNode(-1, head)
////    preHead?.next = head
////    var result = preHead
////
////    while result != nil  {
////        if result?.next?.value == val {
////            result?.next = result?.next?.next
////            continue
////        }
////        result = result?.next
////    }
////    return preHead?.next
////}
//
//
////func reverseList(_ head: ListNode?) -> ListNode? {
////    guard head != nil else {
////        return nil
////    }
////
////    guard head?.next != nil else {
////        return head
////    }
////
////    var pre:ListNode? = nil
////    var curr = head
////
////    while curr != nil {
////        let next = curr?.next
////        curr?.next = pre
////        pre = curr
////        curr = next
////    }
////
////    return pre
////}
//
//
////func isPalindrome(_ head: ListNode?) -> Bool {
////
////    guard head != nil else {
////        return false
////    }
////
////    guard  head?.next != nil else {
////        return true
////    }
////
////    guard head?.next?.next != nil else {
////        print("okok")
////        return head?.value == head?.next?.value
////    }
////
////    var midNode:ListNode? = middleNodeOfList(head)
////
////    var lastNode:ListNode? = reversedListNode(midNode?.next)
////
////    print(midNode?.value)
////    print(lastNode?.value)
////
////    var start = head
////
////    while lastNode != nil {
////
////        print("current stary --- \(start?.value)")
////        print("pre stary --- \(lastNode?.value)")
////        if lastNode?.value !=  start?.value {
////            return false
////        }
////        start = start?.next
////        lastNode = lastNode?.next
////    }
////    return true
//
////    var slow = head
////    var fast = head?.next
////    var middle:ListNode? = nil
////    var pre:ListNode? = nil
////
////    while fast?.next != nil {
////        slow = slow?.next
////        fast = fast?.next?.next
////        print("current while")
////    }
////
////    middle = slow?.next
////    var revser = slow?.next
////
////    while revser != nil {
////        var next = revser?.next
////        revser?.next = pre
////        pre = revser
////        revser = next
////    }
//
////    while pre != nil {
////        print("current pre ---\(pre?.value)")
////        pre = pre?.next
////    }
////
////    var start = head
////    print("pre value -- \(pre?.value)")
////    print("start value -- \(start?.value)")
////    print("middle value -- \(middle?.value)")
////    while middle !== pre {
////        print("pre value -- \(pre?.value)")
////        print("start value -- \(start?.value)")
////        if start?.value != pre?.value  {
////            print("restle")
////            return false
////        }
////        start = start?.next
////        pre = pre?.next
////        print(start?.value)
////        print(pre?.value)
////    }
////
////    return true
////}
////
////func middleNodeOfList(_ head: ListNode?) -> ListNode? {
////    var fast = head
////    var slow = head
////    while fast?.next != nil && fast?.next?.next != nil {
////        fast = fast?.next?.next
////        slow = slow?.next
////    }
////    return slow
////}
////
////func reversedListNode(_ head: ListNode?) -> ListNode? {
////    guard head != nil else {
////        return nil
////    }
////
////    guard  head?.next != nil else {
////        return head
////    }
////
////    var pre:ListNode? = nil
////    var cur = head
////    while cur != nil {
////        let next = cur?.next
////        cur?.next = pre
////        pre = cur
////        cur = next
////    }
////    return pre
////}
////
////print()
////
////func getDecimalValue(_ head: ListNode?) -> Int {
////
////    var lastNode = reversedListNode(head)
////
////    var current = 0
////    var result:Decimal = 0
////    while lastNode != nil {
////        if lastNode?.value != 0 {
////            result += pow(2, current)
////        }
////        print("current --- \(current) --- result ---\(result) -- curent value -- \(lastNode?.value)")
////        lastNode = lastNode?.next
////        current += 1
////    }
////
////    return Int(truncating: NSDecimalNumber(decimal: result))
////}
//
////func middleNode(_ head: ListNode?) -> ListNode? {
////    guard head != nil else {
////      return head
////    }
////    guard head?.next != nil else {
////        return head
////    }
////    var fast = head
////    var slow = head
////    while fast?.next != nil && fast?.next?.next != nil {
////        fast = fast?.next?.next
////        slow = slow?.next
////    }
////    return slow
////}
//
//
//
//func removeDuplicateNodes(_ head: ListNode?) -> ListNode? {
//
//    guard head != nil else {
//        return head
//    }
//
//    guard  head?.next != nil  else {
//        return head
//    }
//
//    var hashSet = Set<Int>()
//    hashSet.insert(head!.value)
//
//    var curr = head
//    while curr?.next != nil {
//        let temp = curr?.next
//        if !hashSet.contains(temp!.value) {
//            hashSet.insert(temp!.value)
//            curr = curr!.next
//        } else {
//            curr!.next = curr!.next?.next
//        }
//    }
//
//    return head
//}
//
//
/////*
//// 如果链表为空时，代码是否能正常工作？
//// 如果链表只包含一个结点时，代码是否能正常工作？
//// 如果链表只包含两个结点时，代码是否能正常工作？
//// 代码逻辑在处理头结点和尾结点的时候，是否能正常工作？
//// */
////
//
//
//
//
////
//let rn6 = ListNode(4, nil)
//let rn5 = ListNode(2, nil)
//let rn4 = ListNode(3, rn5)
//let rn3 = ListNode(2, rn4)
//let rn2 = ListNode(1, rn3)
//let rn1 = ListNode(1, rn2)
//
//let ln7 = ListNode(7, nil)
//let ln6 = ListNode(1, nil)
//let ln5 = ListNode(1, nil)
//let ln4 = ListNode(1, ln5)
//let ln3 = ListNode(1, nil)
//let ln2 = ListNode(0, ln3)
//let ln1 = ListNode(1, ln2)
//
//
//var result = removeDuplicateNodes(rn1)
//while result != nil {
//    print(result?.value)
//    result = result?.next
//}
//
////print(getDecimalValue(ln1))
//
//
//
////var result = isPalindrome(ln1)
////print(result)
//
//
////var result = reversedListNode(rn1)
////while result != nil {
////    print(result?.value)
////    result = result?.next
////}
//
////var result:ListNode? =  getIntersectionNode(rn1, ln1)
////print(result?.value)
////mergeTwoLists
////while result != nil {
////    print(result!.value)
////    result = result?.next
////}
////
////var result = deleteDuplicates(rn1)
////while result != nil {
////    print(result!.value)
////    result = result?.next
////}
//
//
//
//
//print("ok")

