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
        
        if state == .greater {
            return ch == "=" ? .end : .invalid
        } else {
            return ch == greater ? .greater : .invalid
        }
    }
    
    func triggerStartState(from ch: Character) -> Bool {
        return ch == greater
    }
}

extension GreaterEqualFA {
    var greater: Character {
        return ">"
    }
}

extension FAState {
    fileprivate static let greater = FAState(rawValue: "great")
}
