//
//  StartView.swift
//  GitTestGame
//
//  Created by Yosha Kun on 28.05.2022.
//

import UIKit

protocol StartViewDelegate: AnyObject {
    func didTappedComputerGuessButton()
    func didTappedYouGuessButton()
}

final class StartView: UIView {
    
    // MARK: - Public properties
    
    weak var delegate: StartViewDelegate?
    
    // MARK: - Views properties
    
    private let gameLabel = UILabel()
    private let startButton = UIButton()
    private let computerGuessButton = UIButton()
    private let youGuessButton = UIButton()
    
    //MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
    }
    
    private func configureViews() {
        backgroundColor = .white
        
        gameLabel.text = "Guess Game"
        gameLabel.textColor = .black
        gameLabel.font = .systemFont(ofSize: 50, weight: .bold)
        gameLabel.numberOfLines = 0
        gameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        startButton.setTitle("Start a New Game!", for: .normal)
        startButton.clipsToBounds = true
        startButton.layer.cornerRadius = 10
        startButton.backgroundColor = .black
        startButton.setTitleColor(.white, for: .normal)
        startButton.setTitleColor(.systemBlue, for: .highlighted)
        startButton.addTarget(self, action: #selector(didTappedStartButton), for: .touchUpInside)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.isHidden = false
        
        computerGuessButton.setTitle("Computer Gesses", for: .normal)
        computerGuessButton.clipsToBounds = true
        computerGuessButton.layer.cornerRadius = 10
        computerGuessButton.backgroundColor = .black
        computerGuessButton.setTitleColor(.white, for: .normal)
        computerGuessButton.setTitleColor(.systemBlue, for: .highlighted)
        computerGuessButton.addTarget(self, action: #selector(didTappedComputerGuessButton), for: .touchUpInside)
        computerGuessButton.translatesAutoresizingMaskIntoConstraints = false
        computerGuessButton.isHidden = true
        
        youGuessButton.setTitle("You Guesses", for: .normal)
        youGuessButton.clipsToBounds = true
        youGuessButton.layer.cornerRadius = 10
        youGuessButton.backgroundColor = .black
        youGuessButton.setTitleColor(.white, for: .normal)
        youGuessButton.setTitleColor(.systemBlue, for: .highlighted)
        youGuessButton.addTarget(self, action: #selector(didTappedYouGuessButton), for: .touchUpInside)
        youGuessButton.translatesAutoresizingMaskIntoConstraints = false
        youGuessButton.isHidden = true
    }
    
    @objc private func didTappedStartButton() {
        startButton.isHidden = true
        computerGuessButton.isHidden = false
        youGuessButton.isHidden = false
    }
    
    @objc private func didTappedComputerGuessButton() {
        delegate?.didTappedComputerGuessButton()
    }
    
    @objc private func didTappedYouGuessButton() {
        delegate?.didTappedYouGuessButton()
    }
    
    private func configureLayouts() {
        addSubview(gameLabel)
        addSubview(startButton)
        addSubview(computerGuessButton)
        addSubview(youGuessButton)
        
        NSLayoutConstraint.activate([
            gameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
            gameLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            startButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70),
            startButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            startButton.widthAnchor.constraint(equalToConstant: 200),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            
            computerGuessButton.topAnchor.constraint(equalTo: gameLabel.bottomAnchor, constant: 35),
            computerGuessButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            computerGuessButton.widthAnchor.constraint(equalToConstant: 200),
            computerGuessButton.heightAnchor.constraint(equalToConstant: 50),
            
            youGuessButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70),
            youGuessButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            youGuessButton.widthAnchor.constraint(equalToConstant: 200),
            youGuessButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StartView {
    func set(value: Int) {
        gameLabel.text = "computer guess: \(value)"
    }
}
