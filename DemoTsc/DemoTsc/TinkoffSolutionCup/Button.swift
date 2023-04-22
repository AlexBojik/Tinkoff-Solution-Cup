//
//  Button.swift
//  TinkoffSolutionCup
//
//  Created by Aleksandr Tupikin on 22.04.2023.
//

import UIKit

public class Button: UIView {
    
    private let label = UILabel()
    
    public init(text: String) {
        super.init(frame: .zero)
        setupUI(text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(_ text: String) {
        layer.cornerRadius = 12
        backgroundColor = UIColor(red: 0, green: 0.063, blue: 0.141, alpha: 0.03)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 44).isActive = true
        addSubview(label)
        label.text = text
        label.textColor = UIColor(red: 0.259, green: 0.545, blue: 0.976, alpha: 1)
        label.font = .systemFont(ofSize: 15)
        label.attributedText = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.kern: -0.24])
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
