//
//  AnimationExtensions.swift
//  Nooted
//
//  Created by Nikunj Mewada on 25/03/24.
//

import SwiftUI

struct LoadUpAnimation: ViewModifier {
    let time: TimeInterval
    let shouldEaseIn: Bool
    @State private var opacity: CGFloat = 0
    @State private var yOffset: CGFloat = 100

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
                .opacity(opacity)
                .offset(y: shouldEaseIn ? 1.0 : yOffset)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + time) {
                        let baseAnimation = shouldEaseIn ? Animation.easeIn(duration: 0.5) : Animation.easeInOut(duration: 1)
                        
                        withAnimation(baseAnimation) {
                            opacity = 1.0
                            yOffset = 0
                        }
                    }
                }
        }
    }
}

extension View {
    func loadUp(_ withDelay: TimeInterval = 1.0, _ shouldEaseIn: Bool = false) -> some View {
        modifier(LoadUpAnimation(time: withDelay, shouldEaseIn: false))
    }
    
    func easeIn(_ withDelay: TimeInterval = 1.0) -> some View {
        modifier(LoadUpAnimation(time: withDelay, shouldEaseIn: true))
    }
}
