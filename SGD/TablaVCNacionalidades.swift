//
//  TablaVCNacionalidades.swift
//  SGD
//
//  Created by Leidy Carvajal on 12/10/16.
//  Copyright © 2016 lejoca. All rights reserved.
//

import Foundation
import Foundation
import UIKit
import Charts


class TablaVCNacionalidades: UIViewController, UITableViewDataSource, UITableViewDelegate, ModeloBDPNac{
    
    @IBOutlet weak var lisTableView: UITableView!
    var feedItems: NSArray = NSArray()
    var objNacionalidadData: NacionalidadesDatos = NacionalidadesDatos()
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.lisTableView.delegate = self
        self.lisTableView.dataSource = self
        
        let modeloBd = ModeloBdNacionalidades()
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
        let item: NacionalidadesDatos = feedItems[indexPath.row] as! NacionalidadesDatos
        myCell.textLabel!.text = "\(item.nacionalidad!) = \(item.cantidad!)"
        
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