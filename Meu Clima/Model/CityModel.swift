//
//  CityModel.swift
//  Meu Clima
//
//  Created by Jobson Batista on 10/13/24.
//

import Foundation

struct CityModel: Decodable {
    
    var id: Int
    var name: String
    var state: String
    var country: String
    var lat: String
    var lon: String
    
}
