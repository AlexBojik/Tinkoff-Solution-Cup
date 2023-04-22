//
//  CellVeiw.swift
//  TinkoffSolutionCup
//
//  Created by Aleksandr Tupikin on 22.04.2023.
//

import UIKit

public class CellVeiw: UIView {
    
    public struct Model {
        let title: String
        let description: String
        let image: UIImage
    }
    
    private let model: Model
    
    private lazy var titleView: UIView = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = model.title
        label.sizeToFit()
        return label
    }()
    
    private lazy var descriptionView: UIView = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = model.description
        label.sizeToFit()
        return label
    }()
    
    private lazy var imageView = Avatar(image: model.image)
    
    public init(model: Model) {
        self.model = model
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        addSubview(imageView)
        addSubview(titleView)
        addSubview(descriptionView)
        
        imageView.topMargin(8)
        imageView.leadingMargin(16)
        imageView.bottomMargin(8)
        
        titleView.topMargin(8)
        titleView.leadingMargin(16, imageView)
        titleView.trailingMargin(16)

        descriptionView.bottomMargin(8)
        descriptionView.leadingMargin(16, imageView)
        descriptionView.trailingMargin(16)
    }
}
