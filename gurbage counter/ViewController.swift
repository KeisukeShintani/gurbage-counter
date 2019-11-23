import UIKit

class ViewController: UIViewController{
    
    var petbottlenumber: Int = 0
    var papernumber: Int = 0
    var plasticnumber: Int = 0
    var gominumber: Int = 0
    
    @IBOutlet weak var petbottlebutton: UIButton!
    @IBOutlet var petbottlelabel: UILabel!
    @IBOutlet var paperlabel: UILabel!
    @IBOutlet var plasticlabel: UILabel!
    @IBOutlet var gomilabel: UILabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        petbottlebutton.layer.cornerRadius = 10.0
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func petbottleplus(){
        petbottlenumber = petbottlenumber + 1
        petbottlelabel.text = "ペットボトルの数は\(petbottlenumber)です。"
    gominumber = gominumber + 30
        gomilabel.text = "ゴミの総重量は\(gominumber)"
    }
    
    @IBAction func paperplus(){
        papernumber = papernumber + 1
        paperlabel.text = "紙の数は\(papernumber)です"
        gominumber = gominumber + 5
        gomilabel.text = "ゴミの総重量は\(gominumber)"
    }
    
    @IBAction func plasticplus(){
        plasticnumber = plasticnumber + 1
        plasticlabel.text = "プラスチックの数は\(plasticnumber)です"
        gominumber = gominumber + 20
        gomilabel.text = "ゴミの総重量は\(gominumber)"
    }
    
}
