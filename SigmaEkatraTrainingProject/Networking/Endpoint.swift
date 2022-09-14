//
//  Endpoint.swift
//  PostCodableRequest
//
//  Created by Sharad Shakya on 24/04/22.
//

import Foundation

/// Protocol for easy construction of URls, ideally an enum will be the one conforming to this protocol.
protocol Endpoint {
    var base:  String { get }
    var path: String { get }
}

extension Endpoint {
    var urlComponents: URLComponents? {
        guard var components = URLComponents(string: base) else { return nil }
        components.path = path
        return components
    }
    var request: URLRequest? {
        guard let url = urlComponents?.url ?? URL(string: "\(self.base)\(self.path)") else { return nil }
        let request = URLRequest(url: url)
        return request
    }

    // POST REQUEST
    func postRequest<T: Encodable>(parameters: T, headers: [HTTPHeader]) -> URLRequest? {
        guard var request = self.request else { return nil }
        request.httpMethod = HTTPMethods.post.rawValue
        do {
            request.httpBody = try JSONEncoder().encode(parameters)
        } catch let error {
            print(APIError.postParametersEncodingFalure(description: "\(error)").customDescription)
            return nil
        }
        headers.forEach { request.addValue($0.header.value, forHTTPHeaderField: $0.header.field) }
        return request
    }
    // PATCH REQUEST
    func putRequest<T: Encodable>(parameters: T, headers: [HTTPHeader]) -> URLRequest? {
        guard var request = self.request else { return nil }
        request.httpMethod = HTTPMethods.put.rawValue
        do {
            request.httpBody = try JSONEncoder().encode(parameters)
        } catch let error {
            print(APIError.patchParametersEncodingFalure(description: "\(error)").customDescription)
            return nil
        }
        headers.forEach { request.addValue($0.header.value, forHTTPHeaderField: $0.header.field) }
        return request
    }
    func getRequest<T: Encodable>(parameters: T, headers: [HTTPHeader]) -> URLRequest? {
        guard var request = self.request else { return nil }
        request.httpMethod = HTTPMethods.get.rawValue
            do {
               // request.httpBody = try JSONEncoder().encode(parameters)
        } catch let error {
            print(APIError.patchParametersEncodingFalure(description: "\(error)").customDescription)
            return nil
        }
        headers.forEach { request.addValue($0.header.value, forHTTPHeaderField: $0.header.field) }
        return request
    }
    func patchRequest<T: Encodable>(parameters: T, headers: [HTTPHeader]) -> URLRequest? {
        guard var request = self.request else { return nil }
        request.httpMethod = HTTPMethods.patch.rawValue
        do {
            request.httpBody = try JSONEncoder().encode(parameters)
        } catch let error {
            print(APIError.patchParametersEncodingFalure(description: "\(error)").customDescription)
            return nil
        }
        headers.forEach { request.addValue($0.header.value, forHTTPHeaderField: $0.header.field) }
        return request
    }
}
