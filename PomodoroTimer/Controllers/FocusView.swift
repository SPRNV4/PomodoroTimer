//
//  FocusView.swift
//  PomodoroTimer
//
//  Created by Maxim Samodurov on 03.03.2023.
//

import Foundation
import UIKit

class FocusView: UIView {
    
    lazy var chipImage = {
        let imageName = "сhip"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    
    let timeMinutesCounter = {
        let label = UILabel()
        label.text = "24"
        label.numberOfLines = 1
        label.attributedText = NSAttributedString(string: label.text!, attributes: [.kern: 1.1])
        label.clipsToBounds = true
        label.font = .robotoBlack(size: 211)
        label.textColor = UIColor(#colorLiteral(red: 0.3531352282, green: 0.1171852872, blue: 0.1062337533, alpha: 1))
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 2
        label.layer.shadowOpacity = 0.3
        label.layer.shadowOffset = CGSize(width: 3, height: 3)
        return label
    }()
    
    let timeSecondsCounter = {
        let label = UILabel()
        label.text = "59"
        label.clipsToBounds = true
        label.attributedText = NSAttributedString(string: label.text!, attributes: [.kern: 1.1])
        label.numberOfLines = 1
        label.font = .robotoBlack(size: 211)
        label.textColor = UIColor(#colorLiteral(red: 0.3531352282, green: 0.1171852872, blue: 0.1062337533, alpha: 1))
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 2
        label.layer.shadowOpacity = 0.3
        label.layer.shadowOffset = CGSize(width: 3, height: 3)
        return label
    }()
    
    let threeDotsButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.sizeToFit()
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor(#colorLiteral(red: 0.9975082278, green: 0.8373187184, blue: 0.8360101581, alpha: 1))
        
        // config for sf symbol image
        let config = UIImage.SymbolConfiguration(pointSize: 30)
        button.tintColor = UIColor(#colorLiteral(red: 0.3531352282, green: 0.1171852872, blue: 0.1062337533, alpha: 1))
        button.setImage(UIImage(systemName: "goforward", withConfiguration: config), for: .normal)
        return button
    }()
    
    let pausePlayButton = {
        let button = UIButton()
        button.sizeToFit()
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor(#colorLiteral(red: 1, green: 0.4812640548, blue: 0.4829893708, alpha: 1))
        
        // config for sf symbol image
        let config = UIImage.SymbolConfiguration(pointSize: 23)
        button.tintColor = UIColor(#colorLiteral(red: 0.3531352282, green: 0.1171852872, blue: 0.1062337533, alpha: 1))
        button.setImage(UIImage(systemName: "play.fill", withConfiguration: config), for: .normal)
//        button.setImage(UIImage(systemName: "pause.fill", withConfiguration: config), for: .normal)
        return button
    }()
    
    let nextSectionButton = {
        let button = UIButton()
        button.sizeToFit()
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor(#colorLiteral(red: 0.9975082278, green: 0.8373187184, blue: 0.8360101581, alpha: 1))
        
        // config for sf symbol image
        let config = UIImage.SymbolConfiguration(pointSize: 23)
        button.tintColor = UIColor(#colorLiteral(red: 0.3531352282, green: 0.1171852872, blue: 0.1062337533, alpha: 1))
        button.setImage(UIImage(systemName: "forward.fill", withConfiguration: config), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let counterStack = VerticalStackView(arrangedSubViews: [timeMinutesCounter,
                                                                timeSecondsCounter], spacing: -80)
        
        let lowStackView = UIStackView(arrangedSubviews: [
            threeDotsButton,
            pausePlayButton,
            nextSectionButton
        ])
        
        lowStackView.spacing = 10
        lowStackView.distribution = .fillEqually
        lowStackView.alignment = .center
        
        addSubview(counterStack)
        addSubview(lowStackView)
        addSubview(chipImage)
        
        counterStack.translatesAutoresizingMaskIntoConstraints = false
        lowStackView.translatesAutoresizingMaskIntoConstraints = false
        chipImage.translatesAutoresizingMaskIntoConstraints = false 
        
        NSLayoutConstraint.activate([
            chipImage.topAnchor.constraint(equalTo: topAnchor, constant: 130),
            chipImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 140),
            chipImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -140),
            
            counterStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            counterStack.topAnchor.constraint(equalTo: chipImage.bottomAnchor, constant: 0),
            
            lowStackView.topAnchor.constraint(equalTo: counterStack.bottomAnchor, constant: 0),
            lowStackView.heightAnchor.constraint(equalToConstant: 100),
            lowStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            lowStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            pausePlayButton.topAnchor.constraint(equalTo: lowStackView.topAnchor),
            pausePlayButton.bottomAnchor.constraint(equalTo: lowStackView.bottomAnchor),
            
            nextSectionButton.heightAnchor.constraint(equalToConstant: 80),
            threeDotsButton.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        backgroundColor = UIColor(#colorLiteral(red: 1, green: 0.9467936158, blue: 0.9479826093, alpha: 1))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


