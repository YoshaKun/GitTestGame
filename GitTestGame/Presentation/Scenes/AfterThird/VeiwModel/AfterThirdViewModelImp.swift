//
//  AfterThirdViewModelImp.swift
//  GitTestGame
//
//  Created by Yosha Kun on 20.06.2022.
//

import Combine

final class AfterThirdViewModelImp: AfterThirdViewModel {
    
    // MARK: - Private properties

    private let compareResultSubject: PassthroughSubject<String, Never> = .init()
    private let gameEndedSubject: PassthroughSubject<Int, Never> = .init()
    private var cancellableSet: Set<AnyCancellable> = []
    
    // MARK: - Managers

    private let playerGuessManager: PlayerGuessManager
    
    // MARK: - Initialization
    
    init(playerGuessManager: PlayerGuessManager) {
        self.playerGuessManager = playerGuessManager
        
        playerGuessManager.comparePlayerGuess
            .sink(receiveCompletion: { [weak self] _ in
                guard let self = self else { return }
                
                self.gameEndedSubject.send(self.playerGuessManager.counterOfGuesses)
            }, receiveValue: { [weak self] result in
                self?.compareResultSubject.send(String(result.rawValue))
            })
            .store(in: &cancellableSet)
    }
}

// MARK: - comparePlayerGuess: AnyPublisher<ComparePlayerGuess, Never>

extension AfterThirdViewModelImp {
    var compareResult: AnyPublisher<String, Never> {
        compareResultSubject.eraseToAnyPublisher()
    }
}

// MARK: - gameEnded: AnyPublisher<Int, Never>

extension AfterThirdViewModelImp {
    var gameEnded: AnyPublisher<Int, Never> {
        gameEndedSubject.eraseToAnyPublisher()
    }
}

// MARK: - startGame()
extension AfterThirdViewModelImp {
    func startGame() {
        playerGuessManager.startGame()
    }
}

// MARK: - compare(value: Int)
extension AfterThirdViewModelImp {
    func compare(value: Int) {
        playerGuessManager.compare(value: value)
    }
}
