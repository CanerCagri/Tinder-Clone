//
//  HomeTopStackView.swift
//  Tinder-Clone
//
//  Created by Caner Çağrı on 14.04.2023.
//

import UIKit

class HomeTopStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let topSubviews = [UIImage(named: "top_left_profile"), UIImage(named: "app_icon"), UIImage(named: "top_right_messages")].map { image in
            let button = UIButton(type: .system)
            button.setImage(image!.withRenderingMode(.alwaysOriginal), for: .normal)
            return button
        }
        
        topSubviews.forEach { view in
            addArrangedSubview(view)
        }
        
        distribution = .fillEqually
        heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
