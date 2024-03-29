//
//  ThirdView.swift
//  GitTestGame
//
//  Created by Yosha Kun on 04.06.2022.
//

import UIKit

protocol ThirdViewDelegate: AnyObject {
    func didTappedLessButton()
    func didTappedEqualButton()
    func didTappedMoreButton()
}

final class ThirdView: UIView {
    
    // MARK: - Public properties
    
    weak var delegate: ThirdViewDelegate?
    
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
        
        roundLabel.text = "ROUND №"
        roundLabel.textColor = .black
        roundLabel.font = .systemFont(ofSize: 50, weight: .bold)
        roundLabel.numberOfLines = 0
        roundLabel.translatesAutoresizingMaskIntoConstraints = false
        
        playerLabel.text = "CCOMPUTER GUESSES"
        playerLabel.textColor = .black
        playerLabel.font = .systemFont(ofSize: 25, weight: .bold)
        playerLabel.numberOfLines = 0
        playerLabel.translatesAutoresizingMaskIntoConstraints = false
        
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
        equalButton.addTarget(self, action: #selector(didTappedEqualButton), for: .touchUpInside)
        equalButton.translatesAutoresizingMaskIntoConstraints = false
        
        moreButton.setTitle(">", for: .normal)
        moreButton.clipsToBounds = true
        moreButton.layer.cornerRadius = 10
        moreButton.backgroundColor = .black
        moreButton.setTitleColor(.white, for: .normal)
        moreButton.setTitleColor(.systemBlue, for: .highlighted)
        moreButton.addTarget(self, action: #selector(didTappedMoreButton), for: .touchUpInside)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func didTappedLessButton() {
        delegate?.didTappedLessButton()
    }
    
    @objc private func didTappedEqualButton() {
        delegate?.didTappedEqualButton()
    }
    
    @objc private func didTappedMoreButton() {
        delegate?.didTappedMoreButton()
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
            
            guessNumberLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 50),
            guessNumberLabel.centerXAnchor.constraint(equalTo: roundLabel.centerXAnchor, constant: 0),
            
            equalButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -70),
            equalButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 0),
            equalButton.widthAnchor.constraint(equalToConstant: 50),
            equalButton.heightAnchor.constraint(equalToConstant: 50),
            
            lessButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -70),
            lessButton.trailingAnchor.constraint(equalTo: equalButton.leadingAnchor, constant: -25),
            lessButton.widthAnchor.constraint(equalToConstant: 50),
            lessButton.heightAnchor.constraint(equalToConstant: 50),
            
            moreButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -70),
            moreButton.leadingAnchor.constraint(equalTo: equalButton.trailingAnchor, constant: 25),
            moreButton.widthAnchor.constraint(equalToConstant: 50),
            moreButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ThirdView {    
    func set(value: Int) {
        guessNumberLabel.text = "THE NUMBER IS: \(value)?"
    }
}
