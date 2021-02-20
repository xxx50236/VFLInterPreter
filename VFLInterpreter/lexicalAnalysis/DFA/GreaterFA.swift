//
//  GreaterFA.swift
//  VFLInterpreter
//
//  Created by ChenBin on 2021/1/21.
//

import Foundation

struct GreaterFA: FiniteAutomaton {
    var tokenType: TokenType {
        return .greater
    }
    
    func stateTransform(from state: FAState, accept ch: Character?) -> FAState {
        
        guard let ch = ch else {
            return state
        }
            
        if state == .start {
            return ch == greater ? acceptState : .invalid
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

extension GreaterFA {
    
    var greater: Character {
        return ">"
    }
    
    var acceptState: FAState {
        return FAState(rawValue: String(greater))
    }
}
