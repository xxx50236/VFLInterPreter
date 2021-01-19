//
//  VFLScanner.swift
//  VFLInterpreter
//
//  Created by ChenBin on 2021/1/11.
//

import Foundation

public class VFLScanner {
    
    let str: String
    
    private(set) var leftStr: Substring
    
    private var current: Int = 0
    private var tokens: [Token] = []
    
    public required init?(input: String?) {
        guard let input = input, !input.isEmpty else {
            return nil
        }
        
        str = input
        leftStr = Substring(input)
    }
}

extension VFLScanner {
    
    func nextToken() -> Token? {
        guard let ch = leftStr.first else {
            return nil
        }
        
        var matchedDFA: NFA?
      
        for dfa in dfas where dfa.matched(accept: ch) {
            let res = dfa.process(str: leftStr, from: current)
            if dfa.token != nil && dfa.state == FAState.end && res.current > current {
                leftStr = res.left
                current = res.current

                matchedDFA = dfa
            }
        }
        
        if let token = matchedDFA?.token {
            tokens.append(token)
        }
        
        return matchedDFA?.token
    }
    
}

extension VFLScanner {
    var dfas: [NFA] {
        
        let leftBraceNFA = NFA(fa: SpecialCharFA(ch: "[", tokenType: .leftBrace))
        let rightBraceNFA = NFA(fa: SpecialCharFA(ch: "]", tokenType: .rightBrace))
        let idNFA = NFA(fa: IdentifierFA())
        let connectionNFA = NFA(fa: SpecialCharFA(ch: "-", tokenType: .connection))
        
        return [leftBraceNFA, rightBraceNFA, idNFA, connectionNFA]
    }
}
