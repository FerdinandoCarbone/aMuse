//
//  ViewModel.swift
//  Project1
//
//  Created by Marta Michelle Caliendo on 22/10/22.
//

import Foundation


 
class ViewModel : ObservableObject {
    @Published var rooms: [roomModel] = []
    @Published var roomUnlocked = [
        "Room2" : false ] //ci dobbiamo mettere dentro tutta la logica (proprietà e metodi) che poi vanno richiamati nelle altre view
    
    //il protocollo dell'osrv richiede che le proprietà all'interno delle view siano dichiarate come @published, cioè wrappers che permette di osservare le variabili delle view
    
    @Published var selectObject : ObjectsModel? = nil // per inizializzare una viariabile che può esistere come no, si scrive così:
    @Published var objects: [ObjectsModel] = [
        
        ObjectsModel(names: "", image: "quadro1", positionX: 85 , positionY:  145, frameWidht: 140, frameHeight: 100, buttonPosition: 0, whichRooms: 1, orientation: "horizontal"),
        ObjectsModel(names: "", image: "quadro2", positionX: 295, positionY:  170, frameWidht: 114, frameHeight: 160, buttonPosition: 0, whichRooms: 1, orientation: "vertical"),
        ObjectsModel(names: "", image: "quadro1", positionX: 100, positionY: 320, frameWidht: 180, frameHeight: 128, buttonPosition: 0, whichRooms: 1, orientation: "horizontal"),
        ObjectsModel(names: "", image: "mobile", positionX: 330, positionY:  510, frameWidht: 130,frameHeight: 130, buttonPosition: 121, whichRooms: 1, orientation: "nonPainting"),
        ObjectsModel(names: "", image: "mensola", positionX: 290, positionY: 300, frameWidht: 180, frameHeight: 180, buttonPosition: 80, whichRooms: 2, orientation: "nonPainting"),
        ObjectsModel(names: "", image: "mensola", positionX: 150, positionY: 180, frameWidht: 180, frameHeight: 180, buttonPosition: 80, whichRooms: 2, orientation: "nonPainting"),
        ObjectsModel(names: "", image: "lavagna", positionX: 90, positionY: 450, frameWidht: 280, frameHeight: 280, buttonPosition: 40, whichRooms: 2, orientation: "horizontal"),
        ObjectsModel(names: "", image: "quadro2", positionX: 295, positionY:  460, frameWidht: 128, frameHeight: 180, buttonPosition: 0, whichRooms: 2, orientation: "vertical"),
    ]
    
    init() {
        print("init view model")
        rooms = RoomLoader().room
        print("rooms \(rooms)")
    }
    
    func addItem(object: ObjectsModel) {
        if let index = objects.firstIndex(where: { $0.id == object.id }) {
            objects[index] = object
        }
    }
    func buyItem(userXP: Int, item: roomModel) -> Int {
        let remainingXP = userXP - item.price
        //var currentItem = items.first(where: { $0.id == item.id })
        
        if remainingXP >= 0 {
            
            //currentItem?.isLocked = false // TODO: change boolean isLocked
            //rooms.first(where: { $0.id == item.id })?.isUnlocked = false
            if let index = rooms.firstIndex(where: { $0.id == item.id }) {
                rooms[index].isUnlocked = true
                print("index \(index)")
                print("room: \(rooms[index])")
                roomUnlocked["Room2"] = true
            }
            
            return remainingXP
            
        } else {
            print("not enough XP")
            return userXP
        }
        
    }
    
    func buyItem2(userXP: Int, item: roomModel) -> Int {
        let remainingXP = userXP - item.price
        
        if remainingXP >= 0 {
            
            //currentItem?.isLocked = false // TODO: change boolean isLocked
            roomsGlobal[0].isUnlocked = false
            roomUnlocked["Room2"] = true
            
            return remainingXP
            
        } else {
            print("not enough XP")
            return userXP
        }
        
    }
    
}

