//
//  StartAssembly.swift
//  GitTestGame
//
//  Created by Yosha Kun on 29.05.2022.
//

final class StartAssembly {
    
    // MARK: - ViewController
    
    var viewController: StartViewController {
        return StartViewController(viewModel: viewModel)
    }
    
    // MARK: - ViewModel
    
    private var viewModel: StartViewModel {
        return StartViewModelImp()
    }
}
