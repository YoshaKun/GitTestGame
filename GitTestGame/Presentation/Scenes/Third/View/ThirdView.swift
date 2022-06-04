//
//  ThirdView.swift
//  GitTestGame
//
//  Created by Yosha Kun on 04.06.2022.
//

import UIKit

final class ThirdView: UIView {
    // MARK: - View properties
    
    private let roundLabel = UILabel()
    private let playerLabel = UILabel()
    private let guessNumberLabel = UILabel()
    private let lessButton = UIButton()
    private let equalButton = UIButton()
    private let moreButton = UIButton()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
    }
    
    private func configureViews() {
        backgroundColor = .white
        
        roundLabel.text = "Round №"
        roundLabel.textColor = .black
        roundLabel.font = .systemFont(ofSize: 50, weight: .bold)
        roundLabel.numberOfLines = 0
        roundLabel.translatesAutoresizingMaskIntoConstraints = false
        
        playerLabel.text = "Computer guesses"
        playerLabel.textColor = .black
        playerLabel.font = .systemFont(ofSize: 25, weight: .bold)
        playerLabel.numberOfLines = 0
        playerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guessNumberLabel.text = "number is: value"
        guessNumberLabel.textColor = .black
        guessNumberLabel.font = .systemFont(ofSize: 25, weight: .bold)
        guessNumberLabel.numberOfLines = 0
        guessNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        lessButton.setTitle("<", for: .normal)
        lessButton.clipsToBounds = true
        lessButton.layer.cornerRadius = 10
        lessButton.backgroundColor = .black
        lessButton.setTitleColor(.white, for: .normal)
        lessButton.setTitleColor(.systemBlue, for: .highlighted)
        lessButton.addTarget(self, action: #selector(didTappedLessButton), for: .touchUpInside)
        lessButton.translatesAutoresizingMaskIntoConstraints = false
        
        equalButton.setTitle("=", for: .normal)
        equalButton.clipsToBounds = true
        equalButton.layer.cornerRadius = 10
        equalButton.backgroundColor = .black
        equalButton.setTitleColor(.white, for: .normal)
        equalButton.setTitleColor(.systemBlue, for: .highlighted)
        equalButton.addTarget(self, action: #selector(didTappedLessButton), for: .touchUpInside)
        equalButton.translatesAutoresizingMaskIntoConstraints = false
        
        moreButton.setTitle(">", for: .normal)
        moreButton.clipsToBounds = true
        moreButton.layer.cornerRadius = 10
        moreButton.backgroundColor = .black
        moreButton.setTitleColor(.white, for: .normal)
        moreButton.setTitleColor(.systemBlue, for: .highlighted)
        moreButton.addTarget(self, action: #selector(didTappedLessButton), for: .touchUpInside)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func didTappedLessButton() {
        print("<")
    }
    
    @objc private func didTappedEqualButton() {
        print("=")
    }
    
    @objc private func didTappedMoreButton() {
        print(">")
    }
    
    // MARK: - Constraints
    
    private func configureLayouts() {
        addSubview(roundLabel)
        addSubview(playerLabel)
        addSubview(guessNumberLabel)
        addSubview(lessButton)
        addSubview(equalButton)
        addSubview(moreButton)
        
        NSLayoutConstraint.activate([
            roundLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
            roundLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            playerLabel.topAnchor.constraint(equalTo: roundLabel.bottomAnchor, constant: 50),
            playerLabel.centerXAnchor.constraint(equalTo: roundLabel.centerXAnchor, constant: 0),
            
            guessNumberLabel.topAnchor.constraint(equalTo: playerLabel.bottomAnchor, constant: 25),
            guessNumberLabel.centerXAnchor.constraint(equalTo: roundLabel.centerXAnchor, constant: 0),
            
            equalButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            equalButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 0),
            equalButton.widthAnchor.constraint(equalToConstant: 50),
            equalButton.heightAnchor.constraint(equalToConstant: 50),
            
            lessButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            lessButton.trailingAnchor.constraint(equalTo: equalButton.leadingAnchor, constant: -25),
            lessButton.widthAnchor.constraint(equalToConstant: 50),
            lessButton.heightAnchor.constraint(equalToConstant: 50),
            
            moreButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            moreButton.leadingAnchor.constraint(equalTo: equalButton.trailingAnchor, constant: 25),
            moreButton.widthAnchor.constraint(equalToConstant: 50),
            moreButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
