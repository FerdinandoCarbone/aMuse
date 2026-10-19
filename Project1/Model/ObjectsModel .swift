//
//  ObjectsModel .swift
//  Project1
//
//  Created by Marta Michelle Caliendo on 19/10/22.
//

import Foundation

struct ObjectsModel : Identifiable {
    let id: String?
    let names: String
    let image: String
    let positionX: CGFloat
    let positionY: CGFloat
    let frameWidht: CGFloat
    let frameHeight: CGFloat
    let buttonPosition: CGFloat
    let whichRooms: Int
    let orientation: String
    

    
    init(id: String?  = UUID().uuidString, names: String, image: String, positionX: CGFloat, positionY: CGFloat, frameWidht: CGFloat, frameHeight: CGFloat, buttonPosition: CGFloat, whichRooms: Int, orientation: String) {
        self.id = id
        self.names = names
        self.image = image
        self.positionX = positionX
        self.positionY = positionY
        self.frameWidht = frameWidht
        self.frameHeight = frameHeight
        self.buttonPosition = buttonPosition
        self.whichRooms = whichRooms
        self.orientation = orientation

    }
}



