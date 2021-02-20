//
//  Token.swift
//  VFLInterpreter
//
//  Created by ChenBin on 2021/1/11.
//

import Foundation

enum TokenType: String {
    case orientation
    case superview
    case identifier
    case connection
    
    case leftParen
    case rightParen
    case leftBrace
    case rightBrace
    
    case number
    
    case equal
    case greater
    case less
    case equalEqual
    case greaterEqual
    case lessEqual
}

struct Token {
    let type: TokenType
    let lexeme: String
}

extension Token: CustomStringConvertible {
    var description: String {
        return "\(type) \(lexeme)"
    }
}
