//
//  Location.swift
//  SwiftUIBootcamp
//
//  Created by Thuocsi on 15/03/2023.
//

import Foundation
import MapKit

struct Location: Identifiable,Equatable {
   
    
    let id = UUID().uuidString
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames:[String]
    let link: String
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
        
    }
}
 
