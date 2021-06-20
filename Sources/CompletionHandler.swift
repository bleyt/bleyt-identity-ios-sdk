//
//  CompletionHandler.swift
//  BleytIdentity
//
//  Created by Ribads on 6/20/21.
//

import Foundation

typealias CompletionHandler<T> = (_ result: T?, _ error: Error?) -> Void
