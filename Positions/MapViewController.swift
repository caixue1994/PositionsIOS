
import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController ,MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var map: MKMapView!
    
    let locationManager=CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate=self
        
        self.locationManager.desiredAccuracy=kCLLocationAccuracyBest
        
        self.locationManager.requestAlwaysAuthorization() //lorsque l'app est en background, on recupere pas la position
        
        self.locationManager.startUpdatingLocation()
        
        self.map.showsUserLocation = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        //localisation courante de l'utilisateur
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))//permet de choisir une region ou on zoom, plus les chiffres sont petits, plus le zoom est grand
        
        self.map.setRegion(region, animated: true)
      
        //dit a la map de zoomer sur cette region
        
        self.locationManager.stopUpdatingLocation()
        
    
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Errors: " + error.localizedDescription)
    }
    
}
