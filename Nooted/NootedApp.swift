//
//  NootedApp.swift
//  Nooted
//
//  Created by Nikunj Mewada on 20/03/24.
//

import SwiftUI

@main
struct NootedApp: App {
    @State var shouldGoHome = false

    var body: some Scene {
        WindowGroup {
            Group {
                if shouldGoHome {
                    HomeView()
                } else {
                    OnboardingView() {
                        UserDefaults.standard.set(true, forKey: "isOnboarded")
                        shouldGoHome = true
                    }
                }
            }
            .onAppear {
                shouldGoHome = UserDefaults.standard.bool(forKey: "isOnboarded")
            }
        }
    }
}
