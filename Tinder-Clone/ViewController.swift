//
//  ViewController.swift
//  Tinder-Clone
//
//  Created by Caner Çağrı on 14.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let topStackView = HomeTopStackView()
    let cardsView = UIView()
    let bottomStackView = HomeBottomStackView()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupLayout()
        setupCards()
    }
    
    fileprivate func setupCards() {
        let cardView = CardView()
        cardsView.addSubview(cardView)
        cardView.fillSuperview()
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
