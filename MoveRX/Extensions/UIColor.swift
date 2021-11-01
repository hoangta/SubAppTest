//
//  UIColor.swift
//  MoveRX
//
//  Created by hoangta on 01/11/2021.
//

import UIKit

// MARK: Convenient factory methods
extension UIColor {
    /**
     Creates and returns a color from a hex string.
     - Parameter value: The hex string value.
     */
    static func hex(_ value: String, _ alpha: CGFloat? = 1.0) -> UIColor {
        let hex = value.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        return UIColor(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: alpha ?? 1.0)
    }
}

// MARK: Constants
// The color naming in the following is made with https://sipapp.io/
extension UIColor {
    /// A `Gray` color object with hex value of `#fffdf6`
    static let boulder = UIColor.hex("707070")
    
    /// A `Very Light Yellow` color object with hex value of `#fffdf6`
    static let blackWhite = UIColor.hex("fffdf6")
    
    /// A `Bright Yellow` color object with hex value of `#FACD2E`
    static let brightSun = UIColor.hex("FACD2E")
}
