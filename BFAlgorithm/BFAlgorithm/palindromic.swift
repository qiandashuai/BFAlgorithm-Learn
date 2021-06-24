//
//  palindromic.swift
//  BFAlgorithm
//
//  Created by blackstone jericho on 2021/6/21.
//

import Foundation

/*
 5. Longest Palindromic Substring
 given a string  s. return the longest palindromic substring in s
 */
func longestPalindrome(_ s: String) -> String {
        let len = s.count
        guard len > 1 else {
            return s
        }
        
        var maxLen = 1
        var begin = 0
        
        var dpList: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: len), count: len)
        
        for i in 0..<len {
            dpList[i][i] = true
        }
        
        let sList = Array(s)
        
        for L in 2...len {
            for i in 0..<len {
                let j = i + L - 1
                if j >= len {
                    break
                }
                if sList[i] != sList[j] {
                    dpList[i][j] = false
                } else {
                    if j - i < 3 {
                        dpList[i][j] = true
                    } else {
                        dpList[i][j] = dpList[i+1][j-1]
                    }
                }
                
                if dpList[i][j] && j - i + 1 > maxLen {
                    maxLen = j - i + 1
                    begin = i
                }
            }
        }
        
        return String(Array(sList[begin..<(begin+maxLen)]))
}


/*
 面试题 01.04. Palindrome Permutation LCCI
 */
func canPermutePalindrome(_ s: String) -> Bool {
    guard s.count > 1 else {
        return true
    }
    
    var dict:[Character:Int] = [Character:Int]()
    for item in Array(s) {
        if dict[item] == nil {
            dict[item] = 1
        } else {
            dict[item]! += 1
        }
    }
    
    var result = 0
    for value in dict.values {
        if value % 2 == 1 {
            result += 1
        }
    }
    
    
    return result <= 1
}

/*
 9. Palindrome Number
 */
func isPalindrome(_ x: Int) -> Bool {
    guard x >= 0 else {
        return false
    }

    let originX = String(x)
    let aList:[Character] = Array(originX)

    var left = 0, right = aList.count - 1
    while left <= right {
        if aList[left] != aList[right] {
            return false
        }
        left += 1
        right -= 1
    }
    return true
}
