//
//  FreeFoodUniversityApp.swift
//  FreeFoodUniversity
//
//  Created by Stephen Nemeth on 6/5/22.
//

import SwiftUI

@main
struct FreeFoodUniversityApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
