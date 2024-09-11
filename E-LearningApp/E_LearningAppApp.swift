//
//  E_LearningAppApp.swift
//  E-LearningApp
//
//  Created by Hussnain Ahmad on 11/09/2024.
//

import SwiftUI
import SwiftData

@main
struct E_LearningAppApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)

        }
    }
}
