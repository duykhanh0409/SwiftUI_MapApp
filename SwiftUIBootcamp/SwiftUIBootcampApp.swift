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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
