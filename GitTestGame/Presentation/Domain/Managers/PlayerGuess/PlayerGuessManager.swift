//
//  PlayerGuessManager.swift
//  GitTestGame
//
//  Created by Yosha Kun on 19.06.2022.
//

import Combine

protocol PlayerGuessManager {
    var comparePlayerGuess: AnyPublisher<ComparePlayerGuess, Never> { get }
    var counterOfGuesses: Int { get }
    
    func startGame()
    func compare(value: Int)
}

#warning("RoadMap")

/*
 
 create enum Enum (less, more) ?
 
 create PlayerGuessManager
   var playerGuess: AnyPublisher<Enum, Never>
   startGame() Int.random(in: 0...100)
   compare(value: Int) if computerValue <>=; playerGuessSubject.send(Enum) or .send(completion: .finished)
 сюда засунуть каунтер как в примере
 */
