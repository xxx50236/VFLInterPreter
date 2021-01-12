//
//  DFAState.swift
//  VFLInterpreter
//
//  Created by ChenBin on 2021/1/12.
//

import Foundation

struct DFAState: RawRepresentable {
    static let start = DFAState(rawValue: "start")
    static let end = DFAState(rawValue: "end")
    
    let rawValue: String
}
