//
//  Avatar.swift
//  TinkoffSolutionCup
//
//  Created by Aleksandr Tupikin on 22.04.2023.
//

import UIKit

public class Avatar: UIImageView {
    
    public init(image: UIImage) {
        super.init(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        self.image = image.withAlignmentRectInsets(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        layer.cornerRadius = 100
        setAnchors()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAnchors() {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: 40).isActive = true
        heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
