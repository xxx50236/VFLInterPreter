//
//  IdentifierFA.swift
//  VFLInterpreter
//
//  Created by CB on 2021/1/18.
//

import Foundation

struct IdentifierFA {
    
    var tokenType: TokenType {
        return .identifier
    }
    
    func stateTransform(from state: FAState, accept ch: Character?) -> FAState {
        guard let ch = ch else {
            return state
        }
        
        if state == .identifier {
            return ch.isLetter || ch.isNumber ? .identifier : .end
        } else {
            return ch.isLetter || ch.isNumber ? .identifier : .invalid
        }
    }
    
    func triggerStartState(from ch: Character) -> Bool {
        return ch.isLetter
    }
    
}

extension FAState {
    fileprivate static let identifier = FAState(rawValue: "identifier")
}
