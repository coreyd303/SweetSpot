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
    var didTap: (() -> Void)? { get set }
}

class MapViewController: UIViewController, MapViewPresentable {

    @IBOutlet weak var searchBar: UISearchBar?
    @IBOutlet weak var mapView: MKMapView?
    @IBOutlet weak var filterButton: UIButton?

    var viewModel: MapViewModel?
    var didTap: (() -> Void)?

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        applyDesign()
        setupLocation()
    }

    // MARK: - IB Action
    @IBAction func didTapFilterButton(_ sender: Any) {
        didTap?()
    }

    // MARK: - Private

    private func applyDesign() {
        searchBar?.barTintColor = Color.Flat.Green.marianas
        filterButton?.backgroundColor = Color.Flat.Green.marianas
        filterButton?.titleLabel?.text = String.filterLocations
        filterButton?.tintColor = Color.Flat.Base.white
        
        let b = UIBarButtonItem(title: "+", style: .plain, target: self, action: nil)

        self.navigationController?.navigationItem.leftBarButtonItem = b
        self.navigationController?.navigationItem.title = "TITLE"
    }
    
    private func setupLocation() {
        viewModel?.requestLocation { [weak self] result in
            switch result {
            case .success(let location):
                self?.centerMap(on: location)
            case .failure(_):
                self?.alertUserPermissions()
            }
        }
    }
    
    private func centerMap(on location: Locatable) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: viewModel?.regionRadius ?? 1000, longitudinalMeters: viewModel?.regionRadius ?? 1000)
        mapView?.setRegion(coordinateRegion, animated: true)
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
