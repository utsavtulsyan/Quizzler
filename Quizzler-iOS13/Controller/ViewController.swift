//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var quizBrain = QuizBrain()
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    
    @IBAction func answerPressed(_ sender: UIButton) {
        
        
        if(quizBrain.checkAnswer(sender.currentTitle!)){
            quizBrain.incrementScore()
        }
        quizBrain.nextQuestion()
        progressView.setProgress(quizBrain.getProgress(), animated: true)
        
        if quizBrain.isQuizComplete()  {
            trueButton.isEnabled = false
            falseButton.isEnabled = false
            questionLabel.text = "You have completed the quiz your score is \(quizBrain.getScore()) out of \(quizBrain.getCount())"
            return
        }else{
            questionLabel.text = quizBrain.getQuestionText()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionLabel.text = quizBrain.getQuestionText()
        progressView.setProgress(quizBrain.getProgress(), animated: true)
        
    }
    


}

