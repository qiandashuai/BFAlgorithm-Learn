//
//  TwoPoint.swift
//  BFAlgorithm
//
//  Created by blackstone jericho on 2021/5/26.
//

import Foundation


class Solution {
    /* 3. Longest Substring without Reapeating Character
     desc: Given a string s. find the length of the longest substring without repeating characters
     
     example 1:
     input s = "abcabcbb"
     output 3
     
     example 2:
     input s = 'bbbb'
     output 1
     */
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let originS = Array(s)
        print(originS)
        guard originS.count > 1 else {
            return s.count
        }
        
        var left = 0
        var right = 0
        var maxLength = 0
        var tempResult = Set<Character> ()
        
        // 超时了
    //    while right < s.count {
    //        while tempResult.contains(originS[right]) {
    //            tempResult.remove(originS[left])
    //            left += 1
    //        }
    //        maxLength = max(maxLength, right - left + 1)
    //        tempResult.insert(originS[right])
    //        right += 1
    //    }
        
//        for item in originS {
//            if tempResult.contains(item) {
//                tempResult.remove(originS[left])
//                left += 1
//            }
//
//            while right < originS.count && !tempResult.contains(originS[right]){
//                tempResult.insert(originS[right])
//                right += 1
//            }
//            maxLength = max(maxLength, right - left)
//        }
        while right < originS.count {
            tempResult.insert(originS[right])
            
            if !tempResult.contains(originS[right]) {
                right += 1
            } else {
                tempResult.remove(originS[left])
                maxLength = max(maxLength, right - left)
                left += 1
            }
        }
        
        return  maxLength
    }
    
    func minWindow2(_ s: String, _ t: String) -> String {
            let sArr = [Character](s)
            let tArr = [Character](t)
            if sArr.count < tArr.count { return "" }
            var needs = [Character: Int]()
            var window = [Character: Int]()
            for c in tArr {
                needs[c] = needs[c] == nil ? 1 : needs[c]! + 1
            }
            var left = 0, right = 0, match = 0
            var start = 0
            var length = Int.max
            while right < sArr.count {
                let c = sArr[right]
                //如果不是子字符不需要添加到window中
                if needs[c] == nil {
                    right += 1
                    continue
                }
                window[c] = window[c] == nil ? 1 : window[c]! + 1
                if window[c] == needs[c] {
                    match += 1
                }
                while match == needs.count {
                    if right - left + 1 < length {
                        start = left
                        length = right - left + 1
                    }
                    let c = sArr[left]
                    if nil != window[c] {
                        window[c]! -= 1
                        if let need = needs[c], window[c]! < need {
                            match -= 1
                        }
                    }
                    left += 1
                }
                right += 1
            }
            return length == Int.max ? "" : String(sArr[start...start + length - 1])
        }
    
    
    /* 1658. Minimum Operations to Reduce X to Zero
     */
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
        let numl = nums.count
        var left = 0, right = 0, maxLength = -1, sum = 0
        
        sum = nums.reduce(0, +)
        
        let count = sum - x
        
        guard count >= 0 else {
            return -1
        }
        
        var sumNum = 0
        
        while right < numl {
            
            sumNum += nums[right]
            
            while sumNum > count {
                sumNum -= nums[left]
                left += 1
            }
            if sumNum == count {
                maxLength = max(maxLength, right - left + 1)
            }
            right += 1
        }
        
        if maxLength == -1 {
            return -1
        }
        return numl - maxLength
        
    }
    
    /*
     26. Remove Duplicates from Sorted Array
     */
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        var left = nums.count - 1, right = nums.count - 2

        while right >= 0 {
            if nums[left] == nums[right] {
                nums.remove(at: left)
            }
            right -= 1
            left -= 1

        }

        return nums.count

    }
    
    /*
     27. Remove Element
     */
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        guard nums.count >  0 else {
            return 0
        }
        
        var right = nums.count - 1
        
        while right >= 0 {
            if nums[right] == val {
                nums.remove(at: right)
            }
            right -= 1
        }
        return nums.count
    }
    
    /*
     28. Implement strStr()
     */
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard needle.count != 0 else {
            return 0
        }
        
        var left = 0, right = needle.count - 1, result = -1
        
        while right < haystack.count {
            
            let startIndex = haystack.index(haystack.startIndex, offsetBy: left)
            let endIndex = haystack.index(haystack.startIndex, offsetBy: right)
            let subStr = String(haystack[startIndex...endIndex])
            print(subStr)
            
            if subStr == needle {
                return left
            }
            
            right += 1
            left += 1
        }
        
        return result

    }
    
    
    /*
     88. Merge Sorted Array
     */
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {

        guard m != 0 else {
            return nums1 = nums2
        }

        guard n != 0 else {
            return
        }

        var left = 0, right = 0
        var temList = Array(nums1[0..<m])
        print(temList)

        
        while left < temList.count{
            while right < n && temList[left] >= nums2[right] {
                temList.insert(nums2[right], at: left)
                right += 1
            }
            print(temList)
            left += 1
        }
        
        while  right < n {
            temList.append(nums2[right])
            print(temList)
            right += 1
        }
        
        nums1 = temList
    }
    
    /*
     125. Valid Palindrome
     */
    func isPalindrome(_ s: String) -> Bool {
        
        let originS = Array(s)

        var left = 0, right = s.count - 1, ret = true

        while left < right {
            if !originS[left].isLetter && !originS[left].isNumber {
                left += 1
                continue
            }

            if !originS[right].isNumber && !originS[right].isLetter {
                right -= 1
                continue
            }

            let leftNum = originS[left].lowercased()
            let rightNum = originS[right].lowercased()

            
            if  leftNum != rightNum{
                ret =  false
            }

            left += 1
            right -= 1
        }
        return ret
    }
    /*
     345. Reverse Vowels of a String
     */
    func reverseVowels(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }

        var left = 0, right = s.count - 1, result = Array(s)
        let vowel = Set("aeiouAEIOU")


        while left < right {

            if  !vowel.contains(result[left]) {
                left += 1
                continue
            }

            if !vowel.contains(result[right]) {
                right -= 1
                continue
            }

            let temp = result[left]
            result[left] = result[right]
            result[right] = temp
            left += 1
            right -= 1
        }
        return String(result)
    }
    
    /*
     349. Intersection of Two Arrays
     */
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
        
        
        guard nums1.count != 0 && nums2.count != 0 else {
            return []
        }
        
        
        let num2Set = Set(nums2)
        var left = 0, result = Set<Int>()
        
        while  left < nums1.count {
            if num2Set.contains(nums1[left])  && !result.contains(nums1[left]){
                result.insert(nums1[left])
            }
            left += 1
        }
        
        return Array(result)

    }

    /*
     350. Intersection of Two Arrays II
     */
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
            guard nums1.count != 0 && nums2.count != 0 else {
                return []
            }
        
        var containSet = [Int]()
        var originList = [Int]()
        if nums1.count > nums2.count {
            containSet  = nums1
            originList = nums2
        } else {
            containSet  = nums2
            originList = nums1
        }
        
        
            var left = 0, result = [Int]()
        
            while  left < originList.count {
                if containSet.contains(originList[left]){
                    result.append(originList[left])
                    if     let first = containSet.firstIndex(of: originList[left]) {
                        containSet.remove(at: first)
                    }
                }
                left += 1
            }
        
            return result
        
    }


}
