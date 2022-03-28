//
//  AnimationBinding.swift
//  Animations
//
//  Created by AV SW MacBook on 2022/03/27.
//

import SwiftUI

struct AnimationBinding: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        // important
        print(animationAmount)
        
        return VStack {
            Stepper("Scale amount",
                    value: $animationAmount.animation(
                        .easeInOut(duration: 1)
                            .repeatCount(3, autoreverses: true)
                    ), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct AnimationBinding_Previews: PreviewProvider {
    static var previews: some View {
        AnimationBinding()
    }
}
