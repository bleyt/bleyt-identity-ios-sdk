//
//  ApplicationDetailsUseCase.swift
//  BleytIdentity
//
//  Created by Ribads on 6/20/21.
//

import Foundation

protocol ApplicationDetailsUseCase {
    
    func fetchApplicationData(completion: @escaping CompletionHandler<ApplicationRequest>)
    
    func getMobileKey() -> String
    
}

class ApplicationDetailsUseCaseImpl : ApplicationDetailsUseCase {
    
    private var mobileKey: String
    
    init(mobileKey: String) {
        self.mobileKey = mobileKey
    }
    
    func getMobileKey() -> String {
        return self.mobileKey
    }
    
    func fetchApplicationData(completion: @escaping CompletionHandler<ApplicationRequest>) {
        NetworkManager.shared.getApplicationRequest(mobileKey: self.mobileKey) { details in
            if let details = details {
                completion(details, nil)
            } else {
                //Create an error object and return the result
                completion(nil, nil)
            }
        }
    }
    
}
