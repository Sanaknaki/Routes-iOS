//
//  Station.swift
//  OCRoutes
//
//  Created by Brandon Danis on 2018-01-30.
//  Copyright © 2018 RoutesInc. All rights reserved.
//

import Foundation
import MapKit

class BusStopAnnotation : NSObject, MKAnnotation {
    
    var station: BusStop?
    var title: String?
    var subtitle: String?
    var latitude: Double
    var longitude: Double
    
    init(latitude lat: Double, longitude lon: Double) {
        self.latitude = lat
        self.longitude = lon
    }
    
    convenience init(latitude lat: Double, longitude lon: Double, title: String, subtitle: String) {
        self.init(latitude: lat, longitude: lon)
        self.title = title
        self.subtitle = subtitle
    }
    
    convenience init(station: BusStop) {
        self.init(latitude: station.stopLat, longitude: station.stopLong, title: station.stopName, subtitle: station.stopId)
        self.station = station
    }
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
}
