//
//  Result.swift
//  PostCodableRequest
//  Created by Sharad Shakya on 24/04/22.

import Foundation
enum Result<T, U> where U: Error {
    case success(T)
    case failure(U)
}
