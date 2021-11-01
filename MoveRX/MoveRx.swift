//
//  MoveRx.swift
//  MoveRX
//
//  Created by hoangta on 01/11/2021.
//

import UIKit

protocol MoveRxDelegate: AnyObject {
    func moveRxDidDismiss()
}

public final class MoveRx {
    static let shared = MoveRx()
    private weak var delegate: MoveRxDelegate?
    
    func show(from viewController: UIViewController) {
        let tabbar = TabbarController()
        tabbar.modalPresentationStyle = .fullScreen
        viewController.present(tabbar, animated: true)
    }
}
