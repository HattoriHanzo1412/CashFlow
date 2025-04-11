//
//  AnimatedBackground.swift
//  Projektwoche1
//
//  Created by Denny Sprenger on 10.04.25.
//

import SwiftUI

struct AnimatedView: View {
    
    @Binding var colors: [Color]
    
    private var opacityColors: [Color] {
        colors.map { color in
            color.opacity(opacity)
        }
    }
    
    @State private var opacity = 2.0
    @State private var startPoint: UnitPoint = .topLeading
    @State private var endPoint: UnitPoint = .bottomTrailing
    
    var body: some View {
        LinearGradient(
            colors: opacityColors,
            startPoint: startPoint,
            endPoint: endPoint
        )
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.easeInOut(duration: 5).repeatForever(autoreverses: true)) {
                startPoint = .topTrailing
                endPoint = .bottomTrailing
                opacity = 0.9
            }
        }
    }
}


#Preview {
    AnimatedView(colors: .constant([.green, .white,.blue]))
}
