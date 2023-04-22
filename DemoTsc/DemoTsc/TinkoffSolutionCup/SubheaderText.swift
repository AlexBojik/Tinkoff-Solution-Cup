//
//  SubheaderText.swift
//  TinkoffSolutionCup
//
//  Created by Aleksandr Tupikin on 22.04.2023.
//

import UIKit

public class SubheaderText: UILabel {
    
    public init(text: String) {
        super.init(frame: .zero)
        setupUI(text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(_ text: String) {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = UIColor(red: 0.573, green: 0.6, blue: 0.635, alpha: 1)
        font = UIFont.systemFont(ofSize: 15)
        attributedText = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.kern: -0.24])
        sizeToFit()
    }
}
