//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by George Mapaya on 2022-06-17.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
