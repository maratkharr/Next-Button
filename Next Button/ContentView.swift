//
//  ContentView.swift
//  Next Button
//
//  Created by Marat Kharrasov on 05.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var isForward = false
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation(.spring(response: 0.67, dampingFraction: 0.67, blendDuration: 0)) {
                    isForward.toggle()
                } completion: {
                    isForward.toggle()
                }
            }, label: {
                HStack(spacing: -4) {
                    Image(systemName: "play.fill")
                        .foregroundStyle(.tint)
                        .font(.title)
                        .scaleEffect(isForward ? 1 : 0, anchor: .trailing)
                    Image(systemName: "play.fill")
                        .foregroundStyle(.tint)
                        .font(.title)
                    Image(systemName: "play.fill")
                        .foregroundStyle(.tint)
                        .font(.title)
                        .scaleEffect(isForward ? 0 : 1, anchor: .leading)
                        .opacity(isForward ? 0 : 1)
                }.padding(EdgeInsets(top: 0, leading: isForward ? 20 : -20, bottom: 0, trailing: 0))
            })
        }
    }
}

#Preview {
    ContentView()
}
