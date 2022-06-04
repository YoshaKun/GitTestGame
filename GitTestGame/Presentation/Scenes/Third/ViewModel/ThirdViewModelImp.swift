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

// MARK: - Manager
    
    private let computerGuessManager: ComputerGuessManager
    private var cancellableSet: Set<AnyCancellable> = []
    
    // MARK: - Initialization
    
    init(computerGuessManager: ComputerGuessManager) {
        self.computerGuessManager = computerGuessManager
    }
}

// MARK: - startGame()

extension ThirdViewModelImp {
    var computerGuessValue: AnyPublisher<Int, Never> {
        return computerGuessValueSubject.eraseToAnyPublisher()
    }
    
    func startGame() {
        computerGuessManager.startGame()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("end")
                }
            }, receiveValue: { [weak self] result in
                self?.computerGuessValueSubject.send(result)
            })
            .store(in: &cancellableSet)
        
        computerGuessManager.wrongMore()
        computerGuessManager.wrongLess()
        computerGuessManager.wrongMore()
        computerGuessManager.equal()
    }
}
