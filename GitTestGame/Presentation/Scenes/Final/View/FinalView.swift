//
//  FinalView.swift
//  GitTestGame
//
//  Created by Yosha Kun on 20.06.2022.
//

import UIKit

protocol FinalViewDelegate: AnyObject {
    func didTappedReturnButton()
}

final class FinalView: UIView {
    
    // MARK: - Public pproperties
    
    // MARK: - View properties
    
    private let gameLabel = UILabel()
    private let scoreLabel = UILabel()
    private let returnButton = UIButton()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureLayouts()
    }
    
    private func configureViews() {
        backgroundColor = .white
        
        gameLabel.text = "CONGRATULATIONS"
        gameLabel.textColor = .black
        gameLabel.font = .systemFont(ofSize: 50, weight: .bold)
        gameLabel.numberOfLines = 0
        gameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        scoreLabel.text = "YOU WIN!"
        scoreLabel.textColor = .black
        scoreLabel.font = .systemFont(ofSize: 50, weight: .bold)
        scoreLabel.numberOfLines = 0
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        returnButton.setTitle("RETERY GAME", for: .normal)
        returnButton.setTitleColor(.white, for: .normal)
        returnButton.setTitleColor(.systemBlue, for: .highlighted)
        returnButton.clipsToBounds = true
        returnButton.layer.cornerRadius = 10
        returnButton.backgroundColor = .black
        returnButton.addTarget(self, action: #selector(didTappedReturnButton), for: .touchUpInside)
        returnButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func didTappedReturnButton() {
        delegate?didTappedReturnButton()
    }
    
    private func configureLayouts() {
        addSubview(gameLabel)
        addSubview(scoreLabel)
        addSubview(returnButton)
        
        NSLayoutConstraint.activate([
            gameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
            gameLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            scoreLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            scoreLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            
            returnButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -70),
            returnButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//extension FinalView {
//    func set(value: String) {
//        scoreLabel.text = "\(value)"
//    }
//}
