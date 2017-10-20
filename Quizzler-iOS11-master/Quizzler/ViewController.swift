//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    var allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load first question
        questionLabel.text = allQuestions.getNextQuestion().questionText
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        switch sender.tag! {
        case 1:
            pickedAnswer = true
        case 2:
            pickedAnswer = false
        default:
            pickedAnswer = false
        }
        
        checkAnswer()
    }
    
    
    func updateUI() {
        questionLabel.text = allQuestions.getCurrentQuestion().questionText
    }
    

    func nextQuestion() {
        _ = allQuestions.getNextQuestion()
        updateUI()
    }
    
    
    func checkAnswer() {
        let answer = allQuestions.getCurrentQuestion().answer
        
        (answer == pickedAnswer) ? print("You are correct") : print("You are wrong")
        nextQuestion()
    }
    
    
    func startOver() {
       allQuestions = QuestionBank()
       _ = allQuestions.getNextQuestion()
    }
    

    
}
