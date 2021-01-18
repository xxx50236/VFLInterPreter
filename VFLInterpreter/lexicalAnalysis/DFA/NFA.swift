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
    private var _fsm: FiniteAutomaton
    
    required init(fsm: FiniteAutomaton) {
        _fsm = fsm
    }
    
    func process(str: Substring,
                 from position: Int) -> (left: Substring, current: Int) {
        
        guard let ch = str.first, triggerStartState(ch: ch) else {
            return (str, position)
        }
        
        var offset = 0
        var subStr = str
        var lexeme = ""
        
        _state = .start
        
        while state != .invalid || _state != .end {
            
            _state = _fsm.stateTransform(from: _state, accept: subStr.first)
            lexeme += String(subStr.removeFirst())
            offset += 1
            
        }
        
        if _state == .end {
            _token = Token(type: _fsm.tokenType, lexeme: lexeme)
        }
        
        return _state == .end ? (subStr, position + offset) : (str, position)
    }
    
    func triggerStartState(ch: Character) -> Bool {
        return _fsm.triggerStartState(from: ch)
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
