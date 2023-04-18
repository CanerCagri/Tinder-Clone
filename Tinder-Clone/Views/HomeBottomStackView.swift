//
//  HomeBottomStackView.swift
//  Tinder-Clone
//
//  Created by Caner Çağrı on 14.04.2023.
//

import UIKit

class HomeBottomStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let bottomSubviews = [UIImage(named: "refresh_circle"), UIImage(named: "dismiss_circle"), UIImage(named: "super_like_circle"), UIImage(named: "like_circle"), UIImage(named: "boost_circle")].map { image in
            let button = UIButton(type: .system)
            button.setImage(image!.withRenderingMode(.alwaysOriginal), for: .normal)
            return button
        }
        
        bottomSubviews.forEach { view in
            addArrangedSubview(view)
        }
        
        distribution = .fillEqually
        heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
