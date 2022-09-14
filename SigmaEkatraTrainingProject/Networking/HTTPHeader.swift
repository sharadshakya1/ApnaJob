//
//  HTTPHeader.swift
//  PostCodableRequest
//
//  Created by Sharad Shakya on 24/04/22.
//

import Foundation

enum HTTPHeader {
    case contentType(String)
    case accept(String)
    case token(String)
    case authorization(String)
    case deviceid(String)
    var header: (field: String, value: String) {
        switch self {
        case .contentType(let value): return (field: "Content-Type", value: value)
        case .token(let value): return (field: "token", value: value)
        case .accept(let value): return (field: "Accept", value: value)
        case .authorization(let value): return (field: "authorization", value: value)
        case .deviceid(let value) : return (field: "deviceid", value: value)
        }
    }
}
