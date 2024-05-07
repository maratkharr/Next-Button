//
//  PlayPauseView.swift
//  Next Button
//
//  Created by Marat Kharrasov on 05.05.2024.
//

import SwiftUI

struct PlayPauseView: View {
    @State private var animate = false
    
    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0)) {
                animate.toggle()
            }
        }, label: {
            ZStack {
                Group{
                    Rectangle()
                        .frame(width: 36, height: animate ? 36 : 12)
                        .cornerRadius(4)
                        .offset(y: 10)
                    Rectangle()
                        .frame(width: 36, height: animate ? 36 : 12)
                        .cornerRadius(4)
                        .offset(y: -10)
                }
            }
            .mask {
                Image(systemName: "play.fill")
                    .scaleEffect(animate ? 2.25 : 6)
            }.rotationEffect(animate ? Angle(degrees: 0) : Angle(degrees: 90))
        })
        .buttonStyle(NoHighlightButtonStyle())
    }
}

struct NoHighlightButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(width: 84, height: 84)
                .foregroundColor(.blue)
                .background(configuration.isPressed ? Color.blue.opacity(0.1) : Color.clear)
                .clipShape(Circle())
                .scaleEffect(configuration.isPressed ? 0.8 : 1)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: configuration.isPressed)
    }
}


struct PlayPauseView_Previews: PreviewProvider {
    static var previews: some View {
        PlayPauseView()
    }
}
