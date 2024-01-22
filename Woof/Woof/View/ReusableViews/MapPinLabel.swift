//
//  MapLabel.swift
//  Woof
//
//  Created by Nadzeya Shpakouskaya on 17/01/2024.
//

import SwiftUI

struct MapPinLabel: View {
    let text: String

    var body: some View {
        Text(text)
            .foregroundColor(.App.purpleDark)
            .fontWeight(.medium)
            .padding(.horizontal)
            .background(Color.App.grayLight)

            .clipShape(Capsule())
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.App.purpleDark, lineWidth: 1)
            )
    }
}

#Preview {
    MapPinLabel(text: "Wasraw, ul. Poli Gojawiczyńskiej 13")
}
