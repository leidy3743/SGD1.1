//
//  PieChartVCProgramaApoyo.swift
//  SGD
//
//  Created by Leidy Carvajal on 14/10/16.
//  Copyright © 2016 lejoca. All rights reserved.
//

import Foundation
import UIKit
import Charts


class PieChartVCProgramaApoyo: UIViewController, ChartViewDelegate, ModeloBdPA {


    
    @IBOutlet weak var pieChartView: PieChartView!
    
    var feedItems: NSArray = NSArray()
    var objProgramaApoyo: ProgramaApoyoDatos = ProgramaApoyoDatos()
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        
        //self.pieChartView.delegate = self
        let modeloBd = ModeloBdProgramaApoyo()
        modeloBd.delegate = self
        modeloBd.downloadItems()
    }
    
    var esBeneficiario = [String] ()
    
    
    func itemsDownloaded(items: NSArray){
        
        let feedItems: [ProgramaApoyoDatos] = items as! [ProgramaApoyoDatos]
        
        var cantidadUso = [Double] ()
        
        for i in 0 ..< feedItems.count{
            esBeneficiario.append(feedItems[i].esBeneficiario!)
            cantidadUso.append(Double(feedItems[i].cantidadUso!))
        }
        
        setChartPie(esBeneficiario, values: cantidadUso)
        
    }
    
    func setChartPie(dataPoints: [String], values: [Double]){
        
        pieChartView.noDataText = "You need to provide data for the chart."
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let piechartDataSet = PieChartDataSet(yVals: dataEntries, label: "Beneficiarios Programa de Apoyo")
        let piechartData = PieChartData(xVals: esBeneficiario, dataSet: piechartDataSet)
        piechartDataSet.colors = ChartColorTemplates.joyful()
        pieChartView.data = piechartData
    }
}
