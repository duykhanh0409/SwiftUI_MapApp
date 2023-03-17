//
//  LocationView.swift
//  SwiftUIBootcamp
//
//  Created by Thuocsi on 16/03/2023.
//

import SwiftUI
import MapKit


struct LocationView: View {
//    @StateObject private var vm = LocationViewModel()
    @EnvironmentObject private var vm:LocationViewModel
  
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $vm.mapRegion,
                annotationItems: vm.locations,
                annotationContent: { location in
                MapAnnotation(coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            vm.showNextLocation(location: location)
                        }
                }
            })
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                Spacer()
                
                ZStack{
                    ForEach(vm.locations) { location in
                        if vm.mapLocation == location {
                            LocationReviewView(location: location)
                                .shadow(color: Color.black.opacity(0.3), radius: 10)
                                .padding()
                                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                        }
                    } 
                }
            }
           
        }
         
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationViewModel())
    }
}

extension LocationView {
    
    private var header: some View{
        VStack{
            Button {
                vm.togleLocationList()
            } label: {
                Text(vm.mapLocation.name + "," + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth:.infinity)
    //                .background(Color.red)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationList ? 180 : 0))
                    }
            }

            if vm.showLocationList {
                LocationListView()
            }
            
            
                
        }
        .background(.thinMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20,x: 0,y: 15)
        .padding()
    }
}
