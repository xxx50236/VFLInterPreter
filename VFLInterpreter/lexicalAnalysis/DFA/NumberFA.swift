//
//  NumberFA.swift
//  VFLInterpreter
//
//  Created by CB on 2021/1/18.
//

import Foundation

struct NumberFA: FiniteAutomaton {
    
    var tokenType: TokenType {
        return .number
    }
    
    func stateTransform(from state: FAState, accept ch: Character?) -> FAState {
        
        guard let ch = ch else {
            return state
        }
        
        if state == .number {
            return ch.isNumber ? .number : .end
        } else {
            return ch.isNumber ? .number : .invalid
        }
    }
    
    func triggerStartState(from ch: Character) -> Bool {
        return ch.isNumber
    }
}

extension FAState {
    fileprivate static let number = FAState(rawValue: "number")
}
