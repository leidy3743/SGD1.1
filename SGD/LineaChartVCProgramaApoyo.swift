//
//  LineaChartVCProgramaApoyo.swift
//  SGD
//
//  Created by Leidy Carvajal on 14/10/16.
//  Copyright © 2016 lejoca. All rights reserved.
//

import Foundation
import UIKit
import Charts


class LineaChartVCProgramaApoyo: UIViewController, ChartViewDelegate, ModeloBdPA{


    @IBOutlet weak var lineChartView: LineChartView!
    var feedItems: NSArray = NSArray()
    var objCampeonatosData: ProgramaApoyoDatos = ProgramaApoyoDatos()
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        
        let modeloBd = ModeloBdProgramaApoyo()
        modeloBd.delegate = self
        modeloBd.downloadItems()
    }
    
    var esBeneficiario = [String] ()
    
    func itemsDownloaded(items: NSArray){
        
        let feedItems: [ProgramaApoyoDatos] = items as! [ProgramaApoyoDatos]
        print(feedItems)
        var cantidadUso = [Double] ()
        
        
        for i in 0 ..< feedItems.count{
            esBeneficiario.append(feedItems[i].esBeneficiario!)
            cantidadUso.append(Double(feedItems[i].cantidadUso!))
        }
        
        setChart(esBeneficiario, values: cantidadUso)
        
    }
    
    func setChart(dataPoints: [String], values: [Double]){
        
        lineChartView.noDataText = "You need to provide data for the chart."
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "Beneficiarios Programa de Apoyo")
        let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
        lineChartView.data = lineChartData
    }
}
