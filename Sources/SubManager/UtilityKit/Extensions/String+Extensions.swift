//
//  File.swift
//  
//
//  Created by Yildirim, Alper on 4.07.2023.
//

import Foundation

extension String {
    var isBlank: Bool {
        self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty
    }

    func toInt() -> Int? {
        Int(self)
    }
}
