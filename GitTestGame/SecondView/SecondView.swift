//
//  SecondView.swift
//  GitTestGame
//
//  Created by Yosha Kun on 28.05.2022.
//

import UIKit

final class SecondView: UIView {
    
    private let roundLabel = UILabel()
    private let playerLabel = UILabel()
    private let enterTextField = UITextField()
    
//    MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
        configureLabel()
        configureTextField()
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
    }
    
    private func configureTextField() {
        enterTextField.placeholder = "Enter the Number"
        enterTextField.textColor = .black
        enterTextField.backgroundColor = .lightGray
        enterTextField.translatesAutoresizingMaskIntoConstraints = false
        enterTextField.layer.cornerRadius = 10
        enterTextField.clipsToBounds = true
        
        addSubview(enterTextField)
        NSLayoutConstraint.activate([
            enterTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            enterTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            enterTextField.widthAnchor.constraint(equalToConstant: 200),
            enterTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
