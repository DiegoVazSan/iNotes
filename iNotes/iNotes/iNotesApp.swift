//
//  iNotesApp.swift
//  iNotes
//
//  Created by Diego Vazquez Sanchez on 27/03/24.
//

import SwiftUI

@main
struct iNotesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
