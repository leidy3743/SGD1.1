//
//  LineaChartVCCampeonatos.swift
//  SGD
//
//  Created by Leidy Carvajal on 13/10/16.
//  Copyright © 2016 lejoca. All rights reserved.
//

import Foundation
import UIKit
import Charts


class LineaChartVCCampeonatos: UIViewController, ChartViewDelegate, ModeloBdCamp {

    @IBOutlet weak var lineChartView: LineChartView!
    
    var feedItems: NSArray = NSArray()
    var objCampeonatosData: CampeonatosDatos = CampeonatosDatos()
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        
        let modeloBd = ModeloBdCampeonatos()
        modeloBd.delegate = self
        modeloBd.downloadItems()
    }
    
    var tipo = [String] ()
    
    func itemsDownloaded(items: NSArray){
        
        let feedItems: [CampeonatosDatos] = items as! [CampeonatosDatos]
        print(feedItems)
        var cantidadTipo = [Double] ()
        
        
        for i in 0 ..< feedItems.count{
            tipo.append(feedItems[i].tipo!)
            cantidadTipo.append(Double(feedItems[i].cantidadTipo!))
        }
        
        setChart(tipo, values: cantidadTipo)
        
    }
    
    func setChart(dataPoints: [String], values: [Double]){
        
        lineChartView.noDataText = "You need to provide data for the chart."
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "Campeonatos")
        let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
        lineChartView.data = lineChartData
    }
}