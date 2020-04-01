//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestionLabel()
    }

    @IBAction func answerButtonPress(_ sender: UIButton) {
        let userAnsewr = sender.currentTitle
        let resultAnswer =  quizBrain.checkAnswer(userAnsewr!)
        
        sender.layer.borderWidth = 6.0
        
        if resultAnswer {
            quizBrain.upScore()
            sender.layer.borderColor = UIColor.green.cgColor
        }else {
            sender.layer.borderColor = UIColor.red.cgColor
        }
        
        sender.layer.cornerRadius = 25
        if(quizBrain.hasNextQuestion()) {
            quizBrain.nextQuestion()
        }
        else {
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
        
       
        _ = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector:#selector(updateQuestionLabel), userInfo: nil, repeats: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            
            let resultVC = segue.destination as! ResultViewController
            resultVC.scoreValue = "\(quizBrain.getScore())"
            resultVC.mesageValue = quizBrain.getMessage()
            quizBrain.clearValues()
        }
    }
    
    @objc func updateQuestionLabel() {
        updateLabels()
        updateButtons()
        resetColorButtons()
    }
    
    func updateLabels() {
        questionLabel.text = quizBrain.getText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()
    }
    
    func updateButtons() {
        firstButton.setTitle(quizBrain.getAnswerQuestion(numberAnswer: 0), for: .normal)
        secondButton.setTitle(quizBrain.getAnswerQuestion(numberAnswer: 1), for: .normal)
        thirdButton.setTitle(quizBrain.getAnswerQuestion(numberAnswer: 2), for: .normal)
    }
    
    func resetColorButtons() {
        firstButton.backgroundColor = UIColor.clear
        secondButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
        firstButton.layer.borderWidth = 0
        secondButton.layer.borderWidth = 0
        thirdButton.layer.borderWidth = 0
    }
}

