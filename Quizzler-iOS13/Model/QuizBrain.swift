//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Cesar Ciello on 28/01/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

    ]
    
    var questionNumber = 0
    var score = 0
    
    func getText() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1)/Float(quiz.count)
    }
    
    func getScore() -> Int {
        return score
    }
    
    func getMessage() -> String {
        if score >= 0 && score <= 3 {
            return "CAN YOU DO BETTER"
        }
        if score <= 7 {
            return "TRY AGAIN, YOU ARE GOOD"
        }
        if score <= 9 {
            return "ALMOST PERFECT"
        }
        else {
            return "PERFECT!"
        }
    }
    
    func getAnswerQuestion(numberAnswer: Int) -> String {
        return quiz[questionNumber].answer[numberAnswer]
    }
    
    mutating func upScore() {
        score += 1
    }
    
    mutating func setScore(newScore: Int) {
        score = newScore
    }
    
    func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].correctAnswer {
            return true
        }
        else {
            return false
        }
    }
    
    func hasNextQuestion() -> Bool {
        return (questionNumber < quiz.count - 1)
    }
    
    mutating func clearValues() {
        questionNumber = 0
        setScore(newScore: 0)
    }
    
    mutating func nextQuestion() {
        questionNumber += 1
    }
}
