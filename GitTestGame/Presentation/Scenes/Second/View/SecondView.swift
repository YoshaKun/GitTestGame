//
//  SecondView.swift
//  GitTestGame
//
//  Created by Yosha Kun on 28.05.2022.
//

import UIKit

final class SecondView: UIView {
    
    // MARK: - View properties
    
    private let roundLabel = UILabel()
    private let playerLabel = UILabel()
    private let checkGuess = UILabel()
    private let enterTextField = UITextField()
    
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
        
        playerLabel.text = "You guesses"
        playerLabel.textColor = .black
        playerLabel.font = .systemFont(ofSize: 25, weight: .bold)
        playerLabel.numberOfLines = 0
        playerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        checkGuess.text = "< >"
        checkGuess.textColor = .black
        checkGuess.font = .systemFont(ofSize: 37, weight: .bold)
        checkGuess.translatesAutoresizingMaskIntoConstraints = false
        
        enterTextField.placeholder = "Enter the Number"
        enterTextField.textAlignment = .center
        enterTextField.textColor = .black
        enterTextField.backgroundColor = .systemGray5
        enterTextField.layer.cornerRadius = 10
        enterTextField.clipsToBounds = true
        enterTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayouts() {
        addSubview(roundLabel)
        addSubview(playerLabel)
        addSubview(checkGuess)
        addSubview(enterTextField)
        
        NSLayoutConstraint.activate([
            roundLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
            roundLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            playerLabel.topAnchor.constraint(equalTo: roundLabel.bottomAnchor, constant: 50),
            playerLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            checkGuess.topAnchor.constraint(equalTo: playerLabel.bottomAnchor, constant: 75),
            checkGuess.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            enterTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            enterTextField.topAnchor.constraint(equalTo: checkGuess.bottomAnchor, constant: 75),
            enterTextField.widthAnchor.constraint(equalToConstant: 250),
            enterTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
