//
//  QuizData.swift
//  Project1
//
//  Created by Ferdinando Carbone on 26/10/22.
//

import Foundation

struct QuizModel: Identifiable, Codable {
    let id: Int
    let Museum: String
    let photo: String
    let question: String
    let answer1: String
    let answer2: String
    let answer3: String
    let answer4: String
    let rightAnswer: String
}
