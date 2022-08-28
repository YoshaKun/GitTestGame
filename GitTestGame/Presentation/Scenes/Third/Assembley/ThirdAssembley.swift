//
//  ThirdAssembley.swift
//  GitTestGame
//
//  Created by Yosha Kun on 04.06.2022.
//

final class ThirdAssembley {
    
    // MARK: - ViewController
    
    var viewController: ThirdViewController {
        return ThirdViewController(viewModel: viewModel)
    }
    
    // MARK: - ViewModel
    
    private var viewModel: ThirdViewModel {
        return ThirdViewModelImp(computerGuessManager: computerGuessManager)
    }
    
    // MARK: - Managers
    
    private var computerGuessManager: ComputerGuessManager {
        return ComputerGuessManagerImp.shared
    }
}
