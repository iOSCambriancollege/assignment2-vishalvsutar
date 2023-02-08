//
//  DogAPI_Helper.swift
//  A2_WebServices
//
//  Created by Vishal Sutar on 2023-02-03.
//

import Foundation

enum DogAPI_Errors: Error{
    case unableToConvertURL
    case CannotParseJsonData
}

enum DogAPI_Response {
    case success(Any)
    case failure(Error)
}

class DogAPI_Helper{
    static let urlString = "https://dog.ceo/api/breeds/list/all"
    
    static func fetchDogData() async throws -> DogDex {
        guard
        let url = URL(string: urlString)
        else {throw DogAPI_Errors.unableToConvertURL}
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
//        let jsonObject =  try JSONSerialization.jsonObject(with: data, options: [])
        
        let decoder = JSONDecoder()
        
        let dogdex = try decoder.decode(DogDex.self, from: data)
        
//        guard let jsonDictionary = jsonObject as? [AnyHashable:Any],
//              let messages = jsonDictionary["message"] as? [[String:String]]
//        else{
//            print(jsonObject)
//            throw DogAPI_Errors.CannotParseJsonData}
              
        return dogdex
    }
}
