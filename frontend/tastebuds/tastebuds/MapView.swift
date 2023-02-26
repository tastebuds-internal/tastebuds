//
//  MapView.swift
//  tastebuds
//
//  Created by Griffin Tarpenning on 2/25/23.
//

import SwiftUI
import MapKit


struct MapView: View {
    @State private var region = MKCoordinateRegion(
        // TODO: get user coords
        center: CLLocationCoordinate2D(latitude: 37.772, longitude: -122.44),
        span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
    )

    var body: some View {
        Map(coordinateRegion: $region).ignoresSafeArea(edges: .top)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
