//
//  NetworkService.swift
//  NewYorkTimes
//
//  Created by Patricio Calderon on 18/02/24.
//

import Foundation
//import SystemConfiguration
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

//class ReachabilityService {
//
//    static let shared = { ReachabilityService() }()
//
//    func isConnectedToInternet() -> Bool {
//        var zeroAddress = sockaddr()
//        zeroAddress.sa_len = UInt8(MemoryLayout<sockaddr>.size)
//        zeroAddress.sa_family = sa_family_t(AF_INET)
//
//        guard let reachability = withUnsafePointer(to: &zeroAddress, {
//            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
//                SCNetworkReachabilityCreateWithAddress(nil, $0)
//            }
//        }) else {
//            return false
//        }
//
//        var flags: SCNetworkReachabilityFlags = []
//        if !SCNetworkReachabilityGetFlags(reachability, &flags) {
//            return false
//        }
//
//        let isReachable = flags.contains(.reachable)
//        let needsConnection = flags.contains(.connectionRequired)
//
//        return (isReachable && !needsConnection)
//    }
//
//}
