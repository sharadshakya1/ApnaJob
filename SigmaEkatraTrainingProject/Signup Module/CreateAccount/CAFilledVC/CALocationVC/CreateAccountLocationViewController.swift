//
//  CreateAccountLocationViewController.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 11/04/22.
//

import UIKit

//
// protocol LocationPass {
//    func locationpass(location :String)
// }
import CoreLocation
var lat :Double?
var longi: Double?
var disCurLat : Double?
var disCurLong : Double?
var disPerLat : Double?
var disPerLong : Double?
class CreateAccountLocationViewController: UIViewController , CLLocationManagerDelegate {
    // MARK: - IBOUTLETS
    @IBOutlet weak private(set) var areaView: UIView!
    @IBOutlet weak private(set) var locationView: UIView!
 //   var delegate : LocationPass?
    // MARK: - LocationManager
    var locationManager : CLLocationManager!
    @IBOutlet weak private(set) var addresslabel: UILabel!
}
// MARK: - Internal Functions
extension CreateAccountLocationViewController {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userlocation = locations[0] as CLLocation
        let longitude = userlocation.coordinate.longitude
        let latitude = userlocation.coordinate.latitude
        print(latitude,longitude)
        lat = latitude
        longi = longitude
        disCurLat = latitude
        disCurLong = longitude
        disPerLat = latitude
        disPerLong = longitude
        let geocoder  = CLGeocoder()
        geocoder.reverseGeocodeLocation(userlocation) { [self] ( placemarks , error) in
            if error != nil {
                print("error in location")
            }
            let placemark = placemarks! as [CLPlacemark]
            if !placemark.isEmpty {
                let placemark = placemarks![0]
                let locality = placemark.locality ?? ""
                let administrativeArea =  placemark.administrativeArea ?? ""
                let country = placemark.country ?? ""
                print("hello")
                print("\(locality), \(administrativeArea), \(country)")
                self.addresslabel.text = "\(locality), \(administrativeArea), \(country)"

            }
        }
    }
}
// MARK: - IBActions
extension CreateAccountLocationViewController {
    @IBAction  private func backAction(_ sender: UIButton) {
        locationClosure?()
        permanentLocationClosure?()
        presentLocationClosure?()
        self.navigationController?.popViewController(animated: true)
         self.dismiss(animated: true, completion: nil)
         // delegate?.locationpass(location: addresslabel.text!)
     }
    @IBAction  private func locationButton(_ sender: Any) {
         locationManager.desiredAccuracy = kCLLocationAccuracyBest
         locationManager.requestAlwaysAuthorization()
         if CLLocationManager.locationServicesEnabled() {
             print("location enabled")
             locationManager.startUpdatingLocation()

         } else {
             print("location not enabled")
         }
     }
}
// MARK: - LifeCycle Methods
extension CreateAccountLocationViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        locationClosure = { [self] in
            return addresslabel.text!
        }
        permanentLocationClosure = { [self] in
            return addresslabel.text!
        }
        presentLocationClosure = { [self] in
            return addresslabel.text!
        }
        locationManager = CLLocationManager()
        locationManager.delegate = self

        areaView.layer.masksToBounds = true
        areaView.layer.cornerRadius = 10
        areaView.layer.borderColor = UIColor.gray.cgColor
        areaView.layer.borderWidth = 1
        locationView.layer.masksToBounds = true
        locationView.layer.cornerRadius = 10
        locationView.layer.borderColor = UIColor.gray.cgColor
        locationView.layer.borderWidth = 1
    }
}
