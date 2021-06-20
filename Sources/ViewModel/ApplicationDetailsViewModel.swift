//
//  ApplicationDetailsViewModel.swift
//  BleytIdentity
//
//  Created by Ribads on 6/20/21.
//

import Foundation
import Combine

class ApplicationDetailsViewModel : ObservableObject {
    
    @Published private (set) var request: ApplicationRequest? = nil
    @Published private (set) var error: Error? = nil

    private var useCase: ApplicationDetailsUseCase
    
    init(useCase: ApplicationDetailsUseCase) {
        self.useCase = useCase
    }
    
    func fetchApplicationRequest() {
        self.useCase.fetchApplicationData { [unowned self] request, error in
            if let request = request {
                self.request = request
            } else {
                self.error = error
            }
        }
    }
    
    func getMobileKey() -> String {
        return self.useCase.getMobileKey()
    }
    
}
