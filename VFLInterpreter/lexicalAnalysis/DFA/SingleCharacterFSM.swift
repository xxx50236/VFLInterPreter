//
//  SingleCharacterFSM.swift
//  VFLInterpreter
//
//  Created by CB on 2021/1/15.
//

import Foundation

struct SingleCharacterFSM: FSM {
    
    let ch: Character
    let tokenType: TokenType
    
    func stateTransform(from state: DFAState, accept ch: Character?) -> DFAState {
        return ch == self.ch ? .end : .invalid
    }
    
}
