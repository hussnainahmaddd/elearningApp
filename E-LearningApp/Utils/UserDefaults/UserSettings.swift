//
//  UserSettings.swift
//  E-LearningApp
//
//  Created by Hussnain Ahmad on 11/09/2024.
//

import Foundation
import Combine
import SwiftUI

class UserSettings: ObservableObject {
    
    @Published var appLaunch: String {
        didSet {
            UserDefaults.standard.set(appLaunch, forKey: "appLaunch")
        }
    }
    
    
    

    init()
    {
        self.appLaunch = UserDefaults.standard.object(forKey: "appLaunch") as? String ?? ""
     

        
    }
}
