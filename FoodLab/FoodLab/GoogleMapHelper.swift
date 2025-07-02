//
//  GoogleMapHelper.swift
//  FoodLab
//
//  Created by user272495 on 7/1/25.
//

import GoogleMaps

class GoogleMapHelper  {
    
    
    static let shared = GoogleMapHelper()
    private init () {
        // TODO: API KEY

        GMSServices.provideAPIKey("YOUR API KEY")
    }
}

