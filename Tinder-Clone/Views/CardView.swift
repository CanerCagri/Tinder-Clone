//
//  CardView.swift
//  Tinder-Clone
//
//  Created by Caner Çağrı on 17.04.2023.
//

import UIKit

class CardView: UIView {
    
    let imageView = UIImageView(image: UIImage(named: "lady5c"))
    let infoLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 10
        clipsToBounds = true
        
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.fillSuperview()
        
        addSubview(infoLabel)
        infoLabel.anchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
        infoLabel.textColor = .white
        infoLabel.font = UIFont.systemFont(ofSize: 34, weight: .heavy)
        infoLabel.numberOfLines = 0
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            handleChanged(gesture)
        case .ended:
            handleEnded(gesture)
        default:
            ()
        }
    }
    
    fileprivate func handleChanged(_ gesture: UIPanGestureRecognizer) {
        let transform = gesture.translation(in: nil)
        let degress: CGFloat = transform.x / 20
        let angle = degress * .pi / 180
        
        let rotationalTransform = CGAffineTransform(rotationAngle: angle)
        self.transform = rotationalTransform.translatedBy(x: transform.x, y: transform.y)
    }
    
    fileprivate func handleEnded(_ gesture: UIPanGestureRecognizer) {
        
        let shouldDismissCard = gesture.translation(in: nil).x > 100  || gesture.translation(in: nil).x < -100
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut) {
            
            if shouldDismissCard {
                if gesture.translation(in: nil).x > 100 {
                    let offScreenTransform = self.transform.translatedBy(x: 600, y: 0)
                    self.transform = offScreenTransform
                } else if gesture.translation(in: nil).x < -100 {
                    let offScreenTransform = self.transform.translatedBy(x: -600, y: 0)
                    self.transform = offScreenTransform
                }
                
            } else {
                self.transform = .identity
            }
            
        } completion: { _ in
            
            self.transform = .identity
            
            if shouldDismissCard {
                self.removeFromSuperview()
            }
            
        }
    }
}
