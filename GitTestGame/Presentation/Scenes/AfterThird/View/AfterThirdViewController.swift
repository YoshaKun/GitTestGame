//
//  AfterThirdViewController.swift
//  GitTestGame
//
//  Created by Yosha Kun on 20.06.2022.
//

import UIKit
import Combine

class AfterThirdViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let viewModel: AfterThirdViewModel
    private let secondView: AfterThirdView = .init()
    private var cancellableSet: Set<AnyCancellable> = []
    
    // MARK: - Initialization
    
    init(viewModel: AfterThirdViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        configureBindings()
    }
    
    private func configureBindings() {
        viewModel.compareResult
            .sink { [weak self] result in
                self?.secondView.set(compareResult: result)
            }
            .store(in: &cancellableSet)
        
        viewModel.gameEnded
            .sink { [weak self] result in
                let finalView = FinalAssembley()
                
                self?.navigationController?.pushViewController(finalView.viewController, animated: true)
            }
            .store(in: &cancellableSet)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle methods
    
    override func loadView() {
        super.loadView()
        
        secondView.delegate = self
        
        view = secondView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.startGame()
    }
}

// MARK: - SecondViewDelegate

extension AfterThirdViewController: AfterThirdViewDelegate {
    func didTapNewCheckButton(with value: Int) {
        viewModel.compare(value: value)
    }
}
