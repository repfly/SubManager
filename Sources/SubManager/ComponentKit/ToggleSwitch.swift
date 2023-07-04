//
//  ToggleSwitch.swift
//
//
//  Created by Yildirim, Alper on 4.07.2023.
//
import SwiftUI

struct ToggleSwitch: View {
    @Binding var isOn: Bool
    var onColor: Color = .green
    var offColor: Color = .gray

    var body: some View {
        Button(action: toggleIsOn) {
            RoundedRectangle(cornerRadius: 10)
                .fill(isOn ? onColor : offColor)
                .frame(width: 60, height: 30)
                .overlay(switchCircleOverlay)
        }
    }

    private var switchCircleOverlay: some View {
        Circle()
            .fill(Color.white)
            .shadow(radius: 1, x: 0, y: 1)
            .offset(x: isOn ? 15 : -15, y: 0)
    }

    private func toggleIsOn() {
        withAnimation {
            isOn.toggle()
        }
    }
}
