//
//  VFLScanner.swift
//  VFLInterpreter
//
//  Created by ChenBin on 2021/1/11.
//

import Foundation

public class VFLScanner {
    
    public let str: String
    
    public private(set) var leftStr: Substring
    
    public private(set) var current: Int = 0
    
    private var tokens: [Token] = []
    
    private var automatons: [Automaton] = []
    
    public required init?(input: String?) {
        guard let input = input, !input.isEmpty else {
            return nil
        }
        
        str = input
        leftStr = Substring(input)
        automatons = recognizedRegexs.compactMap(convertRegexToNFA(_:))
    }
}

// MARK: Convert regex to automaton
extension VFLScanner {
    
    public var recognizedRegexs: [String] {
        return []
    }
        
    private func convertRegexToNFA(_ regex: String) -> Automaton? {
        
        if regex.isEmpty {
            return nil
        }
        
        let concatedregex = insertConcateOperator(to: regex)
        let postfixRegex = convertToPostfixExp(from: concatedregex)
       
        return convertToNFA(from: postfixRegex)
    }
    
    private func insertConcateOperator(to infixExp: String) -> String {
        
        var output: [Character] = []
        let exps = Array(infixExp)
        
        for i in 0..<infixExp.count {
            
            output.append(exps[i])
            
            if exps[i] == "(" || exps[i] == "|" {
                continue
            }
            
            if i < infixExp.count - 1 {
                
                let lookahead = exps[i + 1]
                
                if lookahead == "*" || lookahead == "?" || lookahead == "+" || lookahead == "|" || lookahead == ")" {
                    continue
                }
                
            }
            
            output.append(".")
            
        }
        
        return String(output)
        
    }
    
    private func convertToPostfixExp(from infixExp: String) -> String {
        
        let operatorPrecedence: [Character: Int] = ["|": 0, ".": 1, "?": 2, "*": 2, "+": 2]
        var output = ""
        var operatorStack: [Character] = []
        
        for ch in infixExp {
            
            if ch == "." || ch == "|" || ch == "*" || ch == "?" || ch == "+" {
                while !operatorStack.isEmpty && operatorStack.last != "(" && operatorPrecedence[operatorStack.last!]! >= operatorPrecedence[ch]! {
                    output.append(operatorStack.popLast()!)
                }
                operatorStack.append(ch)
            } else if ch == "(" || ch == ")" {
                if ch == "(" {
                    operatorStack.append(ch)
                } else {
                    while let lastOperator = operatorStack.last, lastOperator != "(" {
                        output.append(operatorStack.popLast()!)
                    }
                    
                    _ = operatorStack.popLast()
                }
            } else {
                output.append(ch)
            }
            
        }
        
        return output
    }
    
    private func convertToNFA(from postfixExp: String) -> Automaton? {
        var stack: [Automaton] = []
        
        for ch in postfixExp {
            
            if ch == "*" {
                
                guard let ma = stack.popLast() else {
                    return nil
                }
                
                stack.append(ma.closure())
                
            } else if ch == "|" {
                
                guard let right = stack.popLast(), let left = stack.popLast() else {
                    return nil
                }
                
                stack.append(left.union(right))
                
            } else if ch == "." {
                
                guard let right = stack.popLast(), let left = stack.popLast() else {
                    return nil
                }
                
                stack.append(left.concat(right))
                
            } else {
                stack.append(Automaton(symbol: ch))
            }
            
        }
        
        return stack.first
    }
    
}

extension VFLScanner {
    
    public func nextToken() -> Token? {
        
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
