//
//  SingleCharacterFA.swift
//  VFLInterpreter
//
//  Created by CB on 2021/1/15.
//

import Foundation

struct SingleCharacterFA: FiniteAutomaton {
    
    let ch: Character
    let tokenType: TokenType
    
    func stateTransform(from state: FAState, accept ch: Character?) -> FAState {
        return ch == self.ch ? .end : .invalid
    }
    
    func triggerStartState(from ch: Character) -> Bool {
        return ch == self.ch
    }
    
}
