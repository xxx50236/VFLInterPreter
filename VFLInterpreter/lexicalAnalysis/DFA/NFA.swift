//
//  NFA.swift
//  VFLInterpreter
//
//  Created by CB on 2021/1/18.
//

import Foundation

class NFA {

    private var _state: FAState = .invalid
    private var _token: Token?
    private var _fa: FiniteAutomaton
    
    required init(fa: FiniteAutomaton) {
        _fa = fa
    }
    
    func process(str: Substring,
                 from position: Int) -> (left: Substring, current: Int) {
        
        guard let ch = str.first, matched(accept: ch) else {
            return (str, position)
        }
        
        var offset = 0
        var subStr = str
        var lexeme = ""
        
        _state = .start
        
        while let firstChar = subStr.first {
            
            _state = _fa.stateTransform(from: _state, accept: firstChar)
            
            if _state == .invalid || _state == .end {
                break
            }
            
            lexeme += String(subStr.removeFirst())
            offset += 1
            
        }
    
        if _state != .invalid {
            _token = Token(type: _fa.tokenType, lexeme: lexeme)
            _state = .end
        }
        
        return _state != .invalid ? (subStr, position + offset) : (str, position)
    }
    
    func matched(accept ch: Character) -> Bool {
        return _fa.matched(accept: ch)
    }
}

extension NFA {
    var state: FAState {
        return _state
    }
    
    var token: Token? {
        return _token
    }
}
