//
//  SpecialCharFA.swift
//  VFLInterpreter
//
//  Created by ChenBin on 2021/1/19.
//

import Foundation

struct SpecialCharFA: FiniteAutomaton {
    
    let ch: Character
    let tokenType: TokenType
    
    func stateTransform(from state: FAState, accept ch: Character?) -> FAState {
        
        guard let char = ch else {
            return state
        }
        
        if state == .start {
            return char == self.ch ? acceptState : .invalid
        } else if state == acceptState {
            return char == self.ch ? .invalid : .end
        } else {
            return .invalid
        }
    }
    
    func matched(accept ch: Character) -> Bool {
        return ch == self.ch
    }
}

extension SpecialCharFA {
    var acceptState: FAState {
        return FAState(rawValue: String(ch))
    }
}
