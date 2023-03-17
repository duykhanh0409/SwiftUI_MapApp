//
//  LocationReviewView.swift
//  SwiftUIBootcamp
//
//  Created by Thuocsi on 16/03/2023.
//

import SwiftUI

struct LocationReviewView: View {
    let location: Location
    @EnvironmentObject private var vm:LocationViewModel
    var body: some View {
        
        HStack(alignment: .bottom,spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
                
            }
            VStack(spacing: 8){
                learnMoreButton
                nextMoreButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10).fill(.ultraThinMaterial)
                .offset(y:65)
        )
        .cornerRadius(10)
    }
}

struct LocationReviewView_Previews: PreviewProvider {
    static var previews: some View {
        LocationReviewView(location: LocationsDataService.locations.first!)
    }
}

extension LocationReviewView {
    private var imageSection:some View{
        ZStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)

    }
    
    private var titleSection: some View{
        VStack(alignment: .leading,spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button {
            
        } label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125,height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextMoreButton: some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125,height: 35)
        }
        .buttonStyle(.bordered)

    }
}
