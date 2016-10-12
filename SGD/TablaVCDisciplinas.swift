//
//  TablaVCDisciplinas.swift
//  SGD
//
//  Created by Leidy Carvajal on 12/10/16.
//  Copyright © 2016 lejoca. All rights reserved.
//

import Foundation
import UIKit
import Charts


class TablaVCDisciplinas: UIViewController, UITableViewDataSource, UITableViewDelegate, ModeloBDProtocol {

    var feedItems: NSArray = NSArray()
    var objDisciplinaData: DisciplinasDatos = DisciplinasDatos()
    @IBOutlet weak var lisTableView: UITableView!
   

    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.lisTableView.delegate = self
        self.lisTableView.dataSource = self
        
        let modeloBd = ModeloBdDisciplinas()
        modeloBd.delegate = self
        modeloBd.downloadItems()
    }
    
  
    
    func itemsDownloaded(items: NSArray){
        
        feedItems = items
        self.lisTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier: String = "BasicCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!
        let item: DisciplinasDatos = feedItems[indexPath.row] as! DisciplinasDatos
        myCell.textLabel!.text = "\(item.disciplina!) = \(item.cantidad!)"
        
        return myCell
    }
   
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = colorCeldas(indexPath.row)
    }
    
    func colorCeldas(index: Int) -> UIColor{
        let itemCount = feedItems.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 210/255, green: color, blue: 127/255, alpha:1)
    }

}