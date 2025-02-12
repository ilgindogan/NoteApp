//
//  NoteAppApp.swift
//  NoteApp
//
//  Created by ILGIN DOGAN on 12.02.2025.
//

import SwiftUI

@main
struct NoteAppApp: App {
    @StateObject private var userManager = UserManager.shared
    
    var body: some Scene {
        WindowGroup {
            if userManager.isAuthenticated {
                CounterView(userManager: userManager)
            } else {
                LoginView()
            }
        }
    }
}
