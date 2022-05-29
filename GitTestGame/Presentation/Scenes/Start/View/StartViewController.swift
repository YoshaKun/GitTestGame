//
//  ViewController.swift
//  GitTestGame
//
//  Created by Yosha Kun on 28.05.2022.
//

import UIKit

class StartViewController: UIViewController {

    // MARK: - Private properties
    
    private let viewModel: StartViewModel
    private let startView: StartView = .init()
    
    // MARK: - Initialization
    
    init(viewModel: StartViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
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
    }
}

// MARK: - StartViewDelegate

extension StartViewController: StartViewDelegate {
    func didTappedStartButton() {
        let secondViewController = SecondAssembley().viewController
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}
