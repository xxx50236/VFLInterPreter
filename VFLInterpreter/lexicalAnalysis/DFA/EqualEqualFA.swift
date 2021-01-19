//
//  EqualEqualFA.swift
//  VFLInterpreter
//
//  Created by CB on 2021/1/18.
//

import Foundation

struct EqualEqualFA: FiniteAutomaton {
    
    var tokenType: TokenType {
        return .equalEqual
    }
    
    func stateTransform(from state: FAState, accept ch: Character?) -> FAState {
        
        guard let ch = ch else {
            return state
        }
        
        if state == .start {
            return ch == equal ? equalState : .invalid
        } else if state == equalState {
            return ch == equal ? acceptState : .invalid
        } else if state == acceptState {
            return ch == equal ? .invalid : .end
        } else {
            return .end
        }
    }
    
    func matched(accept ch: Character) -> Bool {
        return ch == equal
    }
}

extension EqualEqualFA {
    var equal: Character {
        return "="
    }
}

extension EqualEqualFA {
    var equalState: FAState {
        return FAState(rawValue: "=")
    }
    
    var acceptState: FAState {
        return FAState(rawValue: "==")
    }
}
