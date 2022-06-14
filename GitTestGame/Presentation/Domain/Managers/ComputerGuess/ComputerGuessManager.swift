//
//  WeGuessManager.swift
//  GitTestGame
//
//  Created by Yosha Kun on 29.05.2022.
//

import Combine

protocol ComputerGuessManager {
    var computerGuess: AnyPublisher<Int, Never> { get }
    var counterOfGuesses: Int { get }
    
    func startGame()
    func wrongLess()
    func wrongMore()
    func equal()
}
