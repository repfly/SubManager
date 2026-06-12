//
//  Theme.swift
//  
//
//  Created by Yildirim, Alper on 3.07.2023.
//

import SwiftUI

public protocol Theme {
    var name: String { get set }
    var textColor: Color { get set }
    var backgroundColor: Color { get set }
    var accentColor: Color { get set }
    var primaryColor: Color { get set }
    var secondaryColor: Color { get set }
    var errorColor: Color { get set }
}

struct LightTheme: Theme {
    var name: String = "lightTheme"
    var textColor: Color = Color.black
    var backgroundColor: Color = Color.white
    var accentColor: Color = Color.blue
    var primaryColor: Color = Color.green
    var secondaryColor: Color = Color.orange
    var errorColor: Color = Color.red
}

struct DarkTheme: Theme {
    var name: String = "darkTheme"
    var textColor: Color = Color.white
    var backgroundColor: Color = Color.black
    var accentColor: Color = Color.orange
    var primaryColor: Color = Color.purple
    var secondaryColor: Color = Color.yellow
    var errorColor: Color = Color.red
}
