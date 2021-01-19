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
        
        if state == .start {
            return ch == less ? lessState : .invalid
        } else if state == lessState {
            return ch == "=" ? acceptState : .invalid
        } else if state == acceptState {
            return .end
        } else {
            return .invalid
        }
    }
    
    func matched(accept ch: Character) -> Bool {
        return ch == less
    }
}

extension LessEqualFA {
    var less: Character {
        return "<"
    }
}

extension LessEqualFA {
    var lessState: FAState {
        return FAState(rawValue: "<")
    }
    
    var acceptState: FAState {
        return FAState(rawValue: "<=")
    }
}
