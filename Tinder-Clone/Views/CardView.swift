//
//  CardView.swift
//  Tinder-Clone
//
//  Created by Caner Çağrı on 17.04.2023.
//

import UIKit

class CardView: UIView {
    
    private let imageView = UIImageView(image: UIImage(named: "lady5c"))

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 10
        clipsToBounds = true
 
        addSubview(imageView)
        imageView.fillSuperview()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            let transform = gesture.translation(in: nil)
            self.transform = CGAffineTransform(translationX: transform.x, y: transform.y)
        case .ended:
            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut) {
                self.transform = .identity
            }
        default:
            ()
        }
    }
}
