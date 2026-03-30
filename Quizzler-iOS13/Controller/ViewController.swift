//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Interface Builder
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let questions = [
        Question(q: "1 - 1 = 0", a: "True"),
        Question(q: "1 + 1 = 4", a: "False"),
        Question(q: "2 + 1 = 3", a: "True"),
        Question(q: "1 + 1 = 2", a: "True"),
        Question(q: "1 + 5 = 9", a: "False"),
    ]
    
    // track the questions
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateQuestion()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        // get the title of the button, in this case only True or False
        let userAnswer = sender.currentTitle
        
        // take the actual answer in questions array
        // [1] to address the True or False
        
        let actualQuestion = questions[questionNumber]
        let actualAnswer = actualQuestion.answer
        
        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        // Check if all questions in the array have been used
        if questionNumber + 1 >= questions.count {
            resetQuestions()
            print("All questions in the array have been used")
        } else {
            questionNumber += 1
        }
        
        // untuk kasih jeda agar animasi warna terlihat user
        // tanpa ini animasi warna pada tombol tidak akan terlihat
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
        
    }
    
    func resetQuestions() {
        questionNumber = 0
    }
    
    @objc func updateQuestion() {
        questionLabel.text = questions[questionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        // + 1 karena var questionNumber = 0 pada saat app baru dijalankan
        progressBar.progress = Float(questionNumber + 1) / Float(questions.count)
    }
    
}

