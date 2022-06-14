//
//  ThirdViewController.swift
//  GitTestGame
//
//  Created by Yosha Kun on 04.06.2022.
//

import UIKit
import Combine

class ThirdViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let viewModel: ThirdViewModel
    private let thirdView: ThirdView = .init()
    private var cancellableSet: Set<AnyCancellable> = []
    
    // MARK: - Initialization
    
    init(viewModel: ThirdViewModel) {
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
        
        viewModel.gameEnded
            .sink { [weak self] result in
                #warning("4 screen")
                let startAssembly = StartAssembly()
                
                self?.navigationController?.pushViewController(startAssembly.viewController, animated: true)
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

extension ThirdViewController: ThirdViewDelegate {
    func didTappedLessButton() {
        viewModel.wrongLess()
    }
    
    func didTappedEqualButton() {
        viewModel.equal()
    }
    
    func didTappedMoreButton() {
        viewModel.wrongMore()
    }
}
