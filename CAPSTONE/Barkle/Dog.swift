//
//  Dog.swift
//  Barkle
//
//  Created by Foxy Roxy on 11/2/22.
//

import Foundation

// initializes fields from json file
struct Dog:Codable{
    let Title:String
    let Image:String
    let Number:String
    let animaldetailitem:String
    let animaldetailitem1:String
    let animaldetailitem2:String
    let animaldetailitem3:String
    let animaldetailitem4:String
}

class JsonLoader{
    static func getDogs() -> [Dog]{
        guard let url = Bundle.main.url(forResource: "longDogData", withExtension: "json") else {
                print("Could not get url for file")
                return []
              }
              do {
                  let data = try Data(contentsOf: url)
                 let dogs = try JSONDecoder().decode([Dog].self, from: data)
                   return dogs
              } catch {
                print(error.localizedDescription)
                return []
              }
    }
}
