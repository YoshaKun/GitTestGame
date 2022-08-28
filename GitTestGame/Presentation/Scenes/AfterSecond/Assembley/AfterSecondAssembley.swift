//
//  AfterSecondAssembley.swift
//  GitTestGame
//
//  Created by Yosha Kun on 20.06.2022.
//

final class AfterSecondAssembley {
    
    // MARK: - ViewController

    var viewController: AfterSecondViewController {
        return AfterSecondViewController(viewModel: viewModel)
    }

    // MARK: - ViewModel

    private var viewModel: AfterSecondViewModel {
        return AfterSecondViewModelImp(computerGuessManager: computerGuessManager)
    }

    // MARK: - Managers

    private var computerGuessManager: ComputerGuessManager {
        return ComputerGuessManagerImp.shared
    }
}
