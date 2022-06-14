//
//  ThirdViewModelImp.swift
//  GitTestGame
//
//  Created by Yosha Kun on 04.06.2022.
//

import Combine

final class ThirdViewModelImp: ThirdViewModel {

    // MARK: - Private properties

    private let computerGuessValueSubject: PassthroughSubject<Int, Never> = .init()
    private let gameEndedSubject: PassthroughSubject<Int, Never> = .init()
    
    // MARK: - Manager
    
    private let computerGuessManager: ComputerGuessManager
    private var cancellableSet: Set<AnyCancellable> = []
    
    // MARK: - Initialization
    
    init(computerGuessManager: ComputerGuessManager) {
        self.computerGuessManager = computerGuessManager
        
        computerGuessManager.computerGuess
            .sink(receiveCompletion: { [weak self] _ in
                guard let self = self else { return }
                
                self.gameEndedSubject.send(self.computerGuessManager.counterOfGuesses)
            }, receiveValue: { [weak self] result in
                self?.computerGuessValueSubject.send(result)
            })
            .store(in: &cancellableSet)
    }
}

// MARK: - startGame()

extension ThirdViewModelImp {
    var computerGuessValue: AnyPublisher<Int, Never> {
        return computerGuessValueSubject.eraseToAnyPublisher()
    }
    
    var gameEnded: AnyPublisher<Int, Never> {
        return gameEndedSubject.eraseToAnyPublisher()
    }
    
    func startGame() {
        computerGuessManager.startGame()
    }
    
    func wrongLess() {
        computerGuessManager.wrongLess()
    }
    
    func wrongMore() {
        computerGuessManager.wrongMore()
    }
    
    func equal() {
        computerGuessManager.equal()
    }
}
