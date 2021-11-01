//
//  MoveRx.swift
//  MoveRX
//
//  Created by hoangta on 01/11/2021.
//

import UIKit

public protocol MoveRxDelegate: AnyObject {
    func moveRxDidDismiss()
}

public final class MoveRx {
    public static let shared = MoveRx()
    public weak var delegate: MoveRxDelegate?
    
    public func show(from viewController: UIViewController) {
        let tabbar = TabbarController()
        tabbar.modalPresentationStyle = .fullScreen
        viewController.present(tabbar, animated: true)
    }
}
