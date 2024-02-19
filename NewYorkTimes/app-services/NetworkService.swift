//
//  NetworkService.swift
//  NewYorkTimes
//
//  Created by Patricio Calderon on 18/02/24.
//

import Foundation
import Alamofire

/*
Utilizes AlamoFire to check for network availability.
isConnectedToInternet should return true in all cases the phone has access (Cellular, No cellular + wifi, Cellular + wifi, wifi)
 */
struct Connectivity {
    
    static let sharedInstance = NetworkReachabilityManager()!
    static var isConnectedToInternet:Bool {
        let connected = self.sharedInstance.isReachable
        return connected
    }
}
