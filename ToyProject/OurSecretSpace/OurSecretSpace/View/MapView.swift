//
//  FirstViewController.swift
//  OurSecretSpace
//
//  Created by Ick on 2020/09/02.
//  Copyright © 2020 ick. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn
import FirebaseFirestore
import MapKit

class MapView: UIViewController,CLLocationManagerDelegate {

    @IBOutlet var ourMap: MKMapView!
    
    let locationManager = CLLocationManager()
    var db: Firestore!
    var partnerLocationData = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings

        self.db = Firestore.firestore()
        self.setLocationManager()
        // Do any additional setup after loading the view.
        self.uploadMyLocation()
        

        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        DispatchQueue.main.async {
            self.getPartnerLocation()
        }

        
        if let myLocation = self.locationManager.location?.coordinate {
            let spanValue = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let pRegion = MKCoordinateRegion(center: myLocation, span: spanValue)
            ourMap.setRegion(pRegion, animated: true)
        }
        

        
    }
    
    func setLocationManager(){
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        ourMap.showsUserLocation = true
    }
    
    func uploadMyLocation(){
        
   
        guard let user = Auth.auth().currentUser else { fatalError() }
        self.db.collection("LocationData").document("\(user.uid)").setData(["Location": [self.locationManager.location?.coordinate.latitude, self.locationManager.location?.coordinate.longitude]]){
            err in
            if let err = err {
                print(err)
            } else {
                print("success")
            }
        }
//        ref = db.collection("LocationData").addDocument(data: ["\(user.uid)": [self.locationManager.location?.coordinate.latitude, self.locationManager.location?.coordinate.longitude]]) {
//            err in
//            if let err = err {
//                print(err)
//            } else {
//                print("Document added with ID: \(ref!.documentID)")
//            }
//        }
    }
    func getPartnerLocation(){
        guard let user = Auth.auth().currentUser else { fatalError() }
        db.collection("LocationData").getDocuments { (querySnapshot, err) in
            if let err = err {
                print(err)
            } else {
                for document in querySnapshot!.documents{
                    if document.documentID != user.uid {
                        if let temp = document.data()["Location"] as? [Double]{
                            print(temp)
                            self.partnerLocationData.append(temp[0])
                            self.partnerLocationData.append(temp[1])
                            self.setPartnerAnnotation(latitudeValue: self.partnerLocationData[0], longitudeValue: self.partnerLocationData[1], title: "Test", subtitle: "TESTTEST")
                            self.partnerLocationData = []
                            
                        }
                    }
                }
            }
        }
        
    }
    
    func setPartnerAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, title strTitle: String, subtitle strSubTitle: String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitudeValue, longitude: longitudeValue)
        annotation.title = strTitle
        annotation.subtitle = strSubTitle
        ourMap.addAnnotation(annotation)
    }
    
    @IBAction func touchUpRefreshBtn(_ sender: UIButton) {
        self.uploadMyLocation()
        self.getPartnerLocation()
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
