//
//  DFA.swift
//  VFLInterpreter
//
//  Created by ChenBin on 2021/1/12.
//

import Foundation

protocol DFA {
    var state: DFAState { get }
    var token: Token { get }
    
    func process(str: Substring) -> Substring
    
    func startStateTrigger() -> [Character]
}
