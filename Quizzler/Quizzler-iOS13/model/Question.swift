//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by sohail shaik on 6/6/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation
struct Question {
    var question : String
    var answer : String
    
    init(q question:String, a answer:String){
        self.question = question
        self.answer = answer
    }
}
