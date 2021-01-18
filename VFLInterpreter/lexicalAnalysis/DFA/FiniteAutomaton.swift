//
//  FiniteAutomaton.swift
//  VFLInterpreter
//
//  Created by CB on 2021/1/14.
//

import Foundation

protocol FiniteAutomaton {
    
    var tokenType: TokenType { get }
    
    func stateTransform(from state: FAState, accept ch: Character?) -> FAState
    
    func triggerStartState(from ch: Character) -> Bool
}
