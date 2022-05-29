//
//  WeGuessManager.swift
//  GitTestGame
//
//  Created by Yosha Kun on 29.05.2022.
//

import Combine

protocol ComputerGuessManager {
    func startGame() -> AnyPublisher<Int, Never>
    func wrongLess()
    func wrongMore()
    func equal()
}
