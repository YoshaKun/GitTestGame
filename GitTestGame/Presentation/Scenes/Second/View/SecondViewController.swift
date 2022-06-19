//
//  SecondViewController.swift
//  GitTestGame
//
//  Created by Yosha Kun on 28.05.2022.
//

import UIKit
import Combine

class SecondViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let viewModel: SecondViewModel
    private let secondView: SecondView = .init()
    private var cancellableSet: Set<AnyCancellable> = []
    
    // MARK: - Initialization
    
    init(viewModel: SecondViewModel) {
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
                print("END")
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

extension SecondViewController: SecondViewDelegate {
    func didTapCheckButton(with value: Int) {
        viewModel.compare(value: value)
    }
}
