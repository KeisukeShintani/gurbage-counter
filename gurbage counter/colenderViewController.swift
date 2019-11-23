//
//  colenderViewController.swift
//  gurbage counter
//
//  Created by 新谷啓介 on 2019/11/16.
//  Copyright © 2019 新谷啓介. All rights reserved.
//

import UIKit

class colenderViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var label: UILabel!
    
    
    let now = Date()
    var cal = Calendar.current
    let dateFormatter = DateFormatter()
    var components = DateComponents()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cal.locale = Locale(identifier: "ja")
        
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateFormat = "yyyy年M月"
        components.year = cal.component(.year, from: now)
        components.month = cal.component(.month,from: now)
        components.day = 1
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        calculation()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func calculation(){
        let firstDayOfMonth = cal.date(from:components)
        label.text = dateFormatter.string(from: firstDayOfMonth!)
    }
    func collectionView(_ collectionview: UICollectionView, cellForItemAt indexPath: IndexPath)->UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let firstDayOfMonth = cal.date(from:components )
        let firstWeekday = cal.component(.weekday, from: firstDayOfMonth!)
        
        let weekdayAdding = 2 - firstWeekday
        for subview in cell.contentView.subviews{
            subview.removeFromSuperview()
        }
        let daysCountInMonth = cal.range(of: .day, in: .month, for: firstDayOfMonth!)?.count
        
        
        
        if (indexPath.row + weekdayAdding) >= 1 && (indexPath.row + weekdayAdding) <= daysCountInMonth! {
            cell.backgroundColor = UIColor(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1 )
            let label = UILabel()
            label.font = UIFont(name: "Arial", size:17)
            label.text = "\(indexPath.row + weekdayAdding)"
            label.sizeToFit()
            label.center = cell.contentView.center
            cell.contentView.addSubview(label)

        }
        else{
            cell.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.8)
        }
        return cell

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return 37
      }
      

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "daily", sender: nil)
    }
   
}
