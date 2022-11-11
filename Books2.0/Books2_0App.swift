//
//  Books2_0App.swift
//  Books2.0
//
//  Created by Adam Gerber on 11/11/2022.
//

import SwiftUI

@main
struct Books2_0App: App {
    @State private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
