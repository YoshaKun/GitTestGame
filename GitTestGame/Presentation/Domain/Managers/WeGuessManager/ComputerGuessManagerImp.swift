//
//  ComputerGuessManagerImp.swift
//  GitTestGame
//
//  Created by Yosha Kun on 29.05.2022.
//

import Foundation
import Combine

final class ComputerGuessManagerImp: ComputerGuessManager {
    
    // MARK: - Private properties
    
    private let computerGuessSubject: CurrentValueSubject<Int, Never> = .init(Int.random(in: 0...100))
    private var currentClosedRange: ClosedRange<Int> = 0...100
}

// MARK: - startGame()

extension ComputerGuessManagerImp {
    func startGame() -> AnyPublisher<Int, Never> {
        return computerGuessSubject.eraseToAnyPublisher()
    }
}

// MARK: - wrongLess()

extension ComputerGuessManagerImp {
    func wrongLess() {
        currentClosedRange = currentClosedRange.lowerBound...computerGuessSubject.value
        
        let newValue = Int.random(in: currentClosedRange)
        
        computerGuessSubject.send(newValue)
    }
}
 
// MARK: - wrongMore()

extension ComputerGuessManagerImp {
    func wrongMore() {
        currentClosedRange = computerGuessSubject.value...currentClosedRange.upperBound
        
        let newValue = Int.random(in: currentClosedRange)
        
        computerGuessSubject.send(newValue)
    }
}

// MARK: - equal()

extension ComputerGuessManagerImp {
    func equal() {
        computerGuessSubject.send(completion: .finished)
    }
}
