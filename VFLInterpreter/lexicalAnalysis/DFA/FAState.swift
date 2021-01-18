//
//  FAState.swift
//  VFLInterpreter
//
//  Created by CB on 2021/1/18.
//

import Foundation

struct FAState: RawRepresentable {
    
    let rawValue: String
    
}

extension FAState {
    static let start = FAState(rawValue: "start")
    static let end = FAState(rawValue: "end")
    static let invalid = FAState(rawValue: "invalid")
}
