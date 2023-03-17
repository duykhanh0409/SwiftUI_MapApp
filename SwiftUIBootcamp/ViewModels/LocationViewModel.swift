//
//  LocationViewModel.swift
//  SwiftUIBootcamp
//
//  Created by Thuocsi on 16/03/2023.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel: ObservableObject{
    //All location
    @Published var locations:[Location]
    //Current location
    @Published var mapLocation: Location {
        didSet{ // every time we update maplocation also update mapRegion
            updateMapRegion(location: mapLocation)
        }
    }
    // current region
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    //show list of locations
    @Published var showLocationList: Bool = false
    
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location){
        withAnimation(.easeInOut){
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
    }
    
    func togleLocationList(){
        withAnimation(.easeInOut){
            showLocationList = !showLocationList
        }
    }
    
    func showNextLocation(location: Location){
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationList = false
        }
    }
    
    func nextButtonPressed(){
        // Get the current index
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else {
            print("could not fint current index in location array")
            return
        }
        
        //check if the next index is valid
        
        let nextIndex =  currentIndex + 1
        guard locations.indices.contains(nextIndex) else{
            //next index is not valid
            //restart from 0
            
            guard let firstlocation = locations.first else {return}
            showNextLocation(location: firstlocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
