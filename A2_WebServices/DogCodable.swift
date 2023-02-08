//
//  DogCodable.swift
//  A2_WebServices
//
//  Created by Vishal Sutar on 2023-02-06.
//

import Foundation
struct DogDex: Codable{
    var message: [[String:String]]
    var next : String
}

struct Dog: Codable {
    var name: String
    var url: String
}
