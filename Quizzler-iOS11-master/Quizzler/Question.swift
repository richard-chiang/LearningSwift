//
//  Question.swift
//  Quizzler
//
//  Created by Richard Chiang on 2017-10-20.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool){
        self.questionText = text
        self.answer = correctAnswer
    }
}
