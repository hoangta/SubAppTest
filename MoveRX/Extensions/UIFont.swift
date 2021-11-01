//
//  UIFont.swift
//  MoveRX
//
//  Created by hoangta on 01/11/2021.
//

import UIKit

extension UIFont {
    static func bold(_ size: CGFloat) -> UIFont { UIFont(name: "Proxima Nova Bold", size: size)! }
}

extension UIFont {
    static func registerAppFonts() {
        registerFont("Proxima Nova Bold", fontExtension: "otf")
    }
    
    private static func registerFont(_ name: String, fontExtension: String) {
        guard let fontURL = Bundle.moveRx.url(forResource: name, withExtension: fontExtension) else {
            fatalError("Couldn't find font \(name)")
        }
        
        guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL) else {
            fatalError("Couldn't load data from the font \(name)")
        }
        
        guard let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }
        
        var error: Unmanaged<CFError>?
        let success = CTFontManagerRegisterGraphicsFont(font, &error)
        if !success {
            print("Error registering font: maybe it was already registered.")
        }
    }
}

