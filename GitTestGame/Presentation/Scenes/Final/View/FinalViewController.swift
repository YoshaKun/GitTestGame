//
//  FinalViewController.swift
//  GitTestGame
//
//  Created by Yosha Kun on 20.06.2022.
//

import UIKit

class FinalViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let viewModel: FinalViewModel
    private let finalView: FinalView = .init()
    
    init(viewModel: FinalViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle methods
    
    override func loadView() {
        super.loadView()
        
        finalView.delegate = self
        view = finalView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalView.set(result: viewModel.compareGuesses())
    }
}

// MARK: - FinalViewDelegate

extension FinalViewController: FinalViewDelegate {
    func didTappedReturnButton() {
        navigationController?.popToRootViewController(animated: true)
    }
}
