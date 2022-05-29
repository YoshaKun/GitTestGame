//
//  ThirdView.swift
//  GitTestGame
//
//  Created by Yosha Kun on 29.05.2022.
//

import UIKit

final class ThirdView: UIView {
    
    private let roundLabel = UILabel()
    private let playerLabel = UILabel()
    private let guessNumberLabel = UILabel()
    private let buttonMore = UIButton()
    private let buttonEqual = UIButton()
    private let buttonLess = UIButton()
    
//    MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
        configureLabel()
        configureButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Configuration
    
    private func configureView() {
        backgroundColor = .white
    }
    
    private func configureLabel() {
        roundLabel.text = "Round №"
        roundLabel.textColor = .black
        roundLabel.font = .systemFont(ofSize: 50, weight: .bold)
        roundLabel.translatesAutoresizingMaskIntoConstraints = false
        roundLabel.numberOfLines = 0
        
        addSubview(roundLabel)
        NSLayoutConstraint.activate([
            roundLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
            roundLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0)
        ])
        
        playerLabel.text = "Computer guesess"
        playerLabel.textColor = .black
        playerLabel.font = .systemFont(ofSize: 25, weight: .bold)
        playerLabel.translatesAutoresizingMaskIntoConstraints = false
        playerLabel.numberOfLines = 0
        
        addSubview(playerLabel)
        NSLayoutConstraint.activate([
            playerLabel.topAnchor.constraint(equalTo: roundLabel.bottomAnchor, constant: 50),
            playerLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0)
        ])
        
        guessNumberLabel.text = "Number is - 123 ?"
        guessNumberLabel.textColor = .black
        guessNumberLabel.font = .systemFont(ofSize: 25, weight: .bold)
        guessNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        guessNumberLabel.numberOfLines = 0
        
        addSubview(guessNumberLabel)
        NSLayoutConstraint.activate([
            guessNumberLabel.topAnchor.constraint(equalTo: playerLabel.bottomAnchor, constant: 50),
            guessNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0)
        ])
    }
    
    private func configureButtons() {
        buttonEqual.setTitle("=", for: .normal)
        buttonEqual.clipsToBounds = true
        buttonEqual.layer.cornerRadius = 10
        buttonEqual.backgroundColor = .black
        buttonEqual.setTitleColor(.white, for: .normal)
        buttonEqual.setTitleColor(.systemBlue, for: .highlighted)
        buttonEqual.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(buttonEqual)
        NSLayoutConstraint.activate([
            buttonEqual.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70),
            buttonEqual.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            buttonEqual.widthAnchor.constraint(equalToConstant: 70),
            buttonEqual.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        buttonMore.setTitle(">", for: .normal)
        buttonMore.clipsToBounds = true
        buttonMore.layer.cornerRadius = 10
        buttonMore.backgroundColor = .black
        buttonMore.setTitleColor(.white, for: .normal)
        buttonMore.setTitleColor(.systemBlue, for: .highlighted)
        buttonMore.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(buttonMore)
        NSLayoutConstraint.activate([
            buttonMore.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70),
            buttonMore.trailingAnchor.constraint(equalTo: buttonEqual.leadingAnchor, constant: -20),
            buttonMore.widthAnchor.constraint(equalToConstant: 70),
            buttonMore.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        buttonLess.setTitle("<", for: .normal)
        buttonLess.clipsToBounds = true
        buttonLess.layer.cornerRadius = 10
        buttonLess.backgroundColor = .black
        buttonLess.setTitleColor(.white, for: .normal)
        buttonLess.setTitleColor(.systemBlue, for: .highlighted)
        buttonLess.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(buttonLess)
        NSLayoutConstraint.activate([
            buttonLess.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70),
            buttonLess.leadingAnchor.constraint(equalTo: buttonEqual.trailingAnchor, constant: -20),
            buttonLess.widthAnchor.constraint(equalToConstant: 70),
            buttonLess.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
