//
//  StartViewModel.swift
//  GitTestGame
//
//  Created by Yosha Kun on 29.05.2022.
//

import Combine

protocol StartViewModel {
//    var nextRound: AnyPublisher<Void, Never> { get }

    var computerGuessValue: AnyPublisher<Int, Never> { get }
    
    func startGame()
}
