//
//  BFSort.swift
//  BFAlgorithm
//
//  Created by blackstone jericho on 2021/6/7.
//

import Foundation


/*
 冒泡排序: 每次比较前后两个元素的大小，并交换
 */

func maopao(_ s:[Int]) -> [Int] {
    guard s.count > 1 else {
        return s
    }
    
    var result = s
    for i in 0..<result.count - 1 {
        
        var exitFlag:Bool = false
        
        for j in 0..<result.count - i - 1 {
            
            if result[j] > result[j + 1] {
                let temp = result[j + 1]
                result[j + 1] = result[j]
                result[j] = temp
                exitFlag = true
            }
        }
        if !exitFlag {
            break
        }
    }
    return result
}


/*
 插入排序： 从前向后遍历，比较，并将其插入到该在的位置
 */

func charu(_ s:[Int]) -> [Int] {
    guard  s.count > 1 else {
        return s
    }
    
    var result = s
    
    for i in 1..<result.count {
        let value:Int = result[i]
        
        var j = i - 1
        
        for j in (0..<i-1).reversed() {
            if result[j] > value {
                result[j + 1] = result[j]
            } else {
                break
            }
        }
        result[j + 1] = value
    }
    
    return result
}


/*
 选择排序，每次遍历，把一个元素排列到其该在的位置
 */
func xuanze(_ s: [Int]) -> [Int] {
    guard s.count > 1 else {
        return s
    }
    
    var result = s
    
    for i in 0..<result.count {
        
        var min = result[i]
        var minIndex = i
        for j in i..<result.count {
            if result[j] < min {
                min = result[j]
                minIndex = j
            }
        }
        let temp = result[minIndex]
        result[minIndex] = result[i]
        result[i]  = temp
    }
    return result
}


/*
 归并排序
 */

func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    
    let middleIndex = array.count / 2
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merger(leftArray, rightArray)
}

func merger(_ leftArray: [Int], _ rightArray:[Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedPile:[Int] = [Int]()
    orderedPile.reserveCapacity(leftArray.count + rightArray.count)
    
    while leftIndex < leftArray.count && rightIndex < rightArray.count {
        if leftArray[leftIndex] < rightArray[rightIndex] {
            orderedPile.append(leftArray[leftIndex])
            leftIndex += 1
        } else if leftArray[leftIndex] > rightArray[rightIndex] {
            orderedPile.append(rightArray[rightIndex])
            rightIndex += 1
        } else {
            orderedPile.append(leftArray[leftIndex])
            leftIndex += 1
            orderedPile.append(rightArray[rightIndex])
            rightIndex += 1
        }
    }
    
    if leftIndex < leftArray.count {
        orderedPile.append(contentsOf: Array(leftArray[leftIndex..<leftArray.count]))
    }
    if rightIndex < rightArray.count {
        orderedPile.append(contentsOf: Array(rightArray[rightIndex..<rightArray.count]))
    }
    return orderedPile
    
}

/*
 快速排序法
 */
func quickSort(_ s:[Int]) -> [Int] {
    guard s.count > 1 else {
        return s
    }
    
    let pivot = s[s.count/2]
    let less = s.filter {$0 < pivot}
    let equal = s.filter {$0 == pivot}
    let greater = s.filter {$0 > pivot}
    
    return quickSort(less) + equal + quickSort(greater)
}
