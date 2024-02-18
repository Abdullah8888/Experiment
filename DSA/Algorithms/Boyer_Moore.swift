//
//  Boyer_Moore.swift
//  Experiment
//
//  Created by Abdullah on 26/10/2022.
//

import Foundation

//Find the majorit element in the given list, https://leetcode.com/problems/majority-element/
//Leetcode 169 - majority element: Given an array nums of size n, return the majority element.
//The majority element is the element that appears more than ( n / 2 ) times. You may assume that the majority element always exists in the array.
//Follow-up: Could you solve the problem in linear time and in O(1) space?
//Boyer Moore's algorithm
//According to Wikipedia;
//The Boyer–Moore majority vote algorithm is an algorithm for finding the majority of a sequence of elements using linear time and constant space. It is named after Robert S. Boyer and J Strother Moore, who published it in 1981,[1] and is a prototypical example of a streaming algorithm

func findMajorityElement(nums: [Int]) -> Int{
    var (majorityElement, count) = (-1,0)
    // Finding majority candidate
    for num in nums {
        if count == 0 {
            majorityElement = num
        }
        count = num == majorityElement ? count + 1 : count - 1
    }
    
    // Checking if majority candidate occurs more than
    // n/2 times
    count = 0
    for num in nums {
        if num == majorityElement {
            count+=1
        }
    }
    
    return count > nums.count/2 ? majorityElement : -1
}

