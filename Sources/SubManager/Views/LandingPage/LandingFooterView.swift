//
//  LandingFooterView.swift
//  
//
//  Created by Yildirim, Alper on 4.07.2023.
//

import SwiftUI
#if os(iOS)

struct LandingFooterView: View {
    @Binding var currentPage: Int
    let pageCount: Int
    let dismissAction: () -> Void

    var body: some View {
        VStack {
            if currentPage < pageCount - 1 {
                HStack {
                    Button {
                        currentPage = pageCount - 1
                    } label: {
                        Text("Skip")
                            .foregroundColor(.blue)
                    }

                    Spacer()

                    HStack(spacing: 8) {
                        ForEach(0..<pageCount, id: \.self) { index in
                            Circle()
                                .frame(width: 8, height: 8)
                                .foregroundColor(currentPage == index ? .blue : .gray)
                        }
                    }

                    Spacer()
                }
                .padding(.vertical)
            } else {

                Button {
                    dismissAction()
                } label: {
                    Text("End")
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                }
                .padding(.vertical)
            }
        }
    }
}
#endif
