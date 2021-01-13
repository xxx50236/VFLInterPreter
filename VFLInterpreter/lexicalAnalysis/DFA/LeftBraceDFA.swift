//
//  LeftBraceDFA.swift
//  VFLInterpreter
//
//  Created by ChenBin on 2021/1/13.
//

import Foundation

class LeftBraceDFA: DFA {

    private var _state: DFAState = .invalid
    private var _token: Token?
    
    func process(str: Substring,
                 from position: Int) -> (left: Substring, current: Int) {
        
        guard let ch = str.first, triggerStartState(ch: ch) else {
            return (str, position)
        }
        
        _token = Token(type: .leftBrace, lexeme: lexeme)
        _state = .end
        return (str.dropFirst(), position + 1)
    }
    
    func triggerStartState(ch: Character) -> Bool {
        return ch == Character(lexeme)
    }
}

extension LeftBraceDFA {
    var state: DFAState {
        return _state
    }
    
    var token: Token? {
        return _token
    }
}

extension LeftBraceDFA {
    var lexeme: String {
        return "["
    }
}
