//
//  GroceryMapView.swift
//  SnapNutri
//

import SwiftUI
import MapKit

// MARK: - Jaya Grocer location model
struct JayaLocation: Identifiable {
    let id = UUID()
    let name: String
    let rating: String
    let distance: String
    let coordinate: CLLocationCoordinate2D
}

struct GroceryMapView: View {
    // Current location (hardcoded fallback, same as MapView)
    @State private var location = CLLocationCoordinate2D(latitude: 3.078290, longitude: 101.510020)

    // Fake permission popup
    @State private var showLocationAlert = true

    // Which store the user tapped (nil = none)
    @State private var selectedStore: JayaLocation? = nil

    // Triggers navigation to the store detail page
    @State private var goToStoreDetail = false

    // 5 mock Jaya Grocer spots near Shah Alam
    let stores = [
        JayaLocation(name: "Jaya Grocer - CityWalk i-City", rating: "4.3", distance: "1.2 km", coordinate: CLLocationCoordinate2D(latitude: 3.0722, longitude: 101.4999)),
        JayaLocation(name: "Jaya Grocer - Eco Ardence", rating: "4.1", distance: "3.5 km", coordinate: CLLocationCoordinate2D(latitude: 3.0555, longitude: 101.5200)),
        JayaLocation(name: "Jaya Grocer - Plaza Shah Alam", rating: "3.9", distance: "4.8 km", coordinate: CLLocationCoordinate2D(latitude: 3.0850, longitude: 101.5320)),
        JayaLocation(name: "Jaya Grocer - Setia City Mall", rating: "4.5", distance: "6.1 km", coordinate: CLLocationCoordinate2D(latitude: 3.1010, longitude: 101.4560)),
        JayaLocation(name: "Jaya Grocer - Elmina", rating: "4.2", distance: "7.4 km", coordinate: CLLocationCoordinate2D(latitude: 3.1600, longitude: 101.5000))
    ]

    var body: some View {
        ZStack(alignment: .bottom) {
            // Map with a pin for each store
            Map {
                // Your location marker
                Marker("My Location", coordinate: location)
                    .tint(.blue)

                // Store pins
                ForEach(stores) { store in
                    Annotation(store.name, coordinate: store.coordinate) {
                        Button {
                            selectedStore = store
                        } label: {
                            Image(systemName: "cart.circle.fill")
                                .font(.title)
                                .foregroundStyle(.green)
                                .background(Color.white.clipShape(Circle()))
                        }
                    }
                }
            }
            .ignoresSafeArea(edges: .top)

            // Store detail card slides up when a pin is tapped
            if let store = selectedStore {
                StorePinCard(store: store, onViewStore: {
                    goToStoreDetail = true
                }) {
                    selectedStore = nil
                }
                .transition(.move(edge: .bottom))
                .padding()
            }
        }
        .navigationDestination(isPresented: $goToStoreDetail) {
            StoreDetailView()
        }
        .navigationTitle("Jaya Grocer Near Me")
        .navigationBarTitleDisplayMode(.inline)
        .animation(.easeInOut, value: selectedStore?.id)
        // Fake "Allow location" popup
        .alert("Allow \"SnapNutri\" to use your location?", isPresented: $showLocationAlert) {
            Button("Allow While Using App") { }
            Button("Don't Allow", role: .cancel) { }
        } message: {
            Text("Your location is used to show Jaya Grocer stores near you.")
        }
    }
}

// MARK: - Pin detail card
struct StorePinCard: View {
    let store: JayaLocation
    let onViewStore: () -> Void
    let onClose: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image("jayagrocer")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 25)
                    .padding(10)
                    .background(.white, in: RoundedRectangle(cornerRadius: 20))
                Text(store.name)
                    .font(.headline)
                Spacer()
                Button(action: onClose) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.gray)
                }
            }

            HStack(spacing: 6) {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                    .font(.caption)
                Text("\(store.rating) · \(store.distance) away")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }

            // Button → go to grocery item page
            Button {
                onViewStore()
            } label: {
                Text("View Store")
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("hijausecond"), in: RoundedRectangle(cornerRadius: 20))
            }
        }
        .padding()
        .background(.white, in: RoundedRectangle(cornerRadius: 20))
        .contentShape(Rectangle())
        .shadow(radius: 10)
    }
}

#Preview {
    NavigationStack {
        GroceryMapView()
    }
}
