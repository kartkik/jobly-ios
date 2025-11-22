//
//  JoblyApp.swift
//  Jobly
//
//  Created by 12345 on 05/08/1404 AP.
//

import SwiftUI

@main
struct JoblyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            JobListView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
