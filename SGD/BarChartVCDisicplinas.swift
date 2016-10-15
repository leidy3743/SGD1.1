//
//  BarChartVCDisicplinas.swift
//  SGD
//
//  Created by Leidy Carvajal on 12/10/16.
//  Copyright © 2016 lejoca. All rights reserved.
//

import Foundation
import UIKit
import Charts


class BarChartVCDisciplinas: UIViewController, ChartViewDelegate, ModeloBDProtocol {
    
    

    @IBOutlet weak var barChartView: BarChartView!
    var feedItems: NSArray = NSArray()
    var objDisciplinaData: DisciplinasDatos = DisciplinasDatos()
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        
        //self.barChartView.delegate = self
        let modeloBd = ModeloBdDisciplinas()
        modeloBd.delegate = self
        modeloBd.downloadItems()
    }
    
    var disciplina = [String] ()
    
    
    func itemsDownloaded(items: NSArray){
        
        let feedItems: [DisciplinasDatos] = items as! [DisciplinasDatos]
        
        var cantidad = [Double] ()
        
        for i in 0 ..< feedItems.count{
            disciplina.append(feedItems[i].disciplina!)
            cantidad.append(Double(feedItems[i].cantidad!))
        }
        
        setChartBar(disciplina, values: cantidad)
        
    }
    
    func setChartBar(dataPoints: [String], values: [Double]){
        
        barChartView.noDataText = "You need to provide data for the chart."
        //barChartView.noDataTextDescription = "GIVE REASON"
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let barchartDataSet = BarChartDataSet(yVals: dataEntries, label: "Disciplinas Deportivas")
        let barchartData = BarChartData(xVals: disciplina, dataSet: barchartDataSet)
        barchartDataSet.colors = ChartColorTemplates.joyful()
        
        
        barChartView.xAxis.labelPosition = .Bottom
        barChartView.xAxis.labelFont = UIFont.init(name: "AvenirNext-Regular", size: 12)!
        barChartView.descriptionText = ""
        barChartView.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)
        barChartView.rightAxis.enabled = false
        barChartView.leftAxis.labelFont = UIFont.init(name: "Helvetica", size: 12)!
        barChartView.data = barchartData
    }
    
    func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: ChartHighlight) {
        
        
    }
}