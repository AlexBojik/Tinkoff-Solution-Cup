//
//  CardWithList.swift
//  TinkoffSolutionCup
//
//  Created by Aleksandr Tupikin on 22.04.2023.
//

import UIKit

public class CardWithList: ElevatedCard {
    
    public struct Model {
        let header: String
        let collection: [CellVeiw.Model]
        let button: (name: String, action: () -> Void)
    }
    
    let model: Model
    
    private lazy var headerView = HeaderText(text: model.header)
    private lazy var buttonView: UIView = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(model.button.name, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.height(24)
        return button
    }()
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 20
        stack.topMargin()
        stack.leadingMargin()
        stack.trailingMargin()
        stack.bottomMargin()
        
        model.collection.forEach { model in
            let cell = CellVeiw(model: model)
            cell.configure()
            cell.topMargin()
            cell.leadingMargin()
            cell.trailingMargin()
            cell.bottomMargin()
            stack.addArrangedSubview(cell)
        }
        
        return stack
    }()
    
    public init(model: Model) {
        self.model = model
        super.init()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(headerView)
        addSubview(buttonView)
        addSubview(stackView)
        
        headerView.topMargin(16)
        headerView.leadingMargin(20)
        
        buttonView.topMargin(16)
        buttonView.trailingMargin(20)
        
        stackView.topMargin(12, headerView)
        stackView.leadingMargin(4)
        stackView.trailingMargin(4)
        stackView.bottomMargin(20)
    }
    
    @objc private func buttonAction() {
        model.button.action()
    }
}
