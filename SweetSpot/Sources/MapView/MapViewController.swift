//
//  MapViewController.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/19/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation
import UIKit
import MapKit

protocol MapViewPresentable: Presentable {
}

class MapViewController: UIViewController, MapViewPresentable {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mapView: MKMapView!
    
    var viewModel: MapViewModel?

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        layoutView()
        setupLocation()
    }
    
    // MARK: - Private

    private func layoutView() {
        searchBar.barTintColor = Color.Flat.Green.marianas
    }
    
    private func setupLocation() {
//        viewModel?.verifyPermissions { [weak self] result in
//            switch result {
//            case .success(let value):
//                if value == true {
                    viewModel?.requestLocationUpdates()
                    viewModel?.requestLocation { [weak self] result in
                        switch result {
                        case .success(let location):
                            self?.centerMap(on: location)
                        case .failure(_):
                            let userAlert = UserAlert(title: String.locationCouldNotBeFoundAlertTitle, msg: String.locationCouldNotBeFoundAlertMsg, actions: nil, style: .alert, completion: nil)
                            self?.display(alert: userAlert)
                        }
                    }
//                } else {
//                    self?.alertUserPermissions()
//                }
//            case .failure(_):
//                self?.alertUserPermissions()
//            }
//        }
    }
    
    private func centerMap(on location: Locatable) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: viewModel?.regionRadius ?? 1000, longitudinalMeters: viewModel?.regionRadius ?? 1000)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    private func alertUserPermissions() {
        let okayAction = UIAlertAction(title: String.okay, style: .default, handler: nil)
        let settingsAction = UIAlertAction(title: String.goToSettings, style: .default, handler: { _ in
            UIApplication.openAppSettings()
        })
        
        let userAlert = UserAlert(title: String.locationServicesNotEnabledAlertTitle, msg: String.locationServicesNotEnabledAlertMsg, actions: [okayAction, settingsAction], style: .alert, completion: nil)
        
        self.display(alert: userAlert)
    }
}
