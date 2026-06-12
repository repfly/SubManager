//
//  SheetView.swift
//
//
//  Created by Yildirim, Alper on 4.07.2023.
//

import SwiftUI

struct SheetView<Content: View>: View {
    var content: Content
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            Spacer()
            content
            Spacer()
            Button("Close", action: { isPresented = false })
                .padding()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
