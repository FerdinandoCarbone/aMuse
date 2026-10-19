//
//  roomModel.swift
//  Project1
//
//  Created by Marta Michelle Caliendo on 30/10/22.
//

import Foundation

class roomModel: Codable, Identifiable, ObservableObject {
    let id: Int
    let name: String
    let description: String
    let description2: String
    var isUnlocked: Bool
    let imageName: String
    let price: Int
   
    init(id: Int, name: String, description: String, description2: String, isUnlocked: Bool, imageName: String, price: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.isUnlocked = isUnlocked
        self.imageName = imageName
        self.price = price
        self.description2 = description2
    }

}
