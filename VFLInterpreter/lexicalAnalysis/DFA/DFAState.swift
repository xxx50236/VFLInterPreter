//
//  DFAState.swift
//  VFLInterpreter
//
//  Created by ChenBin on 2021/1/12.
//

import Foundation

struct DFAState: RawRepresentable {
    
    let rawValue: String
    
}

extension DFAState {
    static let start = DFAState(rawValue: "start")
    static let end = DFAState(rawValue: "end")
    static let invalid = DFAState(rawValue: "invalid")
}
