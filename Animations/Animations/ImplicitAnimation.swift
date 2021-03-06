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
//            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                // applies animation to the view
                // whenever animationAmount changes.
                // takes effect on all properties of the view that change
                // actually creates an instance of animation struct that has its own set of modifier
                .animation(
                    .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
    }
}

struct ImplicitAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitAnimation()
    }
}
