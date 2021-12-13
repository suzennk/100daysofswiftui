//
//  ViewsAndModifiersApp.swift
//  Shared
//
//  Created by Susan Kim on 2021/12/13.
//

import SwiftUI

@main
struct ViewsAndModifiersApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            SomeView()
            ConditionalModifiers()
            EnvironmentModifiers()
            ViewsAsProperties()
            ViewComposition()
        }
    }
}
