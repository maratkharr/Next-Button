//
//  PlayerView.swift
//  Next Button
//
//  Created by Marat Kharrasov on 05.05.2024.
//

import SwiftUI

struct PlayerView: View {
    var body: some View {
        HStack {
            Spacer()
            Spacer()
            ContentView()
                .frame(width: 100, height: 100)
                .scaleEffect(CGSize(width: -1.0, height: 1.0))

            PlayPauseView()
                .frame(width: 100, height: 100)

            ContentView()
                .frame(width: 100, height: 100)
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    PlayerView()
}
