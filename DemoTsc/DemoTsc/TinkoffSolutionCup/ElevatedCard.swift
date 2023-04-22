//
//  ShadowCard.swift
//  TinkoffSolutionCup
//
//  Created by Aleksandr Tupikin on 22.04.2023.
//

import UIKit

public class ElevatedCard: UIView {
    private lazy var shadows = UIView()
    private lazy var shapes = UIView()
    private lazy var shadowsLayer: CALayer = {
        let layer = CALayer()
        layer.shadowColor = UIColor.black.withAlphaComponent(0.12).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 34
        layer.shadowOffset = CGSize(width: 0, height: 6)
        return layer
    }()
    private lazy var shapesLayer: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.white.cgColor
        shapes.layer.cornerRadius = 24
        return layer
    }()

    public init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 34
        addShadow()
    }
    
    public override func layoutSubviews() {
        drawShadows()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addShadow() {
        shadows.clipsToBounds = false
        addSubview(shadows)
        shadows.layer.addSublayer(shadowsLayer)
        
        shapes.clipsToBounds = true
        addSubview(shapes)
        shapes.layer.addSublayer(shapesLayer)
        
        shadows.translatesAutoresizingMaskIntoConstraints = false
        shadows.topAnchor.constraint(equalTo: topAnchor).isActive = true
        shadows.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        shadows.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        shadows.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        shapes.translatesAutoresizingMaskIntoConstraints = false
        shapes.topAnchor.constraint(equalTo: topAnchor).isActive = true
        shapes.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        shapes.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        shapes.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func drawShadows() {
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 24)
        shadowsLayer.frame = bounds
        shadowsLayer.shadowPath = shadowPath.cgPath
        shapesLayer.frame = bounds
    }
}
