//
//  ThirdViewController.swift
//  GitTestGame
//
//  Created by Yosha Kun on 04.06.2022.
//

import UIKit

class ThirdViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let viewModel: ThirdViewModel
    private let thirdView: ThirdView = .init()
    
    // MARK: - Initialization
    
    init(viewModel: ThirdViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
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
