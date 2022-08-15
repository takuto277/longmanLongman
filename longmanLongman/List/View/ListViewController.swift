//
//  ListViewController.swift
//  longmanLongman
//
//  Created by 小野拓人 on 2022/08/11.
//

import UIKit
import RealmSwift

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var realm = try? Realm()
    var wordInfoArray = try? Realm().objects(WordInfo.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        tableView.rowHeight = 50
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailWordViewController: DetailWordViewController = segue.destination as! DetailWordViewController
        
        let indexPath = self.tableView.indexPathForSelectedRow
        detailWordViewController.wordInfo = wordInfoArray?[indexPath!.row]
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for:  indexPath) as! ListTableViewCell
        let word = wordInfoArray?[indexPath.row]
        cell.label.text = word?.word
        switch word?.imageNumber {
        case 1:
            cell.listImage?.image = UIImage(named: "listIcon2")
            cell.label.textColor = .white
        case 2:
            cell.listImage?.image = UIImage(named: "listIcon3")
            cell.label.textColor = .white
        case 3:
            cell.listImage?.image = UIImage(named: "listIcon4")
            cell.label.textColor = .white
        case 4:
            cell.listImage?.image = UIImage(named: "listIcon5")
            cell.label.textColor = .red
        default:
            cell.listImage?.image = UIImage(named: "listIcon1")
            cell.label.textColor = .white
        }
    
    
    return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordInfoArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "cellSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let realm = realm else { return }
        if editingStyle == .delete {
            
            try! realm.write {
                self.realm?.delete(self.wordInfoArray![indexPath.row])
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
}
