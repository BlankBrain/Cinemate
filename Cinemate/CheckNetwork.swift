//
//  CheckNetwork.swift
//  Cinemate
//
//  Created by Md. Mehedi Hasan on 25/4/20.
//  Copyright © 2020 Md. Mehedi Hasan. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    static func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
