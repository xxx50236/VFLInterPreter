//
//  LessEqualFA.swift
//  VFLInterpreter
//
//  Created by CB on 2021/1/18.
//

import Foundation

struct LessEqualFA: FiniteAutomaton {
    
    var tokenType: TokenType {
        return .lessEqual
    }
    
    func stateTransform(from state: FAState, accept ch: Character?) -> FAState {
        
        guard let ch = ch else {
            return state
        }
        
        if state == .less {
            return ch == "=" ? .end : .invalid
        } else {
            return ch == less ? .less : .invalid
        }
    }
    
    func triggerStartState(from ch: Character) -> Bool {
        return ch == less
    }
}

extension LessEqualFA {
    var less: Character {
        return "<"
    }
}

extension FAState {
    fileprivate static let less = FAState(rawValue: "less")
}
