//
//  StartViewModelImp.swift
//  GitTestGame
//
//  Created by Yosha Kun on 29.05.2022.
//

import Combine

final class StartViewModelImp: StartViewModel {
    //    var nextRound: AnyPublisher<Void, Never>
    
    
    // Third screen
    
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

extension StartViewModelImp {
    var computerGuessValue: AnyPublisher<Int, Never> {
        return computerGuessValueSubject.eraseToAnyPublisher()
    }
    
    func startGame() {
//        computerGuessManager.startGame()
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .finished:
//                    print("end")
//                }
//            }, receiveValue: { [weak self] result in
//                self?.computerGuessValueSubject.send(result)
//            })
//            .store(in: &cancellableSet)
//        
//        computerGuessManager.wrongLess()
//        computerGuessManager.wrongLess()
//        computerGuessManager.wrongMore()
//        computerGuessManager.equal()
    }
}
