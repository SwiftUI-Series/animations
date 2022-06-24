//
//  ContentView.swift
//  Medium's Cumulative Clap Reaction
//
//  Created by getstream.io
//

import SwiftUI

struct ContentView: View {
    @State private var didClap = 4
    @State private var moving = false
    @State private var showSplash = false
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 54, height: 54)
                    .foregroundColor(.green)
                    .opacity(0.8)
                
                Text("+") + Text("\(didClap)")
                
                // Circular splash
                SplashView()
                    .scaleEffect(showSplash ? 1 : 0)
                    .rotationEffect(.degrees(showSplash ? 30 : -15))
            }
            .opacity(moving ? 1 : 0)
            .offset(y: moving ? 0 : 50)
            
            HStack {
                Image(systemName: "hands.clap.fill")
                    .font(.largeTitle)
                    .onTapGesture {
                        didClap += 1
                        withAnimation(.easeOut(duration: 0.5).repeatCount(1, autoreverses: false)){
                            moving = true
                        }
                        
                        withAnimation(.easeInOut(duration: 0.6).delay(0.6).repeatCount(1, autoreverses: false)){
                            moving = false
                        }
                        
                        // Try different easings
                        /*
                         withAnimation(.timingCurve(0.68, -0.6, 0.32, 1.6)) {
                            showSplash = true
                        }
                        */
                        withAnimation(.easeOut) {
                            showSplash = true
                        }
                        
                        withAnimation(.easeOut(duration: 0.05).delay(0.6).repeatCount(1, autoreverses: false)){
                            showSplash = false
                        }
                        
                    }
                
                Text("\(didClap)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
