//
//  AfterThirdView.swift
//  GitTestGame
//
//  Created by Yosha Kun on 20.06.2022.
//

import UIKit

protocol AfterThirdViewDelegate: AnyObject {
    func didTapNewCheckButton(with value: Int)
}

final class AfterThirdView: UIView {
   
    // MARK: - Public properties
    
    weak var delegate: AfterThirdViewDelegate?
    
    // MARK: - View properties
    
    private let roundLabel = UILabel()
    private let playerLabel = UILabel()
    private let checkGuessLabel = UILabel()
    private let enterTextField = UITextField()
    private let checkButton = UIButton()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureEndEditing()
        configureViews()
        configureLayouts()
    }
    
    private func configureEndEditing() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapOnView))
        tapGestureRecognizer.cancelsTouchesInView = false
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func didTapOnView() {
        endEditing(true)
    }
    
    private func configureViews() {
        backgroundColor = .white
        
        roundLabel.text = "ROUND №"
        roundLabel.textColor = .black
        roundLabel.font = .systemFont(ofSize: 50, weight: .bold)
        roundLabel.numberOfLines = 0
        roundLabel.translatesAutoresizingMaskIntoConstraints = false
        
        playerLabel.text = "YOU GUESSES"
        playerLabel.textColor = .black
        playerLabel.font = .systemFont(ofSize: 25, weight: .bold)
        playerLabel.numberOfLines = 0
        playerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        checkGuessLabel.text = "< >"
        checkGuessLabel.textColor = .black
        checkGuessLabel.font = .systemFont(ofSize: 37, weight: .bold)
        checkGuessLabel.translatesAutoresizingMaskIntoConstraints = false
        
        enterTextField.placeholder = "Enter the Number"
        enterTextField.textAlignment = .center
        enterTextField.textColor = .black
        enterTextField.backgroundColor = .systemGray5
        enterTextField.layer.cornerRadius = 10
        enterTextField.clipsToBounds = true
        enterTextField.keyboardType = .numberPad
        enterTextField.translatesAutoresizingMaskIntoConstraints = false
        
        checkButton.setTitle("Check!", for: .normal)
        checkButton.backgroundColor = .black
        checkButton.setTitleColor(.white, for: .normal)
        checkButton.setTitleColor(.systemBlue, for: .highlighted)
        checkButton.layer.cornerRadius = 10
        checkButton.clipsToBounds = true
        checkButton.addTarget(self, action: #selector(didTapNewCheckButton), for: .touchUpInside)
        checkButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func didTapNewCheckButton() {
        guard
            let stringValue = enterTextField.text,
            let value = Int(stringValue)
        else { return }
        
        delegate?.didTapNewCheckButton(with: value)
    }
    
    private func configureLayouts() {
        addSubview(roundLabel)
        addSubview(playerLabel)
        addSubview(checkGuessLabel)
        addSubview(enterTextField)
        addSubview(checkButton)
        
        NSLayoutConstraint.activate([
            roundLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
            roundLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            playerLabel.topAnchor.constraint(equalTo: roundLabel.bottomAnchor, constant: 50),
            playerLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            checkGuessLabel.topAnchor.constraint(equalTo: playerLabel.bottomAnchor, constant: 75),
            checkGuessLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            enterTextField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            enterTextField.topAnchor.constraint(equalTo: checkGuessLabel.bottomAnchor, constant: 75),
            enterTextField.widthAnchor.constraint(equalToConstant: 250),
            enterTextField.heightAnchor.constraint(equalToConstant: 50),
            
            checkButton.topAnchor.constraint(equalTo: enterTextField.bottomAnchor, constant: 75),
            checkButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            checkButton.widthAnchor.constraint(equalToConstant: 150),
            checkButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AfterThirdView {
    func set(compareResult: String) {
        checkGuessLabel.text = compareResult
    }
}
