//
//  ThemeManager.swift
//
//
//  Created by Yildirim, Alper on 22.06.2023.
//
import SwiftUI

class ThemeManager {
    @AppStorage("selectedTheme") private var selectedTheme: String = ""
    @Environment(\.colorScheme) var colorScheme
    private var theme: Theme

    init(selectedTheme: String = "", theme: Theme) {
        self.selectedTheme = selectedTheme
        self.theme = theme
    }

    public func applyTheme(theme: Theme) {
        self.theme = theme
        selectedTheme = theme.name
    }

    public func getTheme() -> Theme {
        theme
    }

    /// If exists, applies the theme that stored in the user defaults. Otherwise, it applies the default light theme.
    private func applyDefaultTheme() {
        if !selectedTheme.isEmpty {
            theme = selectedTheme == "dark" ? DarkTheme() : LightTheme()
        } else {
            theme = LightTheme()
        }
    }
}

struct ThemeKey: EnvironmentKey {
    static let defaultValue: ThemeManager = .init(theme: LightTheme())
}

extension EnvironmentValues {
    var themeManager: ThemeManager {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}
