//
//  CurrentQuiz.swift
//  Project1
//
//  Created by Ferdinando Carbone on 26/10/22.
//

import Foundation

struct Quiz{
    var currentQuestionIndex: Int
    var quizModel: QuizModel
    var quizCompleted: Bool = false
    var isStarted: Bool = false
    var attemptNumber: Int = 0
}

