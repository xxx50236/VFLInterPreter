//
//  GreaterEqualFSM.swift
//  VFLInterpreter
//
//  Created by CB on 2021/1/18.
//

import Foundation

struct GreaterEqualFA: FiniteAutomaton {
    
    var tokenType: TokenType {
        return .greaterEqual
    }
    
    func stateTransform(from state: FAState, accept ch: Character?) -> FAState {
        
        guard let ch = ch else {
            return state
        }
        
        if state == .start {
            return ch == greater ? greatState : .invalid
        } else if state == greatState {
            return ch == "=" ? acceptState : .invalid
        } else if state == acceptState {
            return .end
        } else {
            return .invalid
        }
    }
    
    func matched(accept ch: Character) -> Bool {
        return ch == greater
    }
}

extension GreaterEqualFA {
    var greater: Character {
        return ">"
    }
}

extension GreaterEqualFA {
    var greatState: FAState {
        return FAState(rawValue: ">")
    }
    
    var acceptState: FAState {
        return FAState(rawValue: ">=")
    }
}
