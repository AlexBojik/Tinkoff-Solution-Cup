//
//  CardLarge.swift
//  DemoTsc
//
//  Created by Aleksandr Tupikin on 22.04.2023.
//

import UIKit

public class CardLarge: ElevatedCard {
    
    private let action: (() -> Void)?
    private let iconRight: Bool
    private let closeButton: Bool
    
    private lazy var shadows = UIView()
    private lazy var shapes = UIView()
    private lazy var shadowsLayer: CALayer = {
        let layer0 = CALayer()
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 34
        layer0.shadowOffset = CGSize(width: 0, height: 6)
        return layer0
    }()
    private lazy var shapesLayer: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.white.cgColor
        shapes.layer.cornerRadius = 24
        return layer
    }()

    public init(
        header: String,
        subheader: String? = nil,
        image: UIImage,
        action: (() -> Void)? = nil,
        iconRight: Bool = true,
        closeButton: Bool = false
    ) {
        self.action = action
        self.iconRight = iconRight
        self.closeButton = closeButton
        super.init()
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 34
        addContent(header, subheader, image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addContent(
        _ header: String,
        _ subheader: String?,
        _ image: UIImage
    ) {
        let headerView = HeaderText(text: header)
        let avatarView = Avatar(image: image)
        let subHeaderView = SubheaderText(text: subheader ?? "")
        let closeButtonView = makeCloseButton()
        
        var headerTopMargin: CGFloat = 24
        var avatarBotomMargin: CGFloat = 16
        addSubview(headerView)
        addSubview(avatarView)
        addSubview(subHeaderView)
        addSubview(closeButtonView)
        subHeaderView.alpha = 0
        closeButtonView.alpha = 0

        if subheader != nil {
            headerTopMargin = 16
            avatarBotomMargin = 28
            subHeaderView.alpha = 1
        }
        
        if action != nil {
            avatarBotomMargin = 88
            let button = Button(text: "Button")
            let gesture = UITapGestureRecognizer(target: self, action: #selector(buttonAction))
            button.addGestureRecognizer(gesture)
            
            addSubview(button)
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        }
        
        if iconRight {
            headerView.topAnchor.constraint(equalTo: topAnchor, constant: headerTopMargin).isActive = true
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
            
            avatarView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
            avatarView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
            avatarView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -avatarBotomMargin).isActive = true
            
            subHeaderView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8).isActive = true
            subHeaderView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor).isActive = true
        } else {
            avatarView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
            avatarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
            avatarView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true

            headerView.topAnchor.constraint(equalTo: topAnchor, constant: headerTopMargin).isActive = true
            headerView.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 16).isActive = true
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
            
            subHeaderView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8).isActive = true
            subHeaderView.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 16).isActive = true
            subHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        }
        
        if closeButton {
            closeButtonView.alpha = 1
            closeButtonView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
            closeButtonView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        }
    }
    
    @objc func buttonAction() {
        action?()
    }
    
    private func makeCloseButton() -> UIView {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "cross")
        view.layer.cornerRadius = 24
        view.backgroundColor = UIColor(red: 0.965, green: 0.969, blue: 0.973, alpha: 1)
        
        view.widthAnchor.constraint(equalToConstant: 24).isActive = true
        view.heightAnchor.constraint(equalToConstant: 24).isActive = true
        return view
    }
}
