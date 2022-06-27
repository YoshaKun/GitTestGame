//
//  FinalViewModel.swift
//  GitTestGame
//
//  Created by Yosha Kun on 27.06.2022.
//

import Combine

protocol FinalViewModel {
    
    var computerGuessCounter: Int { get }
    
    var playerGuessCounter: Int { get }
    
    var finalScoreString: String { get }
    
    func compareGuesses()
}
