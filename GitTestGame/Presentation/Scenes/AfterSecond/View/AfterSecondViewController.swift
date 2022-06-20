//
//  AfterSecondViewController.swift
//  GitTestGame
//
//  Created by Yosha Kun on 20.06.2022.
//

import UIKit
import Combine

class AfterSecondViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let viewModel: AfterSecondViewModel
    private let thirdView: AfterSecondView = .init()
    private var cancellableSet: Set<AnyCancellable> = []
    
    // MARK: - Initialization
    
    init(viewModel: AfterSecondViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        configureBindings()
    }
    
    private func configureBindings() {
        viewModel.computerGuessValue
            .sink { [weak self] result in
                self?.thirdView.set(value: result)
            }
            .store(in: &cancellableSet)
#warning("create finalscreen")
        viewModel.gameEnded
            .sink { [weak self] result in
                let startScreen = StartAssembly()
                
                self?.navigationController?.pushViewController(startScreen.viewController, animated: true)
            }
            .store(in: &cancellableSet)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle methods
    
    override func loadView() {
        super.loadView()
        
        thirdView.delegate = self
        
        view = thirdView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.startGame()
    }
}

// MARK: - ThirdViewDelegate

extension AfterSecondViewController: AfterSecondViewDelegate {
    func didTappedNewLessButton() {
        viewModel.wrongLess()
    }
    
    func didTappedNewEqualButton() {
        viewModel.equal()
    }
    
    func didTappedNewMoreButton() {
        viewModel.wrongMore()
    }
}
