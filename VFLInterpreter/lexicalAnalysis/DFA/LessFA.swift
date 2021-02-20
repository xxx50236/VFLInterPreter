//
//  LessFA.swift
//  VFLInterpreter
//
//  Created by ChenBin on 2021/1/21.
//

import Foundation

struct LessFA: FiniteAutomaton {
    var tokenType: TokenType {
        return .less
    }
    
    func stateTransform(from state: FAState, accept ch: Character?) -> FAState {
        
        guard let ch = ch else {
            return state
        }
            
        if state == .start {
            return ch == less ? acceptState : .invalid
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

extension LessFA {
    
    var less: Character {
        return "<"
    }
    
    var acceptState: FAState {
        return FAState(rawValue: String(less))
    }
}
