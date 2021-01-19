//
//  IdentifierFA.swift
//  VFLInterpreter
//
//  Created by CB on 2021/1/18.
//

import Foundation

struct IdentifierFA: FiniteAutomaton {
    
    var tokenType: TokenType {
        return .identifier
    }
    
    func stateTransform(from state: FAState, accept ch: Character?) -> FAState {
        guard let ch = ch else {
            return state
        }
        
        if state == .start {
            return ch.isLetter || ch.isNumber ? acceptState : .invalid
        } else if state == acceptState {
            return ch.isLetter || ch.isNumber ? acceptState : .end
        } else {
            return .invalid
        }
    }
    
    func matched(accept ch: Character) -> Bool {
        return ch.isLetter
    }
}

extension IdentifierFA {
    var acceptState: FAState {
        return FAState(rawValue: "identifier")
    }
}
