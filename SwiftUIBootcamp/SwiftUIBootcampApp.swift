//
//  SwiftUIBootcampApp.swift
//  SwiftUIBootcamp
//
//  Created by Thuocsi on 04/03/2023.
//

import SwiftUI

@main
struct SwiftUIBootcampApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var vm = LocationViewModel()

    var body: some Scene {
        WindowGroup {
            LocationView().environmentObject(vm)
        }
    }
}
