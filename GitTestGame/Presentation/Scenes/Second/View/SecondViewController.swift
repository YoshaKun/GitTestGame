//
//  SecondViewController.swift
//  GitTestGame
//
//  Created by Yosha Kun on 28.05.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let viewModel: SecondViewModel
    private let secondView: SecondView = .init()
    
    // MARK: - Initialization
    
    init(viewModel: SecondViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle methods
    
    override func loadView() {
        super.loadView()
        
        view = secondView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
