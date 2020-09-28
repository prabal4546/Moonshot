//
//  Mission.swift
//  Moonshot
//
//  Created by PRABALJIT WALIA     on 28/09/20.
//

import Foundation


//Nested struct
struct Mission:Codable,Identifiable{
    
    struct CrewRole: Codable{
        let name:String
        let role:String
    }
    
    let id:Int
    let launchDate:String?
    let description:String
    let crew:[CrewRole]
}
