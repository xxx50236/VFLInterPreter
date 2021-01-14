//
//  FSM.swift
//  VFLInterpreter
//
//  Created by CB on 2021/1/14.
//

import Foundation

protocol FSM {
    var tokenType: TokenType { get }
    func stateTransform(from state: DFAState, accept ch: Character?) -> DFAState
}
