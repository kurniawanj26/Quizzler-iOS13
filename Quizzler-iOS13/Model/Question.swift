//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Jayadi Kurniawan on 30/03/26.
//  Copyright © 2026 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    // custom initializer
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
