//
//  PieChartVCDisciplinas.swift
//  SGD
//
//  Created by Leidy Carvajal on 12/10/16.
//  Copyright © 2016 lejoca. All rights reserved.
//

import Foundation
import UIKit
import Charts


class PieChartsVCDisciplinas: UIViewController, ChartViewDelegate, ModeloBDProtocol {
    
    

    @IBOutlet weak var pieChartView: PieChartView!
    var feedItems: NSArray = NSArray()
    var objDisciplinaData: DisciplinasDatos = DisciplinasDatos()
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        
        //self.pieChartView.delegate = self
        let modeloBd = ModeloBdDisciplinas()
        modeloBd.delegate = self
        modeloBd.downloadItems()
    }
    
    var disciplina = [String] ()
    
    
    func itemsDownloaded(items: NSArray){
        
        let feedItems: [DisciplinasDatos] = items as! [DisciplinasDatos]
        print(feedItems)
        
        var cantidad = [Double] ()
        
        for i in 0 ..< feedItems.count{
            disciplina.append(feedItems[i].disciplina!)
            cantidad.append(Double(feedItems[i].cantidad!))
        }
        
        setChartPie(disciplina, values: cantidad)
        
    }
    
    func setChartPie(dataPoints: [String], values: [Double]){
        
        pieChartView.noDataText = "You need to provide data for the chart."
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let piechartDataSet = PieChartDataSet(yVals: dataEntries, label: "Disciplinas Deportivas")
        let piechartData = PieChartData(xVals: disciplina, dataSet: piechartDataSet)
        piechartDataSet.colors = ChartColorTemplates.joyful()
        pieChartView.data = piechartData
    }
}