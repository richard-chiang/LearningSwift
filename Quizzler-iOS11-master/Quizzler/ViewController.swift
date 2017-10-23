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
    var questionNum = 0
    var score = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load first question
        updateUI()
        
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
        questionLabel.text = allQuestions.list[questionNum].questionText
        progressLabel.text = "\(questionNum + 1) / \(allQuestions.list.count)"
        scoreLabel.text = "Score: \(score) / \(allQuestions.list.count)"
        
    }
    

    func nextQuestion() {
        if questionNum == allQuestions.list.count - 1 {
            // prompt restart
            let alert = UIAlertController(title: "Congratulation", message: "You have finished the quiz. Do you wish to start over again?", preferredStyle: .alert)
            
            let restart = UIAlertAction(title: "Restart", style: .default, handler:
            {(UIAlertAction) in
                    self.startOver()})
            
            let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            
            alert.addAction(restart)
            alert.addAction(cancel)
            
            present(alert, animated: true, completion: nil)
            
        } else {
            questionNum += 1
        }
        
        updateUI()
    }
    
    
    func checkAnswer() {
        let answer = allQuestions.list[questionNum].answer
        
        score = (answer == pickedAnswer) ? score + 1: score
        nextQuestion()
    }
    
    
    func startOver() {
        questionNum = 0
        score = 0
        updateUI()
    }
    

    
}
