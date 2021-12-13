//
//  EnvironmentModifiers.swift
//  ViewsAndModifiers
//
//  Created by Susan Kim on 2021/12/13.
//

import SwiftUI

struct EnvironmentModifiers: View {
    var body: some View {
        VStack {
            Text("Gryffindor")
                // Child's modifier takes priority over parent modifier
                .font(.largeTitle)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
                // This modifier is cumulative
                .blur(radius: 2)
        }
        // Environment modifier
        .font(.title)
        .blur(radius: 2)
    }
}

struct EnvironmentModifiers_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentModifiers()
    }
}
