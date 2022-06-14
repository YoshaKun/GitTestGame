//
//  ViewController.swift
//  GitTestGame
//
//  Created by Yosha Kun on 28.05.2022.
//

import UIKit
import Combine

class StartViewController: UIViewController {

    // MARK: - Private properties
    
    private let viewModel: StartViewModel
    private let startView: StartView = .init()
    private var cancellableSet: Set<AnyCancellable> = []
    
    // MARK: - Initialization
    
    init(viewModel: StartViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        configureBindings()
    }
    
    private func configureBindings() {
        viewModel.computerGuessValue
            .sink { [weak self] result in
                self?.startView.set(value: result)
            }
            .store(in: &cancellableSet)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle methods
    
    override func loadView() {
        super.loadView()
        
        startView.delegate = self
        
        view = startView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.startGame()
    }
}

// MARK: - StartViewDelegate

extension StartViewController: StartViewDelegate {
    func didTappedYouGuessButton() {
        let secondViewController = SecondAssembley().viewController
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    func didTappedComputerGuessButton() {
        let thirdViewController = ThirdAssembley().viewController
        navigationController?.pushViewController(thirdViewController, animated: true)
    }
}
