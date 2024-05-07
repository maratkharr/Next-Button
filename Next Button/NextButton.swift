//
//  ContentView.swift
//  Next Button
//
//  Created by Marat Kharrasov on 05.05.2024.
//

import SwiftUI

struct NextButton: View {
    @State var iconState = 0
    @State private var timer: Timer?
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.5, blendDuration: 0)) {
                    if iconState < 3 {
                        iconState = iconState + 1
                    } else {
                        iconState = 0
                    }
                }
            }, label: {
                ZStack {
                    Image(systemName: "play.fill")
                        .foregroundStyle(.tint)
                        .font(.title)
                        .scaleEffect((iconState == 0 || iconState == 3) ? 0 : 1, anchor: (iconState == 0 || iconState == 1) ? .leading : .trailing)
                        .offset(x: (iconState == 0 || iconState == 1) ? -10 : 10)
                        .opacity((iconState == 0 || iconState == 3) ? 0 : 1)
                    Image(systemName: "play.fill")
                        .foregroundStyle(.tint)
                        .font(.title)
                        .scaleEffect((iconState == 2 || iconState == 3) ? 0 : 1, anchor: (iconState == 0 || iconState == 3) ? .leading : .trailing)
                        .offset(x: (iconState == 0 || iconState == 3) ? -10 : 10)
                        .opacity((iconState == 2 || iconState == 3) ? 0 : 1)
                    Image(systemName: "play.fill")
                        .foregroundStyle(.tint)
                        .font(.title)
                        .scaleEffect((iconState == 2 || iconState == 1) ? 0 : 1, anchor: (iconState == 2 || iconState == 3) ? .leading : .trailing)
                        .offset(x: (iconState == 2 || iconState == 3) ? -10 : 10)
                        .opacity((iconState == 2 || iconState == 1) ? 0 : 1)
                    Image(systemName: "play.fill")
                        .foregroundStyle(.tint)
                        .font(.title)
                        .scaleEffect((iconState == 0 || iconState == 1) ? 0 : 1, anchor: (iconState == 1 || iconState == 2) ? .leading : .trailing)
                        .offset(x: (iconState == 1 || iconState == 2) ? -10 : 10)
                        .opacity((iconState == 0 || iconState == 1) ? 0 : 1)
                }
            })
            .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { isPressing in
                if isPressing {
                    startTimer()
                } else {
                    stopTimer()
                }
            }, perform: {})
            .buttonStyle(NoHighlightButtonStyle())
            .clipShape(.circle)
        }
    }
    private func startTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
                withAnimation(.linear) {
                    if iconState < 3 {
                        iconState = iconState + 1
                    } else {
                        iconState = 0
                    }
                }
            }
        }

        private func stopTimer() {
            timer?.invalidate()
            timer = nil
        }
}

#Preview {
    NextButton()
}
