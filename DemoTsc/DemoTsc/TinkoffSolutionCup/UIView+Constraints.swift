//
//  UIView+Constraints.swift
//  TinkoffSolutionCup
//
//  Created by Aleksandr Tupikin on 22.04.2023.
//

import UIKit

public extension UIView {
    
    func topMargin(_ x: CGFloat = 0, _ view: UIView? = nil) {
        if let view = view {
            topAnchor.constraint(equalTo: view.bottomAnchor, constant: x).isActive = true
        } else if let superview {
            topAnchor.constraint(equalTo: superview.topAnchor, constant: x).isActive = true
        }
    }
    
    func leadingMargin(_ x: CGFloat = 0, _ view: UIView? = nil) {
        if let view = view {
            leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: x).isActive = true
        } else if let superview {
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: x).isActive = true
        }
    }
    
    func trailingMargin(_ x: CGFloat = 0, _ view: UIView? = nil) {
        if let view = view {
            trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -x).isActive = true
        } else if let superview {
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -x).isActive = true
        }
    }
    
    func bottomMargin(_ x: CGFloat = 0, _ view: UIView? = nil) {
        if let view = view {
            bottomAnchor.constraint(equalTo: view.topAnchor, constant: -x).isActive = true
        } else if let superview {
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -x).isActive = true
        }
    }
    
    func height(_ x: CGFloat = 0, _ view: UIView? = nil) {
        heightAnchor.constraint(equalToConstant: x).isActive = true
    }
}
