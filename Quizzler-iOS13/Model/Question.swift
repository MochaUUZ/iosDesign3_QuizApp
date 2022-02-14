//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Sheng hao Dong on 2/11/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correctA: String
    
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        correctA = correctAnswer
    }
}
