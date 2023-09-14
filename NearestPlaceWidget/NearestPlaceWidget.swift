//
//  NearestPlace.swift
//  NearestPlace
//
//  Created by Zdenko Čepan on 07/09/2023.
//

import WidgetKit
import SwiftUI
import Intents


struct Place {
    let name: String
    let location: CLLocation
}

struct NearestPlaceProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> NearestPlaceEntry {
        NearestPlaceEntry(date: Date(), name: "Loading...")
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (NearestPlaceEntry) -> ()) {
        let entry = NearestPlaceEntry(date: Date(), name: "Loading...")
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<NearestPlaceEntry>) -> ()) {
        // Fetch the user's location
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        
        if let userLocation = locationManager.location {
            // Calculate the nearest object based on user's location
            let nearestPlace = calculateNearestPlace(userLocation: userLocation)
            
            // Create a timeline entry with the nearest object's name
            let entry = NearestPlaceEntry(date: Date(), name: nearestPlace.name)
            
            // Set a refresh policy (e.g., refresh every 15 minutes)
            let policy = TimelineReloadPolicy.after(Date().addingTimeInterval(60 * 15))
            
            // Provide the entry and policy to the widget
            let timeline = Timeline(entries: [entry], policy: policy)
            completion(timeline)
        } else {
            // Handle the case where user location is not available
            let entry = NearestPlaceEntry(date: Date(), name: "Location unavailable")
            let timeline = Timeline(entries: [entry], policy: .atEnd)
            completion(timeline)
        }
    }
    
    func calculateNearestPlace(userLocation: CLLocation) -> Place {
            // Replace this with your logic to find the nearest object
            // Here, we'll assume you have a list of objects and calculate the nearest one
            let places = [
                Place(name: "Object A", location: CLLocation(latitude: 37.7749, longitude: -122.4194)),
                Place(name: "Object B", location: CLLocation(latitude: 37.7746, longitude: -122.4192))
            ]

            var nearestPlace = places.first!
            var shortestDistance = userLocation.distance(from: nearestPlace.location)

            for place in places {
                let distance = userLocation.distance(from: place.location)
                if distance < shortestDistance {
                    nearestPlace = place
                    shortestDistance = distance
                }
            }

            return nearestPlace
        }
}

struct NearestPlaceEntry: TimelineEntry {
    let date: Date
    let name: String
}

struct NearestPlaceEntryView : View {
    var entry: NearestPlaceProvider.Entry

    var body: some View {
        VStack {
            Text("Nearest Object:")
                .font(.headline)
            Text(entry.name)
                .font(.title)
        } // VSTACK
    }
}

struct NearestPlaceWidget: Widget {
    let kind: String = "NearestPlace"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: NearestPlaceProvider()) { entry in
            NearestPlaceEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct NearestPlace_Previews: PreviewProvider {
    static var previews: some View {
        NearestPlaceEntryView(entry: NearestPlaceEntry(date: Date(), name: "Socha"))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
