//
//  Automaton.swift
//  VFLInterpreter
//
//  Created by ChenBin on 2021/2/20.
//

import Foundation

public class Automaton {
    
    public private(set) var initialState: State
    public private(set) var acceptingStates: State
    
    public init() {
        
        let startState = State(acceptingState: false)
        let endState = State(acceptingState: true)
        
        startState.addEpsilonTransition(endState)
        
        initialState = startState
        acceptingStates = endState
    }
        
    public init(symbol: Character) {
        
        let startState = State(acceptingState: false)
        let endState = State(acceptingState: true)
        startState.addTransition(accept: symbol, to: endState)
        
        initialState = startState
        acceptingStates = endState
    }
    
    public init(startState: State, endState: State) {
        initialState = startState
        acceptingStates = endState
    }
    
}

// MARK: Union expression
extension Automaton {
    
    public func union(_ automaton: Automaton) -> Automaton {
        
        let startState = State(acceptingState: false)
        startState.addEpsilonTransition(initialState)
        startState.addEpsilonTransition(automaton.initialState)
        self.initialState = startState
        
        let endState = State(acceptingState: true)
        
        acceptingStates.accepting = false
        endState.addEpsilonTransition(acceptingStates)
        
        automaton.acceptingStates.accepting = false
        endState.addEpsilonTransition(automaton.acceptingStates)
        
        self.acceptingStates = endState
        
        return self
    }
    
}

// MARK: Concat expression
extension Automaton {
    
    public func concat(_ automaton: Automaton) -> Automaton {
        
        self.acceptingStates.accepting = false
        self.acceptingStates.addEpsilonTransition(automaton.initialState)
        self.acceptingStates = automaton.acceptingStates
        
        return self
    }
    
}

// MARK: Closure expression
extension Automaton {
    
    public func closure() -> Automaton {
        
        let startState = State(acceptingState: false)
        let endState = State(acceptingState: true)
        
        startState.addEpsilonTransition(self.initialState)
        startState.addEpsilonTransition(self.acceptingStates)
        
        acceptingStates.addEpsilonTransition(self.initialState)
        acceptingStates.addEpsilonTransition(endState)
        
        self.initialState = startState
        self.acceptingStates = endState
        
        return self
    }
    
}
