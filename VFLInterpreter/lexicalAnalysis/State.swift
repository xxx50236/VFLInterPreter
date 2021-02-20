//
//  State.swift
//  VFLInterpreter
//
//  Created by ChenBin on 2021/2/20.
//

import Foundation

public class State {
    
    public let accepting: Bool
    
    public private(set) var transitions: [Character: State] = [:]
    
    public private(set) var epsilonTransitions: [State] = []
    
    public init(acceptingState: Bool) {
        accepting = acceptingState
    }
    
}

extension State {
    
    public func addEpsilonTransition(_ state: State) {
        epsilonTransitions.append(state)
    }
    
    public func addTransition(accept ch: Character, to state: State) {
        transitions[ch] = state
    }
    
}
