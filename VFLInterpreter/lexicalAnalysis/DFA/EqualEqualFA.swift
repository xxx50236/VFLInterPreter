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
        
        if state == .equal {
            return ch == equal ? .end : .invalid
        } else {
            return ch == equal ? .equal : .invalid
        }
    }
    
    func triggerStartState(from ch: Character) -> Bool {
        return ch == equal
    }
}

extension EqualEqualFA {
    var equal: Character {
        return "="
    }
}

extension FAState {
    fileprivate static let equal = FAState(rawValue: "equal")
}

