//
//  AfterThirdAssembley.swift
//  GitTestGame
//
//  Created by Yosha Kun on 20.06.2022.
//

final class AfterThirdAssembley {
    // MARK: - ViewController
    
    var viewController: AfterThirdViewController {
        return AfterThirdViewController(viewModel: viewModel)
    }

    // MARK: - ViewModel

    private var viewModel: AfterThirdViewModel {
        return AfterThirdViewModelImp(playerGuessManager: playerGuessManager)
    }

    // MARK: - Managers

    private var playerGuessManager: PlayerGuessManager {
        PlayerGuessManagerImp()
    }
}
