//
//  ViewController.swift
//  tableView3
//
//  Created by admin on 12/11/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var nameArray = [String]()
    var cname : UITextField?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cellStruct", for: indexPath) as! SimpleTableViewCell
        
        cell.textLabelThing.text = nameArray[indexPath.row]
        
        cell.deleteLabelThing.addTarget(self, action: #selector(deleteButtonTapped(_ :)), for: .touchUpInside)
        
        
        cell.editLabelThing.addTarget(self, action: #selector(editButtonTapped(_ :)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    
    @objc func editButtonTapped(_ sender: UIButton){
        let point = sender.convert(CGPoint.zero, to: myTableView)
        guard let indexPath = myTableView.indexPathForRow(at: point) else {
            return
        }
        
        let selected_things = nameArray[indexPath.row]
        
        
        let dialog = UIAlertController(title: "Edit Things", message: "Editing the names", preferredStyle: UIAlertController.Style.alert)
        
        let update = UIAlertAction(title: "upadte", style: UIAlertAction.Style.default) { (action) in
            let update_name = self.cname?.text!
            self.nameArray[indexPath.row] = update_name!
            DispatchQueue.main.async {
                self.myTableView.reloadData()
                print("Data has been updated in table view")
            }
        }
        
        let cancel = UIAlertAction(title: "cancel", style: UIAlertAction.Style.cancel) { (action) in
            print("edit opeation canceled")
            
        }
        
        dialog.addAction(update)
        dialog.addAction(cancel)
        dialog.addTextField { (textfield) in
            self.cname = textfield
            self.cname?.placeholder = "update this"
            self.cname?.text = selected_things
        }
        
        self.present(dialog, animated: true, completion: nil)
    }
    
    
    @IBAction func addActions(_ sender: UIButton) {
        nameArray.insert("New Name", at: 0)
        
        let indexPath:IndexPath = IndexPath(row:(self.nameArray.count - 1), section:0)
        
        myTableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.left)
        
    }
    
    
    
    @objc func deleteButtonTapped(_ sender: UIButton){
        let point = sender.convert(CGPoint.zero, to: myTableView)
        guard let indexPath = myTableView.indexPathForRow(at: point)else {
            return
        }
        
        nameArray.remove(at: indexPath.row)
        myTableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.right)
    }
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        myTableView.register(UINib(nibName: "SimpleTableViewCell", bundle: nil), forCellReuseIdentifier: "cellStruct")
        myTableView.dataSource = self
        myTableView.delegate = self
        
    }


}

