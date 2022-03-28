//
//  AnimationStack.swift
//  Animations
//
//  Created by AV SW MacBook on 2022/03/27.
//

import SwiftUI

struct AnimationStack: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .animation(nil, value: enabled)
        .foregroundColor(.white)
        // modifiers' order matter!
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        // you can have as many animation modifiers as you want
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
    }
}

struct AnimationStack_Previews: PreviewProvider {
    static var previews: some View {
        AnimationStack()
    }
}
