//
//  BubbleChartVCNacionalidades.swift
//  SGD
//
//  Created by Leidy Carvajal on 12/10/16.
//  Copyright © 2016 lejoca. All rights reserved.
//

import Foundation
import UIKit
import Charts

class BubbleChartVCNacionalidades: UIViewController, ChartViewDelegate, ModeloBDPNac {
    
   
    @IBOutlet weak var bubbleChartView: BubbleChartView!
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
            
            setChartBubble(nacionalidad, values: cantidad)
            
        }
    
    //funcion para crear el grafico
    func setChartBubble(dataPoints: [String], values: [Double]) {
        
        bubbleChartView.noDataText = "You need to provide data for the chart."
        
        
        /*El inicializador BarChartDataEntry toma el valor de cada entrada de datos, el índice de la entrada del valor corresponde  y una etiqueta opcional*/
        
        var dataEntries: [BubbleChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BubbleChartDataEntry(xIndex: i, value: values[i], size: CGFloat(values[i]*100))
            dataEntries.append(dataEntry)
        }
     
        
        let chartData1 = BubbleChartDataSet(yVals: dataEntries, label: "Nacionalidades")
        let chartDataSet: [BubbleChartDataSet] = [chartData1]
        let chartData = BubbleChartData(xVals: nacionalidad, dataSets: chartDataSet)
        
        chartData1.colors = [UIColor(red: 153/255, green: 153/255, blue: 255/255, alpha: 1)]
        

        bubbleChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)
        bubbleChartView.data = chartData
        
    }
}