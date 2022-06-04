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
        
        playerLabel.text = "Computer guesses"
        playerLabel.textColor = .black
        playerLabel.font = .systemFont(ofSize: 25, weight: .bold)
        playerLabel.numberOfLines = 0
        playerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        enterTextField.placeholder = "Enter the Number"
        enterTextField.textColor = .black
        enterTextField.backgroundColor = .lightGray
        enterTextField.layer.cornerRadius = 10
        enterTextField.clipsToBounds = true
        enterTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayouts() {
        addSubview(roundLabel)
        addSubview(playerLabel)
        addSubview(enterTextField)
        
        NSLayoutConstraint.activate([
            roundLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
            roundLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            playerLabel.topAnchor.constraint(equalTo: roundLabel.bottomAnchor, constant: 50),
            playerLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            enterTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            enterTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            enterTextField.widthAnchor.constraint(equalToConstant: 200),
            enterTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
