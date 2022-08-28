//
//  PlayerGuessManagerImp.swift
//  GitTestGame
//
//  Created by Yosha Kun on 19.06.2022.
//

import Foundation
import Combine

final class PlayerGuessManagerImp: PlayerGuessManager {
    
    // MARK: - shared
    
    static let shared: PlayerGuessManager = PlayerGuessManagerImp()
    
    // MARK: - Private Properties
    
    private var comparePlayerGuessSubject: PassthroughSubject <ComparePlayerGuess, Never> = .init()
    private var _counterOfGuesses = 0
    private var computerValue = 0
    
    // MARK: - Initialization
    
    private init() {}
}

// MARK: - comparePlayerGuess: AnyPublisher<ComparePlayerGuess, Never>
extension PlayerGuessManagerImp {
    var comparePlayerGuess: AnyPublisher <ComparePlayerGuess, Never> {
        return comparePlayerGuessSubject.eraseToAnyPublisher()
    }
}

// MARK: - counterOfGuess: Int
extension PlayerGuessManagerImp {
    var counterOfGuesses: Int {
        return _counterOfGuesses
    }
}

// MARK: - startGame()
extension PlayerGuessManagerImp {
    func startGame() {
        computerValue = Int.random(in: 0...100)
        
        _counterOfGuesses += 1
        print(_counterOfGuesses)
    }
}

// MARK: - compare()
extension PlayerGuessManagerImp {
    func compare(value: Int) {
        if value < computerValue {
            comparePlayerGuessSubject.send(ComparePlayerGuess.more)
            _counterOfGuesses += 1
            print(_counterOfGuesses)
        } else if value > computerValue {
            comparePlayerGuessSubject.send(ComparePlayerGuess.less)
            _counterOfGuesses += 1
            print(_counterOfGuesses)
        } else if value == computerValue {
            comparePlayerGuessSubject.send(completion: .finished)
        }
    }
}
