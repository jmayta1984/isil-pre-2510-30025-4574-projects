//
//  MapView.swift
//  FoodLab
//
//  Created by user272495 on 7/1/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        Map {
            Marker(coordinate: CLLocationCoordinate2D(latitude: -12.1253808, longitude: -77.0248005) ) {
                Text("ISIL")
            }
        }
    }
}

#Preview {
    MapView()
}
