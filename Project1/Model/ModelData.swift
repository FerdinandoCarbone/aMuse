//
//  ModelData.swift
//  Landmarks
//
//  Created by Serena on 20/10/22.
//  Copyright © 2022 Apple. All rights reserved.
//

import Foundation

var items: [ItemsModel] = load("itemsData.json")

var museums: [MuseumModel] = load("museumsData.json")

var roomsGlobal: [roomModel] = load("roomData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
