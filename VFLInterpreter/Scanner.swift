//
//  Scanner.swift
//  VFLInterpreter
//
//  Created by ChenBin on 2021/1/11.
//

import Foundation

struct Scanner {
    
    let source: String
    private let dfaMap: [Character: DFA] = [:]
    
    init(input: String) {
        
        source = input
        
        
        
    }
}

extension Scanner {
    func scanTokens() -> [Token] {
        
        var tokens: [Token] = []
        
        for ch in source {
            
            if ch == "[" {
                
            }
            
        }
        return tokens
    }
}

extension Scanner {
    var dfas: [DFA] {
        return []
    }
}
