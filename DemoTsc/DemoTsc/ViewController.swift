//
//  ViewController.swift
//  DemoTsc
//
//  Created by Aleksandr Tupikin on 22.04.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let cardLarge = CardLarge(header: "Header", subheader: "Subheader", image: .checkmark)
        view.addSubview(cardLarge)

        let cardLarge1 = CardLarge(header: "Header", image: .remove)
        view.addSubview(cardLarge1)

        let cardLarge2 = CardLarge(header: "Header", image: .checkmark) {
            print("button work")
        }
        view.addSubview(cardLarge2)

        let cardLarge3 = CardLarge(header: "Header", subheader: "Subheader", image: .checkmark, iconRight: false)
        view.addSubview(cardLarge3)

        let cardLarge4 = CardLarge(header: "Header", subheader: "Subheader", image: .checkmark, iconRight: false, closeButton: true)
        view.addSubview(cardLarge4)


        cardLarge.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        cardLarge.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        cardLarge.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true

        cardLarge1.topAnchor.constraint(equalTo: cardLarge.bottomAnchor, constant: 20).isActive = true
        cardLarge1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        cardLarge1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true

        cardLarge2.topAnchor.constraint(equalTo: cardLarge1.bottomAnchor, constant: 20).isActive = true
        cardLarge2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        cardLarge2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true

        cardLarge3.topAnchor.constraint(equalTo: cardLarge2.bottomAnchor, constant: 20).isActive = true
        cardLarge3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        cardLarge3.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true

        cardLarge4.topAnchor.constraint(equalTo: cardLarge3.bottomAnchor, constant: 20).isActive = true
        cardLarge4.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        cardLarge4.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        let collection = [
            CellVeiw.Model(title: "Title", description: "Description", image: .add),
            CellVeiw.Model(title: "Title", description: "Description", image: .remove),
            CellVeiw.Model(title: "Title", description: "Description", image: .checkmark),
            CellVeiw.Model(title: "Title", description: "Description", image: .actions)
        ]
        let model = CardWithList.Model(
            header: "Header",
            collection: collection,
            button: (
                name: "Button",
                action: {
                    print("Button work")
                }
            )
        )
        let card = CardWithList(model: model)
        view.addSubview(card)
        card.topMargin(20, cardLarge3)
        card.leadingMargin(20)
        card.trailingMargin(20)
    }
}
