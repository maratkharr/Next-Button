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
        ZStack {
            Rectangle()
                .frame(width: 36, height: animate ? 36 : 12)
                .foregroundColor(Color.blue)
                .cornerRadius(4)
                .offset(y: 10)
            Rectangle()
                .frame(width: 36, height: animate ? 36 : 12)
                .foregroundColor(Color.blue)
                .cornerRadius(4)
                .offset(y: -10)
        }
        .mask {
            Image(systemName: "play.fill")
                .scaleEffect(animate ? 2 : 6)
        }.rotationEffect(animate ? Angle(degrees: 0) : Angle(degrees: -90))
        .onTapGesture {
            withAnimation(.spring(response: 0.67, dampingFraction: 0.67, blendDuration: 0)){
                animate.toggle()
            }
        }
    }
}

struct PlayPauseView_Previews: PreviewProvider {
    static var previews: some View {
        PlayPauseView()
    }
}
