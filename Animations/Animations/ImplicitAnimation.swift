//
//  ImplicitAnimation.swift
//  Animations
//
//  Created by AV SW MacBook on 2022/03/27.
//

import SwiftUI

struct ImplicitAnimation: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        // applies default animation to the view
        // whenever animationAmount changes.
        // takes effect on all properties of the view that change
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.default, value: animationAmount)
    }
}

struct ImplicitAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitAnimation()
    }
}
