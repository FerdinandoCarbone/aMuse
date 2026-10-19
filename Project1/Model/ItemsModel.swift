//
//  ItemsModel.swift
//  Project1
//
//  Created by Marta Michelle Caliendo on 17/10/22.
//

import Foundation
import SwiftUI

//model degli oggetti/ serve a costruire l'array di oggetti

//Identifiable è un protocol per fornire un id a ogni oggetto
class ItemsModel: /*Hashable, */Codable, Identifiable {
    let id: Int
    let name: String
    let author: String
    let location: String
    let description: String
    let curiosity: String
    let price: Int
    
    var isPainting: Bool
    var isVertical: Bool
    var isLocked: Bool
     
    // icons
    let iconName1: String
    let iconSymbol1: String
    let iconText1: String
    let iconName2: String
    let iconSymbol2: String
    let iconText2: String
    let iconName3: String
    let iconSymbol3: String
    let iconText3: String
    
    let imageName: String
    var image: Image{
        Image(imageName)
    }
    
    func buyItem(userXP: Int, item: ItemsModel) -> Int {
        let remainingXP = userXP - self.price
        //var currentItem = items.first(where: { $0.id == item.id })
        
        if remainingXP >= 0 {
            
            //currentItem?.isLocked = false // TODO: change boolean isLocked
            items.first(where: { $0.id == item.id })?.isLocked = false
            
            return remainingXP
            
        } else {
            print("not enough XP")
            return userXP
        }
        
    }
    
}

    
    /*
    let id: String = UUID().uuidString   //questa funzione genera un id diverso per ogni oggetto e in questo caso lo restituisce come stringa
    let title: String
    let subtitle: String
    let image: String
    let isUnlocked: Bool
    
    init(title: String, subtitle: String, image: String, isUnlocked: Bool) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.isUnlocked = isUnlocked
    }
    */

