//
//  BarChartVCNacionalidades.swift
//  SGD
//
//  Created by Leidy Carvajal on 12/10/16.
//  Copyright © 2016 lejoca. All rights reserved.
//

import Foundation
import UIKit
import Charts


class BarChartVCNacionalidades: UIViewController, ChartViewDelegate, ModeloBDPNac {
    
    
 
    @IBOutlet weak var barChartView: HorizontalBarChartView!
    //@IBOutlet weak var barChartView: BarChartView!

    var feedItems: NSArray = NSArray()
    var objNacionalidadData: NacionalidadesDatos = NacionalidadesDatos()
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        
        let modeloBd = ModeloBdNacionalidades()
        modeloBd.delegate = self
        modeloBd.downloadItems()
    }
    
    var nacionalidad = [String] ()
    
    
    func itemsDownloaded(items: NSArray){
        
        let feedItems: [NacionalidadesDatos] = items as! [NacionalidadesDatos]
        
        var cantidad = [Double] ()
        
        for i in 0 ..< feedItems.count{
            nacionalidad.append(feedItems[i].nacionalidad!)
            cantidad.append(Double(feedItems[i].cantidad!))
        }
        
        setChartBar(nacionalidad, values: cantidad)
        
    }
    
    func setChartBar(dataPoints: [String], values: [Double]){
        
        barChartView.noDataText = "You need to provide data for the chart."
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let barchartDataSet = BarChartDataSet(yVals: dataEntries, label: "Nacionalidades")
        let barchartData = BarChartData(xVals: nacionalidad, dataSet: barchartDataSet)
        barchartDataSet.colors = ChartColorTemplates.joyful()
        
        
        barChartView.xAxis.labelPosition = .Bottom
        barChartView.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)
        barChartView.data = barchartData
    }
}