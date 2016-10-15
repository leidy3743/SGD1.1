//
//  ScatterChartVCCampeonatos.swift
//  SGD
//
//  Created by Leidy Carvajal on 13/10/16.
//  Copyright © 2016 lejoca. All rights reserved.
//

import Foundation
import Foundation
import UIKit
import Charts

class ScatterChartVCCampeonatos: UIViewController, ChartViewDelegate, ModeloBdCamp {
    @IBOutlet weak var scatterChartView: ScatterChartView!
    
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
        
        var cantidadTipo = [Double] ()
        
        for i in 0 ..< feedItems.count{
            tipo.append(feedItems[i].tipo!)
            cantidadTipo.append(Double(feedItems[i].cantidadTipo!))
        }
        
        setChartBubble(tipo, values: cantidadTipo)
        
    }
    
    //funcion para crear el grafico
    func setChartBubble(dataPoints: [String], values: [Double]) {
        
        scatterChartView.noDataText = "You need to provide data for the chart."
        
        
        /*El inicializador BarChartDataEntry toma el valor de cada entrada de datos, el índice de la entrada del valor corresponde  y una etiqueta opcional*/
        
        var dataEntries: [BubbleChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BubbleChartDataEntry(xIndex: i, value: values[i], size: CGFloat(values[i]*100))
            dataEntries.append(dataEntry)
        }
        
        
        let chartData1 = ScatterChartDataSet(yVals: dataEntries, label: "Campeonatos")
        let chartDataSet: [ScatterChartDataSet] = [chartData1]
        let chartData = ScatterChartData(xVals: dataPoints, dataSets: chartDataSet)
        
        chartData1.colors = [UIColor(red: 153/255, green: 153/255, blue: 255/255, alpha: 1)]
        
        
        scatterChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)
        scatterChartView.data = chartData
        
    }
   

}