//
//  TablaVCCampeonatos.swift
//  SGD
//
//  Created by Leidy Carvajal on 13/10/16.
//  Copyright © 2016 lejoca. All rights reserved.
//

import Foundation
import UIKit
import Charts


class TablaVCCampeonatos: UIViewController, UITableViewDataSource, UITableViewDelegate, ModeloBdCamp{
    

    @IBOutlet weak var listTableView: UITableView!
    
    var feedItems: NSArray = NSArray()
    var objCampeonatosData: CampeonatosDatos = CampeonatosDatos()
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let modeloBd = ModeloBdCampeonatos()
        modeloBd.delegate = self
        modeloBd.downloadItems()
    }
    
    
    
    func itemsDownloaded(items: NSArray){
        
        feedItems = items
        self.listTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier: String = "celda"
        let myCell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!
        let item: CampeonatosDatos = feedItems[indexPath.row] as! CampeonatosDatos
        myCell.textLabel!.text = "\(item.tipo!) = \(item.cantidadTipo!)"
        
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
    