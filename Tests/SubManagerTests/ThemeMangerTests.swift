//
//  ThemeMangerTests.swift
//  
//
//  Created by Yildirim, Alper on 4.07.2023.
//

import XCTest
@testable import SubManager

class ThemeManagerTests: XCTestCase {
    var themeManager: ThemeManager!

    override func setUp() {
        super.setUp()
        themeManager = ThemeManager(theme: LightTheme())
    }

    override func tearDown() {
        themeManager = nil
        super.tearDown()
    }

    func testApplyTheme() {
        let theme = DarkTheme()
        themeManager.applyTheme(theme: theme)
        XCTAssertEqual(themeManager.getTheme().name, theme.name)
    }

    func testGetTheme() {
        let theme = LightTheme()
        XCTAssertEqual(themeManager.getTheme().name, theme.name)
    }

    func testApplyDefaultTheme_WithSelectedTheme() {
        themeManager.applyTheme(theme: DarkTheme())
        XCTAssertTrue(themeManager.getTheme() is DarkTheme)
    }

    func testApplyDefaultTheme_WithoutSelectedTheme() {
        themeManager.applyTheme(theme: LightTheme())
        XCTAssertTrue(themeManager.getTheme() is LightTheme)
    }
}
