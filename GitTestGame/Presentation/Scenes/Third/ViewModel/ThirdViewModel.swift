//
//  ThirdViewModel.swift
//  GitTestGame
//
//  Created by Yosha Kun on 04.06.2022.
//

import Combine

protocol ThirdViewModel {
    
    var computerGuessValue: AnyPublisher<Int, Never> { get }
    
    func startGame()
}
