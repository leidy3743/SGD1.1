//
//  TablaVCPersonalApoyo.swift
//  SGD
//
//  Created by Leidy Carvajal on 14/10/16.
//  Copyright © 2016 lejoca. All rights reserved.
//

import Foundation
import UIKit
import Charts


class TablaVCPersonalApoyo: UIViewController, UITableViewDataSource, UITableViewDelegate, ModeloBdPA {
    
    @IBOutlet weak var listTableView: UITableView!
    var feedItems: NSArray = NSArray()
    var objProgramaApoyo: ProgramaApoyoDatos = ProgramaApoyoDatos()
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let modeloBd = ModeloBdProgramaApoyo()
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
        let item: ProgramaApoyoDatos = feedItems[indexPath.row] as! ProgramaApoyoDatos
        myCell.textLabel!.text = "\(item.esBeneficiario!) = \(item.cantidadUso!)"
        
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