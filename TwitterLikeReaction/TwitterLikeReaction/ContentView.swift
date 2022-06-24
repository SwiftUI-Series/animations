//
//  ContentView.swift
//  Twitter's Like Reaction
//
//   Created by getstream.io
//

import SwiftUI

struct ContentView: View {
    
    let streamBlue = Color(#colorLiteral(red: 0, green: 0.3725490196, blue: 1, alpha: 1))
    
    // Increament the number of likes by 1 when tapped
    @State private var liked: Int = 239
    
    // Initial outline heart icon
    @State private var heart = Image(systemName: "heart")
    @State private var showHeart = false
    @State private var showSplash = false
    @State private var removeSplash = false
    @State private var likedColor = Color(.systemGray)
    @State private var removeInnerStroke = false
    
    var body: some View {
        HStack {
            ZStack {
                heart
                    .font(.largeTitle)
                    .foregroundColor(Color(.systemGray))
                
                // Inner stroke
                Circle()
                    .strokeBorder(lineWidth:  removeInnerStroke ? 0 : 35)
                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(.systemPink))
                    .scaleEffect(removeInnerStroke ? 1.3 : 0.0)
                    .hueRotation(.degrees(removeInnerStroke ? 270 : 0))
                
                // Filled heart
                Image(systemName: "heart.fill")
                    .font(.largeTitle)
                    .foregroundColor(streamBlue)
                    .scaleEffect(showHeart ? 1 : 0)
                
                // Circular splash
                SplashView()
                    .scaleEffect(showSplash ? 1 : 0)
                    .opacity(removeSplash ? 0 : 1)
                
            }
            .onTapGesture {
                withAnimation(.interpolatingSpring(stiffness: 170, damping: 10).delay(0.1)) {
                    showHeart = true
                }
                
                withAnimation(.easeIn) {
                    showSplash = true
                }
                
                withAnimation(.easeOut.delay(0.5)) {
                    removeSplash = true
                }
                
                withAnimation(.easeOut.delay(0.2)) {
                    removeInnerStroke = true
                }
                
                liked += 1
                likedColor = streamBlue
            }.accessibilityAddTraits(.isButton)
            
            Text("\(liked)")
                .foregroundColor(likedColor)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
