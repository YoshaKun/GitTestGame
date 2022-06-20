//
//  AfterThirdViewModel.swift
//  GitTestGame
//
//  Created by Yosha Kun on 20.06.2022.
//

import Combine

protocol AfterThirdViewModel {
    var compareResult: AnyPublisher<String, Never> { get }
    var gameEnded: AnyPublisher<Int, Never> { get }
    
    func startGame()
    func compare(value: Int)
}
