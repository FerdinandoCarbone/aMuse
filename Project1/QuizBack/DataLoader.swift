//
//  DataLoader.swift
//  Project1
//
//  Created by Ferdinando Carbone on 27/10/22.
//

import Foundation

public class DataLoader{
    
    @Published var museumQuiz=[QuizModel]()
    @Published var test: [ItemsModel] = []
    
    init(){
        readjson()
    }
    
    func readjson(){
        print("reading json")
        if let fileLocation = Bundle.main.url(forResource: "questions", withExtension: "json"){
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = try JSONDecoder().decode([QuizModel].self, from: data)
                self.museumQuiz = jsonDecoder
                print("museumQuiz: \(museumQuiz)")
            } catch {
                print("decode error")
            }
        }
    }
}

/*func parse(jsonData: Data) -> MuseQuiz? {
    do {
        let decodedData = try JSONDecoder().decode(MuseQuiz.self, from: jsonData)
            return decodedData
    } catch {
        print("decode error")
    }
    return nil
}
func readLocalFile(forName name: String) -> Data? {
    do {
        if let bundlePath = Bundle.main.path(forResource: name,
                                             ofType: "json"){
            let fileURL = URL(fileURLWithPath: bundlePath)
            let data = try Data(contentsOf: fileURL)
            return data
        }
    } catch {
        print(error)
    }
    
    return nil
}*/
