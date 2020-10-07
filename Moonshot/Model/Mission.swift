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
    let launchDate:Date?
    let description:String
    let crew:[CrewRole]
    
    var displayName:String{
        "Apollo\(id)"
    }
    var image:String{
        "apollo\(id)"
    }
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
}
