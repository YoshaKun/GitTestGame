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
    
    private let computerGuessSubject: CurrentValueSubject<Int, Never> = .init(0)
    private var _counterOfGuesses = 0
    private var currentClosedRange: ClosedRange<Int> = 0...100
}

// MARK: - computerGuess: AnyPublisher<Int, Never>

extension ComputerGuessManagerImp {
    var computerGuess: AnyPublisher<Int, Never> {
        return computerGuessSubject.eraseToAnyPublisher()
    }
}

// MARK: - counterOfGuesses: Int

extension ComputerGuessManagerImp {
    var counterOfGuesses: Int {
        return _counterOfGuesses
    }
}

// MARK: - startGame()

extension ComputerGuessManagerImp {
    func startGame() {
        computerGuessSubject.send(Int.random(in: 0...100))
        _counterOfGuesses += 1
    }
}

// MARK: - wrongLess()

extension ComputerGuessManagerImp {
    func wrongLess() {
        currentClosedRange = currentClosedRange.lowerBound...computerGuessSubject.value
        
        let newValue = Int.random(in: currentClosedRange)
        
        computerGuessSubject.send(newValue)
        _counterOfGuesses += 1
    }
}
 
// MARK: - wrongMore()

extension ComputerGuessManagerImp {
    func wrongMore() {
        currentClosedRange = computerGuessSubject.value...currentClosedRange.upperBound
        
        let newValue = Int.random(in: currentClosedRange)
        
        computerGuessSubject.send(newValue)
        _counterOfGuesses += 1
    }
}

// MARK: - equal()

extension ComputerGuessManagerImp {
    func equal() {
        computerGuessSubject.send(completion: .finished)
    }
}
