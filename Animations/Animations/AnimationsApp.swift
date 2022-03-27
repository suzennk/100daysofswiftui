//
//  AnimationsApp.swift
//  Animations
//
//  Created by AV SW MacBook on 2022/03/27.
//

import SwiftUI

@main
struct AnimationsApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
//                ImplicitAnimation()
//                AnimationBinding()
                ExplicitAnimation()
            }
        }
    }
}
