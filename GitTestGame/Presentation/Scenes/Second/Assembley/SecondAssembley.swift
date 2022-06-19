//
//  SecondAssembley.swift
//  GitTestGame
//
//  Created by Yosha Kun on 29.05.2022.
//

final class SecondAssembley {
    
    // MARK: - ViewController
    
    var viewController: SecondViewController {
        return SecondViewController(viewModel: viewModel)
    }
            
    // MARK: - ViewModel
        
    private var viewModel: SecondViewModel {
        return SecondViewModelImp(playerGuessManager: playerGuessManager)
    }
    
    // MARK: - Managers
    
    private var playerGuessManager: PlayerGuessManager {
        PlayerGuessManagerImp()
    }
}
