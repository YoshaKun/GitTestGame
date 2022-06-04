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
            .sink{ [weak self] result in
                self?.thirdView.set(value: result)
            }
            .store(in: &cancellableSet)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle methods
    
    override func loadView() {
        super.loadView()
        
        view = thirdView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
