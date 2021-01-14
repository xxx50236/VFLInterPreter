//
//  DFA.swift
//  VFLInterpreter
//
//  Created by CB on 2021/1/14.
//

import Foundation

class DFA {

    private var _state: DFAState = .invalid
    private var _token: Token?
    private var _fsm: FSM
    
    required init(fsm: FSM) {
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
        
        repeat {
            _state = _fsm.stateTransform(from: _state, accept: subStr.first)
            lexeme += String(subStr.removeFirst())
            offset += 1
            
        } while state != .invalid || _state != .end
        
        if _state == .end {
            _token = Token(type: _fsm.tokenType, lexeme: lexeme)
        }
        
        return _state == .end ? (subStr, position + offset) : (str, position)
    }
    
    func triggerStartState(ch: Character) -> Bool {
        return _fsm.stateTransform(from: .invalid, accept: ch) == .start
    }
}

extension DFA {
    var state: DFAState {
        return _state
    }
    
    var token: Token? {
        return _token
    }
}
