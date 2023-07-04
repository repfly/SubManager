//
//  LandingPage.swift
//
//
//  Created by Yildirim, Alper on 4.07.2023.
//

import SwiftUI
#if os(iOS)
public struct LandingPage<Content: View>: View {
    private let pages: [Content]
    private let pageCount: Int

    @State private var currentPage = 0
    private let dismissAction: () -> Void

    public init(dismissAction: @escaping () -> Void, @ViewBuilder content: () -> [Content]) {
        self.pages = content()
        self.pageCount = pages.count
        self.dismissAction = dismissAction
    }

    public var body: some View {
        VStack {
            Spacer()

            TabView(selection: $currentPage) {
                ForEach(0..<pageCount, id: \.self) { index in
                    pages[index]
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))

            Spacer()

            LandingFooterView(currentPage: $currentPage, pageCount: pageCount, dismissAction: dismissAction)
        }
        .padding()
    }
}
#endif
