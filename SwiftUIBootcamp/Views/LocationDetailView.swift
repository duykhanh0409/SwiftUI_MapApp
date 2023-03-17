//
//  LocationDetailView.swift
//  SwiftUIBootcamp
//
//  Created by Thuocsi on 17/03/2023.
//

import SwiftUI

struct LocationDetailView: View {
    let location:Location
    @EnvironmentObject private var vm:LocationViewModel
    var body: some View {
        ScrollView{
            VStack{
                TabView {
                    ForEach(location.imageNames, id: \.self) {image in
                        Image(image)
                            .resizable()
                            .scaledToFit()
                    }
                }
                .frame(height: 500)
                .tabViewStyle(PageTabViewStyle())
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(backButton,alignment: .topLeading)
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location:LocationsDataService.locations.first!)
    }
}

extension LocationDetailView {
    private var backButton: some View {
        Button {
            vm.sheetLocationList = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
}
