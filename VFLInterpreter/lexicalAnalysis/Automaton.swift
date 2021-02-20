//
//  Automaton.swift
//  VFLInterpreter
//
//  Created by ChenBin on 2021/2/20.
//

import Foundation

public class Automaton {
    
    public private(set) var initialState: State?
    public private(set) var acceptingStates: State?
    
    public init() {
        
        let startState = State(acceptingState: false)
        let endState = State(acceptingState: true)
        
    }
        
    public init(symbol: Character) {
        
        let startState = State(acceptingState: false)
        let endState = State(acceptingState: true)
        startState.addTransition(accept: symbol, to: endState)
        
        initialState = startState
        acceptingStates = endState
    }
    
}

extension Automaton {
    private func convertFromRegex() {
        
    }
}
