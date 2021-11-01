//
//  UIImage.swift
//  MoveRX
//
//  Created by hoangta on 01/11/2021.
//

import UIKit

extension UIImage {
    static let close = UIImage(named: "icon-close", in: .moveRx, compatibleWith: nil)!
    static let home = UIImage(named: "icon-home", in: .moveRx, compatibleWith: nil)!
    static let delivery = UIImage(named: "icon-delivery", in: .moveRx, compatibleWith: nil)!
    static let chat = UIImage(named: "icon-chat", in: .moveRx, compatibleWith: nil)!
    static let search = UIImage(named: "icon-search", in: .moveRx, compatibleWith: nil)!
}

extension Bundle {
    static let moveRx = Bundle(for: MoveRx.self)
}
