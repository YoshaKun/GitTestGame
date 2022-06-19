//
//  SecondViewModelImp.swift
//  GitTestGame
//
//  Created by Yosha Kun on 29.05.2022.
//

import Combine

final class SecondViewModelImp: SecondViewModel {
    
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

extension SecondViewModelImp {
    var compareResult: AnyPublisher<String, Never> {
        compareResultSubject.eraseToAnyPublisher()
    }
}

// MARK: - gameEnded: AnyPublisher<Int, Never>

extension SecondViewModelImp {
    var gameEnded: AnyPublisher<Int, Never> {
        gameEndedSubject.eraseToAnyPublisher()
    }
}

// MARK: - startGame()
extension SecondViewModelImp {
    func startGame() {
        playerGuessManager.startGame()
    }
}

// MARK: - compare(value: Int)
extension SecondViewModelImp {
    func compare(value: Int) {
        playerGuessManager.compare(value: value)
    }
}
