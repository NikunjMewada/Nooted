//
//  AppFonts.swift
//  Nooted
//
//  Created by Nikunj Mewada on 20/03/24.
//

import SwiftUI

enum AppFonts {
    static func regular(_ ofSize: Int) -> Font {
        .custom("Lufga-Regular", size: CGFloat(ofSize))
    }
    
    static func thin(_ ofSize: Int) -> Font {
        .custom("Lufga-Thin", size: CGFloat(ofSize))
    }
}

extension AppFonts {
    static func title() -> Font {
        self.regular(40)
    }
    
    static func subtitle() -> Font {
        self.thin(30)
    }
}
