//
//  FinalViewModelImp.swift
//  GitTestGame
//
//  Created by Yosha Kun on 27.06.2022.
//

import Combine
import Foundation

final class FinalViewModelImp: FinalViewModel {
    
    // MARK: - Managers
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    // MARK: - Private properties
    
    private var computerGuessCounter: Int
    private var playerGuessCounter: Int
    
    // MARK: - Initialization
    
    init(computerGuessManager: ComputerGuessManager, playerGuessManager: PlayerGuessManager) {
        computerGuessCounter = computerGuessManager.counterOfGuesses
        playerGuessCounter = playerGuessManager.counterOfGuesses
    }
}

extension FinalViewModelImp {
    func compareGuesses() -> String {
        if computerGuessCounter > playerGuessCounter {
            return "You Win!"
        } else {
            return "You Lose!"
        }
    }
}
