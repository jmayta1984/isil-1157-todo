//
//  ViewController.swift
//  ToDo
//
//  Created by user213116 on 9/28/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "Enter new task", message: nil, preferredStyle:.alert)
        
        alertController.addTextField()
        
        let add = UIAlertAction(title: "Add", style: .default){_ in
            guard let textField = alertController.textFields?[0] else {
                return
            }
            guard let task  = textField.text else {
                return
            }
            self.tasks.append(task)
            self.tableView.reloadData()
        }
        alertController.addAction(add)
        present(alertController, animated: true)
        
    }
    var tasks = ["Estudiar", "Ir a clases"]
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

