//
//  FinalAssembley.swift
//  GitTestGame
//
//  Created by Yosha Kun on 20.06.2022.
//

final class FinalAssembley {
    
    // MARK: - ViewController
    
    var viewController: FinalViewController {
        return FinalViewController(viewModel: viewModel)
    }
    
    // MARK: - ViewModel
    
    private var viewModel: FinalViewModel {
        return FinalViewModelImp(computerGuessManager: computerGuessManager, playerGuessManager: playerGuessManager)
    }
    
    // MARK: - Managers
    
    private var computerGuessManager: ComputerGuessManager {
        ComputerGuessManagerImp()
    }
    
    private var playerGuessManager: PlayerGuessManager {
        PlayerGuessManagerImp()
    }
}
