//
//  ViewController.swift
//  Tinder-Clone
//
//  Created by Caner Çağrı on 14.04.2023.
//

import UIKit

class HomeController: UIViewController {
    
    let topStackView = HomeTopStackView()
    let cardsView = UIView()
    let bottomStackView = HomeBottomStackView()
    
    let users = [
        User(name: "Özlem", age: 26, job: "DJ", imageName: "lady5c"),
        User(name: "Seda", age: 25, job: "Photographer", imageName: "lady4c")
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupLayout()
        setupCards()
    }
    
    fileprivate func setupCards() {
        
        users.forEach { user in
            let cardView = CardView()
            cardView.imageView.image = UIImage(named: user.imageName)
            cardView.infoLabel.text = "\(user.name) \(user.age)\n\(user.job)"
            
            let attiributedText = NSMutableAttributedString(string: user.name, attributes: [.font: UIFont.systemFont(ofSize: 34, weight: .heavy)])
            
            attiributedText.append(NSAttributedString(string: "  \(user.age)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .regular)]))
            
            attiributedText.append(NSAttributedString(string: "\n\(user.job)", attributes: [.font: UIFont.systemFont(ofSize: 21, weight: .regular)]))
            
            cardView.infoLabel.attributedText = attiributedText
            
            cardsView.addSubview(cardView)
            cardView.fillSuperview()
        }
    }
    
    fileprivate func setupLayout() {
        let mainStackView = UIStackView(arrangedSubviews: [topStackView, cardsView, bottomStackView])
        mainStackView.axis = .vertical
        view.addSubview(mainStackView)
        
        mainStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.layoutMargins = .init(top: 0, left: 12, bottom: 0, right: 12)
        
        mainStackView.bringSubviewToFront(cardsView)
    }
}
