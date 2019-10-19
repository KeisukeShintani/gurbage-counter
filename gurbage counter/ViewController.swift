import UIKit

class ViewController: UIViewController {
    var number : Int = 0
    @IBOutlet var label : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the vi
        number = Int(arc4random_uniform(10))
        label.text = String (number)
    }
    
    @IBAction func plus(){
        number = number + 1
        label.text = String(number)
        
        
    }
    
}
