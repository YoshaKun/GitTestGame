//
//  SecondViewModel.swift
//  GitTestGame
//
//  Created by Yosha Kun on 29.05.2022.
//

import Combine

protocol SecondViewModel {
    var compareResult: AnyPublisher<String, Never> { get }
    var gameEnded: AnyPublisher<Int, Never> { get }
    
    func startGame()
    func compare(value: Int)
}
