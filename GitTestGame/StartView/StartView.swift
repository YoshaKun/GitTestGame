//
//  StartView.swift
//  GitTestGame
//
//  Created by Yosha Kun on 28.05.2022.
//

import UIKit

final class StartView: UIView {
    
    private let gameLabel = UILabel()
    private let startButton = UIButton()
    
    //MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
        configureLabel()
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configuration
    
    private func configureView() {
        backgroundColor = .white
    }
    
    private func configureLabel() {
        gameLabel.text = "Guess Game"
        gameLabel.textColor = .black
        gameLabel.font = .systemFont(ofSize: 50, weight: .bold)
        gameLabel.translatesAutoresizingMaskIntoConstraints = false
        gameLabel.numberOfLines = 0
        
        addSubview(gameLabel)
        NSLayoutConstraint.activate([
            gameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
            gameLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0)
        ])
    }
    
    private func configureButton() {
        startButton.setTitle("Start a New Game!", for: .normal)
        startButton.clipsToBounds = true
        startButton.layer.cornerRadius = 10
        startButton.backgroundColor = .black
        startButton.setTitleColor(.white, for: .normal)
        startButton.setTitleColor(.systemBlue, for: .highlighted)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70),
            startButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            startButton.widthAnchor.constraint(equalToConstant: 200),
            startButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        startButton.addTarget(self, action: #selector(didTappedStartButton), for: .touchUpInside)
    }
    
//    MARK: - didTappedStartButton
    
    @objc private func didTappedStartButton() {
        let secondView = SecondViewController()
        secondView.navigationController?.pushViewController(secondView, animated: true)
//        print("Start button tapped")
    }
    
}
	
