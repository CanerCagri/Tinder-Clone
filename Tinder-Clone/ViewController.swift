//
//  ViewController.swift
//  Tinder-Clone
//
//  Created by Caner Çağrı on 14.04.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let subViews = [UIColor.gray, UIColor.darkGray, UIColor.black].map { color in
            let v = UIView()
            v.backgroundColor = color
            return v
        }
        
        let topStackView = UIStackView(arrangedSubviews: subViews)
        topStackView.distribution = .fillEqually
        topStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow
        yellowView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [topStackView, blueView, yellowView])
        stackView.axis = .vertical
//        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.frame = view.bounds
        
        stackView.fillSuperview()
    }
}
