//
//  DFA.swift
//  VFLInterpreter
//
//  Created by ChenBin on 2021/1/12.
//

import Foundation

protocol DFA {
    var state: DFAState { get }
    var token: Token? { get }
    
    func process(str: Substring, from position: Int) -> (left: Substring, current: Int)
    
    func triggerStartState(ch: Character) -> Bool
}
