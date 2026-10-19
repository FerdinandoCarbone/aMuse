//
//  RoomLoader.swift
//  Project1
//
//  Created by Marta Michelle Caliendo on 30/10/22.
//

import Foundation
public class RoomLoader{
    
    @Published var room = [roomModel]()
    
    init(){
        readjson()
    }
    
    func readjson(){
        print("reading json")
        if let fileLocation = Bundle.main.url(forResource: "roomData", withExtension: "json"){
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = try JSONDecoder().decode([roomModel].self, from: data)
                self.room = jsonDecoder
                print("room: \(room)")
            } catch {
                print("decode error")
            }
        }
    }
}
