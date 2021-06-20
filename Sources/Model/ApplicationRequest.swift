//
//  ApplicationRequest.swift
//  BleytIdentity
//
//  Created by Ribads on 6/12/21.
//

import Foundation

struct ApplicationRequest : Decodable {
    var applicationName: String?
    var requests: Array<ActivityRequestResponse>?
}

struct ActivityRequestResponse : Decodable {
    var id: String
    var title: String?
    var image: String?
    var description: String?
    var data: Array<String>?
}
