//
//  TabbarController.swift
//  MoveRX
//
//  Created by hoangta on 31/10/2021.
//

import UIKit
import Oneline
import TinyConstraints
import RxSwift
import RxCocoa

final class TabbarController: UIViewController {
    private let closeButton = UIButton().image(.close)
    private let profileImageView = UIImageView()
    private let homeButton = TabbarButton(title: "HOME", image: .home)
    private let deliveryButton = TabbarButton(title: "DELIVERY", image: .delivery)
    private let chatButton = TabbarButton(title: "CHAT", image: .chat)
    private let searchButton = TabbarButton(title: "SEARCH", image: .search)
    private let childContainerView = UIView()
    
    private let disposeBag = DisposeBag()
    
    lazy var tab1Scene: Tab1 = {
        let tab = Tab1()
        tab.view.backgroundColor = .red
        return tab
    }()
    
    lazy var tab2Scene: Tab2 = {
        let tab = Tab2()
        tab.view.backgroundColor = .blue
        return tab
    }()
    
    lazy var tab3Scene: Tab3 = {
        let tab = Tab3()
        tab.view.backgroundColor = .green
        return tab
    }()
    
    lazy var tab4Scene: Tab4 = {
        let tab = Tab4()
        tab.view.backgroundColor = .cyan
        return tab
    }()
    
    // MARK: View lifecircle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIs()
        setupActions()
//        bindViewModel()
    }
}

// MARK: UIs
extension TabbarController {
    private func setupUIs() {
        view.backgroundColor = .blackWhite
        
        // Main container stack
        let containerStackView = UIStackView().axis(.vertical).alignment(.center)
        view.addSubview(containerStackView)
        containerStackView.edgesToSuperview()
        
        // Top bar view
        let topBarContainerView = UIView().bgColor(.white)
        containerStackView.addArrangedSubview(topBarContainerView)
        topBarContainerView.leftToSuperview()
        
        closeButton.size(CGSize(width: 45, height: 45))
        let topBarView = UIStackView(arrangedSubviews: [
            closeButton,
            UILabel("Move Rx Home").font(.bold(14)),
            profileImageView
        ]).distribution(.equalSpacing).alignment(.center)
        topBarView.height(52)
        topBarContainerView.addSubview(topBarView)
        topBarView.edgesToSuperview(usingSafeArea: true)
        
        // Title label
        let titleLabel = UILabel("MOVE Rx").font(.bold(14))
        titleLabel.height(60)
        containerStackView.addArrangedSubview(titleLabel)
        
        // Tabbar buttons
        let tabbarButtonsStackView = UIStackView(arrangedSubviews: [homeButton, deliveryButton, chatButton, searchButton]).spacing(35)
        containerStackView.addArrangedSubview(tabbarButtonsStackView)
        containerStackView.setCustomSpacing(20, after: tabbarButtonsStackView)
        
        // Divider view
        let divider = UIView().bgColor(.boulder)
        divider.height(0.25)
        containerStackView.addArrangedSubview(divider)
        divider.leftToSuperview(offset: 20)
        
        containerStackView.addArrangedSubview(childContainerView)
        childContainerView.leftToSuperview()
    }
    
    private func setContent(_ scene: UIViewController) {
        childContainerView.subviews.forEach { $0.removeFromSuperview() }
        childContainerView.addSubview(scene.view)
        scene.view.edgesToSuperview()
    }
}

// MARK: Actions
extension TabbarController {
    private func setupActions() {
        closeButton.rx.tap
            .subscribe(onNext: {
                // Dismiss this sub app
            })
            .disposed(by: disposeBag)
        
        homeButton.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { [unowned self] in setContent(tab1Scene) })
            .disposed(by: disposeBag)
        
        deliveryButton.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { [unowned self] in setContent(tab2Scene) })
            .disposed(by: disposeBag)
        
        chatButton.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { [unowned self] in setContent(tab3Scene) })
            .disposed(by: disposeBag)
        
        searchButton.rx.controlEvent(.touchUpInside)
            .subscribe(onNext: { [unowned self] in setContent(tab4Scene) })
            .disposed(by: disposeBag)
    }
}

// MARK: Custom Controls
extension TabbarController {
    final class TabbarButton: UIControl {
        private let selectingPlatformView = UIView().bgColor(.brightSun).hide()
        
        convenience init(title: String, image: UIImage) {
            self.init(frame: .zero)
            selectingPlatformView.height(2)
            
            let contentStackView = UIStackView(arrangedSubviews: [
                UIImageView(image: image),
                selectingPlatformView,
                UILabel(title).font(.bold(10))
            ]).spacing(8).axis(.vertical).alignment(.center).canInteract(false)
                                    
            addSubview(contentStackView)
            contentStackView.edgesToSuperview()
        }
    }
}

// MARK: Placeholders
final class Tab1: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Tab1 did appear")
    }
}
final class Tab2: UIViewController {}
final class Tab3: UIViewController {}
final class Tab4: UIViewController {}
