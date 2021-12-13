//
//  ViewsAsProperties.swift
//  ViewsAndModifiers
//
//  Created by Susan Kim on 2021/12/13.
//

import SwiftUI

struct ViewsAsProperties: View {
    var motto1: some View {
        Text("Draco dormiens")
    }
    let motto2 = Text("nunqual titillandus")
    
    var spells1: some View {
        // Group will align views according to type of Stack they are stacked in
        Group {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    // must explicitly use @ViewBuilder on custom-made properties
    // acts same as body
    // wrap up in tuple view automatically
    @ViewBuilder var spells2: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        VStack {
            motto1
                .foregroundColor(.red)
            motto2
                .foregroundColor(.blue)
            spells1
        }

        spells2
    }
}

struct ViewsAsProperties_Previews: PreviewProvider {
    static var previews: some View {
        ViewsAsProperties()
    }
}
