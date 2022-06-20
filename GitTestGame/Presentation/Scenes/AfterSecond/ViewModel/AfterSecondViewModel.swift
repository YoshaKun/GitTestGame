//
//  AfterSecondViewModel.swift
//  GitTestGame
//
//  Created by Yosha Kun on 20.06.2022.
//

import Combine

protocol AfterSecondViewModel {
    var computerGuessValue: AnyPublisher<Int, Never> { get }
    var gameEnded: AnyPublisher<Int, Never> { get }
    
    func startGame()
    func wrongLess()
    func wrongMore()
    func equal()
}
