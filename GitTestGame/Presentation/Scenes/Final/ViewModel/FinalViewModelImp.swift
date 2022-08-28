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
    
    private let computerGuessManager: ComputerGuessManager
    private let playerGuessManager: PlayerGuessManager
    private var cancellableSet: Set<AnyCancellable> = []
    
    // MARK: - Initialization
    
    init(computerGuessManager: ComputerGuessManager, playerGuessManager: PlayerGuessManager) {
        self.computerGuessManager = computerGuessManager
        self.playerGuessManager = playerGuessManager
    }
    
    // MARK: - Private properties
    private var computerGuessCounterSubject: Int = 0
    private var playerGuessCounterSubject: Int = 0
    private var finalScoreStringSubject: String = "формула не работает"
    
    
}

extension FinalViewModelImp {
    var computerGuessCounter: Int {
        return computerGuessCounterSubject
    }
    
    var playerGuessCounter: Int {
        return playerGuessCounterSubject
    }
    
    func compareGuesses() {
        if computerGuessCounterSubject > playerGuessCounterSubject {
            finalScoreStringSubject = "You Lose!"
        } else if computerGuessCounterSubject < playerGuessCounterSubject {
            finalScoreStringSubject = "You Win!"
        }
    }
    
    var finalScoreString: String {
        return finalScoreStringSubject
    }
}
