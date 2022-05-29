//
//  StartView.swift
//  GitTestGame
//
//  Created by Yosha Kun on 28.05.2022.
//

import UIKit

protocol StartViewDelegate: AnyObject {
    func didTappedStartButton()
}

final class StartView: UIView {
    
    // MARK: - Public properties
    
    weak var delegate: StartViewDelegate?
    
    // MARK: - Views properties
    
    private let gameLabel = UILabel()
    private let startButton = UIButton()
    
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
        gameLabel.translatesAutoresizingMaskIntoConstraints = false
        gameLabel.numberOfLines = 0
        
        startButton.setTitle("Start a New Game!", for: .normal)
        startButton.clipsToBounds = true
        startButton.layer.cornerRadius = 10
        startButton.backgroundColor = .black
        startButton.setTitleColor(.white, for: .normal)
        startButton.setTitleColor(.systemBlue, for: .highlighted)
        startButton.addTarget(self, action: #selector(didTappedStartButton), for: .touchUpInside)
        startButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func didTappedStartButton() {
        delegate?.didTappedStartButton()
    }
    
    private func configureLayouts() {
        addSubview(gameLabel)
        addSubview(startButton)
        
        NSLayoutConstraint.activate([
            gameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
            gameLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            startButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70),
            startButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            startButton.widthAnchor.constraint(equalToConstant: 200),
            startButton.heightAnchor.constraint(equalToConstant: 50)
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
