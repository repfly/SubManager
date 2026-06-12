//
//  EmptyStateView.swift
//  
//
//  Created by Yildirim, Alper on 4.07.2023.
//

import SwiftUI

struct EmptyStateView: View {
    var message: String

    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.largeTitle)
                .foregroundColor(.gray)
            Text(message)
                .foregroundColor(.gray)
        }
    }
}
