//
//  RNumRoomsTableViewController.swift
//  myHouse
//
//  Created by Valera Petin on 02.04.17.
//  Copyright © 2017 Valery Petin. All rights reserved.
//

import UIKit

class RNumRoomsTableViewController: UITableViewController {

    var numbers:[String] = [
        "1",
        "2",
        "3",
        "4",
        "5+"]
    
    var selectedNumber:String? {
        didSet {
            if let number = selectedNumber {
                selectedNumberIndex = numbers.index(of: number)
            }
        }
    }
    var selectedNumberIndex:Int?
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    //хранение имени и индекса выбраной ячейки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RNumberCell", for: indexPath)
        cell.textLabel?.text = numbers[indexPath.row]
        
        //выбор элемента (галочка)
        if indexPath.row == selectedNumberIndex {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    //выбор строки
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Если выбрана другая строчка - нужно отменить выбор
        if let index = selectedNumberIndex {
            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
            cell?.accessoryType = .none
        }
        
        selectedNumber = numbers[indexPath.row]
        
        //обновить выбор для нужной строки
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RSaveSelectedNumber" {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: cell)
                if let index = indexPath?.row {
                    selectedNumber = numbers[index]
                }
            }
        }
    }
    
}
