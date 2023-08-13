//
//  ViewController.swift
//  PMA
//
//  Created by HadisehSafaei on 5/17/1402 AP.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate ,UICollectionViewDataSource {
    
    
    @IBOutlet weak var imgCurrency: UIImageView!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let refreshCtrl = UIRefreshControl()
    private var allCurrencies: CurrencyModel?
    private var currenciesNameArray: [String]?
    private var currenciesArray: [Double]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupRefreshControl()
        self.setupCollectionView()
        self.fetchRatesData()
    }
    
    @objc func fetchRatesData() {
        
        let url = "https://v6.exchangerate-api.com/v6/03a0e892770f8343e405265e/latest/USD"
        
        ApiService.shared.fetchApiData(urlString: url) { [self] (currencies: CurrencyModel?, error: ErrorModel?) in
            if let error = error {
                
                //self.showAlertMessage(titleStr: "Error", messageStr: "error.Message")
            }
            guard let currencies = currencies , let conversion_rates = currencies.conversion_rates else { return }
            self.allCurrencies = currencies
            self.currenciesNameArray = Array(conversion_rates.keys)
            self.currenciesArray = Array(conversion_rates.values)
            self.imgCurrency.image = UIImage(named: "Currency")
            self.lblTime.text = currencies.time_last_update_utc
            self.collectionView.reloadData()
            self.refreshCtrl.endRefreshing()
        }
    }
    
    func setupRefreshControl() {
        
        if #available(iOS 10.0, *) {
            collectionView.refreshControl = refreshCtrl
        } else {
            collectionView.addSubview(refreshCtrl)
        }
        
        refreshCtrl.addTarget(self, action: #selector(fetchRatesData), for: .valueChanged)
    }
    
    private func setupCollectionView() {
        // self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 20 , bottom: 0, right: 20)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        // self.collectionView.transform = CGAffineTransform(scaleX: -1, y: 1)
        self.collectionView.register(UINib(nibName: "CurrenciesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CurrenciesCollectionViewCell")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let allCurrencies = self.allCurrencies , let model = allCurrencies.conversion_rates else {return 0}
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrenciesCollectionViewCell", for: indexPath) as! CurrenciesCollectionViewCell
        
        guard let allCurrencies = self.allCurrencies , let _ = allCurrencies.conversion_rates , let currenciesName = self.currenciesNameArray  , let currenciesArray = self.currenciesArray else {return cell}
        
        cell.containerView.layer.cornerRadius = 20
        cell.lblCurrency.text = currenciesName[indexPath.row]
        cell.lblAmountCurrency.text = "\(currenciesArray[indexPath.row])"
        
        
        if currenciesName[indexPath.row] == "KYD" {
            cell.lblCountryName.text = Currency.KYD.countryName
            cell.imgCountry.image = UIImage(named: Currency.KYD.flagName)
        }
        else if currenciesName[indexPath.row] == "JPY" {
            cell.lblCountryName.text = Currency.JPY.countryName
            cell.imgCountry.image = UIImage(named: Currency.JPY.flagName)
        }
        else if currenciesName[indexPath.row] == "SOS" {
            cell.lblCountryName.text = Currency.SOS.countryName
            cell.imgCountry.image = UIImage(named: Currency.SOS.flagName)
        }
        else if currenciesName[indexPath.row] == "CAD" {
            cell.lblCountryName.text = Currency.CAD.countryName
            cell.imgCountry.image = UIImage(named: Currency.CAD.flagName)
        }
        else if currenciesName[indexPath.row] == "HN" {
            cell.lblCountryName.text = Currency.HN.countryName
            cell.imgCountry.image = UIImage(named: Currency.HN.flagName)
        }
        else if currenciesName[indexPath.row] == "FJD" {
            cell.lblCountryName.text = Currency.FJD.countryName
            cell.imgCountry.image = UIImage(named: Currency.FJD.flagName)
        }
        else if currenciesName[indexPath.row] == "MZN" {
            cell.lblCountryName.text = Currency.MZN.countryName
            cell.imgCountry.image = UIImage(named: Currency.MZN.flagName)
        }
        else if currenciesName[indexPath.row] == "MDL" {
            cell.lblCountryName.text = Currency.MDL.countryName
            cell.imgCountry.image = UIImage(named: Currency.MDL.flagName)
        }
        else if currenciesName[indexPath.row] == "QAR" {
            cell.lblCountryName.text = Currency.QAR.countryName
            cell.imgCountry.image = UIImage(named: Currency.QAR.flagName)
        }
        else if currenciesName[indexPath.row] == "UGX" {
            cell.lblCountryName.text = Currency.UGX.countryName
            cell.imgCountry.image = UIImage(named: Currency.UGX.flagName)
        }
        else if currenciesName[indexPath.row] == "IRR" {
            cell.lblCountryName.text = Currency.IRR.countryName
            cell.imgCountry.image = UIImage(named: Currency.IRR.flagName)
        }
        else if currenciesName[indexPath.row] == "STN" {
            cell.lblCountryName.text = Currency.STN.countryName
            cell.imgCountry.image = UIImage(named: Currency.STN.flagName)
        }
        else if currenciesName[indexPath.row] == "UAH" {
            cell.lblCountryName.text = Currency.UAH.countryName
            cell.imgCountry.image = UIImage(named: Currency.UAH.flagName)
        }
        else if currenciesName[indexPath.row] == "KRW" {
            cell.lblCountryName.text = Currency.KRW.countryName
            cell.imgCountry.image = UIImage(named: Currency.KRW.flagName)
        }
        else if currenciesName[indexPath.row] == "CDF" {
            cell.lblCountryName.text = Currency.CDF.countryName
            cell.imgCountry.image = UIImage(named: Currency.CDF.flagName)
        }
        else if currenciesName[indexPath.row] == "SYP" {
            cell.lblCountryName.text = Currency.SYP.countryName
            cell.imgCountry.image = UIImage(named: Currency.SYP.flagName)
        }
        else if currenciesName[indexPath.row] == "TVD" {
            cell.lblCountryName.text = Currency.TVD.countryName
            cell.imgCountry.image = UIImage(named: Currency.TVD.flagName)
        }
        else if currenciesName[indexPath.row] == "CHF" {
            cell.lblCountryName.text = Currency.CHF.countryName
            cell.imgCountry.image = UIImage(named: Currency.CHF.flagName)
        }
        else if currenciesName[indexPath.row] == "CUP" {
            cell.lblCountryName.text = Currency.CUP.countryName
            cell.imgCountry.image = UIImage(named: Currency.CUP.flagName)
        }
        else if currenciesName[indexPath.row] == "KID" {
            cell.lblCountryName.text = Currency.KID.countryName
            cell.imgCountry.image = UIImage(named: Currency.KID.flagName)
        }
        else if currenciesName[indexPath.row] == "TZS" {
            cell.lblCountryName.text = Currency.TZS.countryName
            cell.imgCountry.image = UIImage(named: Currency.TZS.flagName)
        }
        else if currenciesName[indexPath.row] == "TOP" {
            cell.lblCountryName.text = Currency.TOP.countryName
            cell.imgCountry.image = UIImage(named: Currency.TOP.flagName)
        }
        else if currenciesName[indexPath.row] == "XPF" {
            cell.lblCountryName.text = Currency.XPF.countryName
            cell.imgCountry.image = UIImage(named: Currency.XPF.flagName)
        }
        else if currenciesName[indexPath.row] == "CLP" {
            cell.lblCountryName.text = Currency.CLP.countryName
            cell.imgCountry.image = UIImage(named: Currency.CLP.flagName)
        }
        else if currenciesName[indexPath.row] == "PGK" {
            cell.lblCountryName.text = Currency.PGK.countryName
            cell.imgCountry.image = UIImage(named: Currency.PGK.flagName)
        }
        else if currenciesName[indexPath.row] == "EUR" {
            cell.lblCountryName.text = Currency.EUR.countryName
            cell.imgCountry.image = UIImage(named: Currency.EUR.flagName)
        }
        else if currenciesName[indexPath.row] == "NIO" {
            cell.lblCountryName.text = Currency.NIO.countryName
            cell.imgCountry.image = UIImage(named: Currency.NIO.flagName)
        }
        else if currenciesName[indexPath.row] == "ANG" {
            cell.lblCountryName.text = Currency.ANG.countryName
            cell.imgCountry.image = UIImage(named: Currency.ANG.flagName)
        }
        else if currenciesName[indexPath.row] == "ERN" {
            cell.lblCountryName.text = Currency.ERN.countryName
            cell.imgCountry.image = UIImage(named: Currency.ERN.flagName)
        }
        else if currenciesName[indexPath.row] == "NGN" {
            cell.lblCountryName.text = Currency.NGN.countryName
            cell.imgCountry.image = UIImage(named: Currency.NGN.flagName)
        }
        else if currenciesName[indexPath.row] == "BMD" {
            cell.lblCountryName.text = Currency.BMD.countryName
            cell.imgCountry.image = UIImage(named: Currency.BMD.flagName)
        }
        else if currenciesName[indexPath.row] == "KES" {
            cell.lblCountryName.text = Currency.KES.countryName
            cell.imgCountry.image = UIImage(named: Currency.KES.flagName)
        }
        else if currenciesName[indexPath.row] == "NAD" {
            cell.lblCountryName.text = Currency.NAD.countryName
            cell.imgCountry.image = UIImage(named: Currency.NAD.flagName)
        }
        else if currenciesName[indexPath.row] == "CRC" {
            cell.lblCountryName.text = Currency.CRC.countryName
            cell.imgCountry.image = UIImage(named: Currency.CRC.flagName)
        }
        else if currenciesName[indexPath.row] == "AWG" {
            cell.lblCountryName.text = Currency.AWG.countryName
            cell.imgCountry.image = UIImage(named: Currency.AWG.flagName)
        }
        else if currenciesName[indexPath.row] == "PYG" {
            cell.lblCountryName.text = Currency.PYG.countryName
            cell.imgCountry.image = UIImage(named: Currency.PYG.flagName)
        }
        else if currenciesName[indexPath.row] == "MMK" {
            cell.lblCountryName.text = Currency.MMK.countryName
            cell.imgCountry.image = UIImage(named: Currency.MMK.flagName)
        }
        else if currenciesName[indexPath.row] == "SRD" {
            cell.lblCountryName.text = Currency.SRD.countryName
            cell.imgCountry.image = UIImage(named: Currency.SRD.flagName)
        }
        else if currenciesName[indexPath.row] == "BGN" {
            cell.lblCountryName.text = Currency.BGN.countryName
            cell.imgCountry.image = UIImage(named: Currency.BGN.flagName)
        }
        else if currenciesName[indexPath.row] == "MWK" {
            cell.lblCountryName.text = Currency.MWK.countryName
            cell.imgCountry.image = UIImage(named: Currency.MWK.flagName)
        }
        else if currenciesName[indexPath.row] == "BYN" {
            cell.lblCountryName.text = Currency.BYN.countryName
            cell.imgCountry.image = UIImage(named: Currency.BYN.flagName)
        }
        else if currenciesName[indexPath.row] == "BZD" {
            cell.lblCountryName.text = Currency.BZD.countryName
            cell.imgCountry.image = UIImage(named: Currency.BZD.flagName)
        }
        else if currenciesName[indexPath.row] == "LKR" {
            cell.lblCountryName.text = Currency.LKR.countryName
            cell.imgCountry.image = UIImage(named: Currency.LKR.flagName)
        }
        else if currenciesName[indexPath.row] == "AZN" {
            cell.lblCountryName.text = Currency.AZN.countryName
            cell.imgCountry.image = UIImage(named: Currency.AZN.flagName)
        }
        else if currenciesName[indexPath.row] == "PHP" {
            cell.lblCountryName.text = Currency.PHP.countryName
            cell.imgCountry.image = UIImage(named: Currency.PHP.flagName)
        }
        else if currenciesName[indexPath.row] == "SDG" {
            cell.lblCountryName.text = Currency.SDG.countryName
            cell.imgCountry.image = UIImage(named: Currency.SDG.flagName)
        }
        else if currenciesName[indexPath.row] == "HUF" {
            cell.lblCountryName.text = Currency.HUF.countryName
            cell.imgCountry.image = UIImage(named: Currency.HUF.flagName)
        }
        else if currenciesName[indexPath.row] == "UZS" {
            cell.lblCountryName.text = Currency.UZS.countryName
            cell.imgCountry.image = UIImage(named: Currency.UZS.flagName)
        }
        else if currenciesName[indexPath.row] == "GIP" {
            cell.lblCountryName.text = Currency.GIP.countryName
            cell.imgCountry.image = UIImage(named: Currency.GIP.flagName)
        }
        else if currenciesName[indexPath.row] == "XCD" {
            cell.lblCountryName.text = Currency.XCD.countryName
            cell.imgCountry.image = UIImage(named: Currency.XCD.flagName)
        }
        else if currenciesName[indexPath.row] == "TJS" {
            cell.lblCountryName.text = Currency.TJS.countryName
            cell.imgCountry.image = UIImage(named: Currency.TJS.flagName)
        }
        else if currenciesName[indexPath.row] == "MYR" {
            cell.lblCountryName.text = Currency.MYR.countryName
            cell.imgCountry.image = UIImage(named: Currency.MYR.flagName)
        }
        else if currenciesName[indexPath.row] == "GMD" {
            cell.lblCountryName.text = Currency.GMD.countryName
            cell.imgCountry.image = UIImage(named: Currency.GMD.flagName)
        }
        else if currenciesName[indexPath.row] == "LAK" {
            cell.lblCountryName.text = Currency.LAK.countryName
            cell.imgCountry.image = UIImage(named: Currency.LAK.flagName)
        }
        else if currenciesName[indexPath.row] == "CZK" {
            cell.lblCountryName.text = Currency.CZK.countryName
            cell.imgCountry.image = UIImage(named: Currency.CZK.flagName)
        }
        else if currenciesName[indexPath.row] == "PKR" {
            cell.lblCountryName.text = Currency.PKR.countryName
            cell.imgCountry.image = UIImage(named: Currency.PKR.flagName)
        }
        else if currenciesName[indexPath.row] == "PAB" {
            cell.lblCountryName.text = Currency.PAB.countryName
            cell.imgCountry.image = UIImage(named: Currency.PAB.flagName)
        }
        else if currenciesName[indexPath.row] == "BAM"{
            cell.lblCountryName.text = Currency.BAM.countryName
            cell.imgCountry.image = UIImage(named: Currency.BAM.flagName)
        }
        else if currenciesName[indexPath.row] == "ISK" {
            cell.lblCountryName.text = Currency.ISK.countryName
            cell.imgCountry.image = UIImage(named: Currency.ISK.flagName)
        }
        else if currenciesName[indexPath.row] == "GHS" {
            cell.lblCountryName.text = Currency.GHS.countryName
            cell.imgCountry.image = UIImage(named: Currency.GHS.flagName)
        }
        else if currenciesName[indexPath.row] == "TTD" {
            cell.lblCountryName.text = Currency.TTD.countryName
            cell.imgCountry.image = UIImage(named: Currency.TTD.flagName)
        }
        else if currenciesName[indexPath.row] == "BND" {
            cell.lblCountryName.text = Currency.BND.countryName
            cell.imgCountry.image = UIImage(named: Currency.BND.flagName)
        }
        else if currenciesName[indexPath.row] == "YER" {
            cell.lblCountryName.text = Currency.YER.countryName
            cell.imgCountry.image = UIImage(named: Currency.YER.flagName)
        }
        else if currenciesName[indexPath.row] == "PLN" {
            cell.lblCountryName.text = Currency.PLN.countryName
            cell.imgCountry.image = UIImage(named: Currency.PLN.flagName)
        }
        else if currenciesName[indexPath.row] == "XOF" {
            cell.lblCountryName.text = Currency.XOF.countryName
            cell.imgCountry.image = UIImage(named: Currency.XOF.flagName)
        }
        else if currenciesName[indexPath.row] == "AFN" {
            cell.lblCountryName.text = Currency.AFN.countryName
            cell.imgCountry.image = UIImage(named: Currency.AFN.flagName)
        }
        else if currenciesName[indexPath.row] == "IMP" {
            cell.lblCountryName.text = Currency.IMP.countryName
            cell.imgCountry.image = UIImage(named: Currency.IMP.flagName)
        }
        else if currenciesName[indexPath.row] == "LSL" {
            cell.lblCountryName.text = Currency.LSL.countryName
            cell.imgCountry.image = UIImage(named: Currency.LSL.flagName)
        }
        else if currenciesName[indexPath.row] == "MRU" {
            cell.lblCountryName.text = Currency.MRU.countryName
            cell.imgCountry.image = UIImage(named: Currency.MRU.flagName)
        }
        else if currenciesName[indexPath.row] == "SHP" {
            cell.lblCountryName.text = Currency.SHP.countryName
            cell.imgCountry.image = UIImage(named: Currency.SHP.flagName)
        }
        else if currenciesName[indexPath.row] == "AED" {
            cell.lblCountryName.text = Currency.AED.countryName
            cell.imgCountry.image = UIImage(named: Currency.AED.flagName)
        }
        else if currenciesName[indexPath.row] == "DJF" {
            cell.lblCountryName.text = Currency.DJF.countryName
            cell.imgCountry.image = UIImage(named: Currency.DJF.flagName)
        }
        else if currenciesName[indexPath.row] == "GNF" {
            cell.lblCountryName.text = Currency.GNF.countryName
            cell.imgCountry.image = UIImage(named: Currency.GNF.flagName)
        }
        else if currenciesName[indexPath.row] == "VND" {
            cell.lblCountryName.text = Currency.VND.countryName
            cell.imgCountry.image = UIImage(named: Currency.VND.flagName)
        }
        else if currenciesName[indexPath.row] == "ILS" {
            cell.lblCountryName.text = Currency.ILS.countryName
            cell.imgCountry.image = UIImage(named: Currency.ILS.flagName)
        }
        else if currenciesName[indexPath.row] == "WST" {
            cell.lblCountryName.text = Currency.WST.countryName
            cell.imgCountry.image = UIImage(named: Currency.WST.flagName)
        }
        else if currenciesName[indexPath.row] == "BDT" {
            cell.lblCountryName.text = Currency.BDT.countryName
            cell.imgCountry.image = UIImage(named: Currency.BDT.flagName)
        }
        else if currenciesName[indexPath.row] == "LBP" {
            cell.lblCountryName.text = Currency.LBP.countryName
            cell.imgCountry.image = UIImage(named: Currency.LBP.flagName)
        }
        else if currenciesName[indexPath.row] == "KMF" {
            cell.lblCountryName.text = Currency.KMF.countryName
            cell.imgCountry.image = UIImage(named: Currency.KMF.flagName)
        }
        else if currenciesName[indexPath.row] == "ZWL" {
            cell.lblCountryName.text = Currency.ZWL.countryName
            cell.imgCountry.image = UIImage(named: Currency.ZWL.flagName)
        }
        else if currenciesName[indexPath.row] == "RSD" {
            cell.lblCountryName.text = Currency.RSD.countryName
            cell.imgCountry.image = UIImage(named: Currency.RSD.flagName)
        }
        else if currenciesName[indexPath.row] == "GTQ" {
            cell.lblCountryName.text = Currency.GTQ.countryName
            cell.imgCountry.image = UIImage(named: Currency.GTQ.flagName)
        }
        else if currenciesName[indexPath.row] == "SZL" {
            cell.lblCountryName.text = Currency.SZL.countryName
            cell.imgCountry.image = UIImage(named: Currency.SZL.flagName)
        }
        else if currenciesName[indexPath.row] == "TWD" {
            cell.lblCountryName.text = Currency.TWD.countryName
            cell.imgCountry.image = UIImage(named: Currency.TWD.flagName)
        }
        else if currenciesName[indexPath.row] == "XAF" {
            cell.lblCountryName.text = Currency.XAF.countryName
            cell.imgCountry.image = UIImage(named: Currency.XAF.flagName)
        }
        else if currenciesName[indexPath.row] == "ZAR" {
            cell.lblCountryName.text = Currency.ZAR.countryName
            cell.imgCountry.image = UIImage(named: Currency.ZAR.flagName)
        }
        else if currenciesName[indexPath.row] == "SCR" {
            cell.lblCountryName.text = Currency.SCR.countryName
            cell.imgCountry.image = UIImage(named: Currency.SCR.flagName)
        }
        else if currenciesName[indexPath.row] == "AUD" {
            cell.lblCountryName.text = Currency.AUD.countryName
            cell.imgCountry.image = UIImage(named: Currency.AUD.flagName)
        }
        else if currenciesName[indexPath.row] == "BTN" {
            cell.lblCountryName.text = Currency.BTN.countryName
            cell.imgCountry.image = UIImage(named: Currency.BTN.flagName)
        }
        else if currenciesName[indexPath.row] == "DOP" {
            cell.lblCountryName.text = Currency.DOP.countryName
            cell.imgCountry.image = UIImage(named: Currency.DOP.flagName)
        }
        else if currenciesName[indexPath.row] == "ETB" {
            cell.lblCountryName.text = Currency.ETB.countryName
            cell.imgCountry.image = UIImage(named: Currency.ETB.flagName)
        }
        else if currenciesName[indexPath.row] == "LRD" {
            cell.lblCountryName.text = Currency.LRD.countryName
            cell.imgCountry.image = UIImage(named: Currency.LRD.flagName)
        }
        else if currenciesName[indexPath.row] == "GEL" {
            cell.lblCountryName.text = Currency.GEL.countryName
            cell.imgCountry.image = UIImage(named: Currency.GEL.flagName)
        }
        else if currenciesName[indexPath.row] == "FOK" {
            cell.lblCountryName.text = Currency.FOK.countryName
            cell.imgCountry.image = UIImage(named: Currency.FOK.flagName)
        }
        else if currenciesName[indexPath.row] == "DKK" {
            cell.lblCountryName.text = Currency.DKK.countryName
            cell.imgCountry.image = UIImage(named: Currency.DKK.flagName)
        }
        else if currenciesName[indexPath.row] == "BBD" {
            cell.lblCountryName.text = Currency.BBD.countryName
            cell.imgCountry.image = UIImage(named: Currency.BBD.flagName)
        }
        else if currenciesName[indexPath.row] == "NPR" {
            cell.lblCountryName.text = Currency.NPR.countryName
            cell.imgCountry.image = UIImage(named: Currency.NPR.flagName)
        }
        else if currenciesName[indexPath.row] == "BOB" {
            cell.lblCountryName.text = Currency.BOB.countryName
            cell.imgCountry.image = UIImage(named: Currency.BOB.flagName)
        }
        else if currenciesName[indexPath.row] == "BHD" {
            cell.lblCountryName.text = Currency.BHD.countryName
            cell.imgCountry.image = UIImage(named: Currency.BHD.flagName)
        }
        else if currenciesName[indexPath.row] == "AOA" {
            cell.lblCountryName.text = Currency.AOA.countryName
            cell.imgCountry.image = UIImage(named: Currency.AOA.flagName)
        }
        else if currenciesName[indexPath.row] == "SSP" {
            cell.lblCountryName.text = Currency.SSP.countryName
            cell.imgCountry.image = UIImage(named: Currency.SSP.flagName)
        }
        else if currenciesName[indexPath.row] == "BIF" {
            cell.lblCountryName.text = Currency.BIF.countryName
            cell.imgCountry.image = UIImage(named: Currency.BIF.flagName)
        }
        else if currenciesName[indexPath.row] == "AMD" {
            cell.lblCountryName.text = Currency.AMD.countryName
            cell.imgCountry.image = UIImage(named: Currency.AMD.flagName)
        }
        else if currenciesName[indexPath.row] == "BWP" {
            cell.lblCountryName.text = Currency.BWP.countryName
            cell.imgCountry.image = UIImage(named: Currency.BWP.flagName)
        }
        else if currenciesName[indexPath.row] == "ALL" {
            cell.lblCountryName.text = Currency.ALL.countryName
            cell.imgCountry.image = UIImage(named: Currency.ALL.flagName)
        }
        else if currenciesName[indexPath.row] == "KHR" {
            cell.lblCountryName.text = Currency.KHR.countryName
            cell.imgCountry.image = UIImage(named: Currency.KHR.flagName)
        }
        else if currenciesName[indexPath.row] == "GGP" {
            cell.lblCountryName.text = Currency.GGP.countryName
            cell.imgCountry.image = UIImage(named: Currency.GGP.flagName)
        }
        else if currenciesName[indexPath.row] == "IDR" {
            cell.lblCountryName.text = Currency.IDR.countryName
            cell.imgCountry.image = UIImage(named: Currency.IDR.flagName)
        }
        else if currenciesName[indexPath.row] == "RON" {
            cell.lblCountryName.text = Currency.RON.countryName
            cell.imgCountry.image = UIImage(named: Currency.RON.flagName)
        }
        else if currenciesName[indexPath.row] == "SAR" {
            cell.lblCountryName.text = Currency.SAR.countryName
            cell.imgCountry.image = UIImage(named: Currency.SAR.flagName)
        }
        else if currenciesName[indexPath.row] == "JOD" {
            cell.lblCountryName.text = Currency.JOD.countryName
            cell.imgCountry.image = UIImage(named: Currency.JOD.flagName)
        }
        else if currenciesName[indexPath.row] == "SGD" {
            cell.lblCountryName.text = Currency.SGD.countryName
            cell.imgCountry.image = UIImage(named: Currency.SGD.flagName)
        }
        else if currenciesName[indexPath.row] == "JEP" {
            cell.lblCountryName.text = Currency.JEP.countryName
            cell.imgCountry.image = UIImage(named: Currency.JEP.flagName)
        }
        else if currenciesName[indexPath.row] == "KZT" {
            cell.lblCountryName.text = Currency.KZT.countryName
            cell.imgCountry.image = UIImage(named: Currency.KZT.flagName)
        }
        else if currenciesName[indexPath.row] == "XDR" {
            cell.lblCountryName.text = Currency.XDR.countryName
            cell.imgCountry.image = UIImage(named: Currency.XDR.flagName)
        }
        else if currenciesName[indexPath.row] == "CNY" {
            cell.lblCountryName.text = Currency.CNY.countryName
            cell.imgCountry.image = UIImage(named: Currency.CNY.flagName)
        }
        else if currenciesName[indexPath.row] == "SBD" {
            cell.lblCountryName.text = Currency.SBD.countryName
            cell.imgCountry.image = UIImage(named: Currency.SBD.flagName)
        }
        else if currenciesName[indexPath.row] == "NZD" {
            cell.lblCountryName.text = Currency.NZD.countryName
            cell.imgCountry.image = UIImage(named: Currency.NZD.flagName)
        }
        else if currenciesName[indexPath.row] == "BRL" {
            cell.lblCountryName.text = Currency.BRL.countryName
            cell.imgCountry.image = UIImage(named: Currency.BRL.flagName)
        }
        else if currenciesName[indexPath.row] == "OMR" {
            cell.lblCountryName.text = Currency.OMR.countryName
            cell.imgCountry.image = UIImage(named: Currency.OMR.flagName)
        }
        else if currenciesName[indexPath.row] == "MOP" {
            cell.lblCountryName.text = Currency.MOP.countryName
            cell.imgCountry.image = UIImage(named: Currency.MOP.flagName)
        }
        else if currenciesName[indexPath.row] == "CVE" {
            cell.lblCountryName.text = Currency.CVE.countryName
            cell.imgCountry.image = UIImage(named: Currency.CVE.flagName)
        }
        else if currenciesName[indexPath.row] == "RUB" {
            cell.lblCountryName.text = Currency.RUB.countryName
            cell.imgCountry.image = UIImage(named: Currency.RUB.flagName)
        }
        else if currenciesName[indexPath.row] == "KWD" {
            cell.lblCountryName.text = Currency.KWD.countryName
            cell.imgCountry.image = UIImage(named: Currency.KWD.flagName)
        }
        else if currenciesName[indexPath.row] == "GBP" {
            cell.lblCountryName.text = Currency.GBP.countryName
            cell.imgCountry.image = UIImage(named: Currency.GBP.flagName)
        }
        else if currenciesName[indexPath.row] == "LYD" {
            cell.lblCountryName.text = Currency.LYD.countryName
            cell.imgCountry.image = UIImage(named: Currency.LYD.flagName)
        }
        else if currenciesName[indexPath.row] == "MKD" {
            cell.lblCountryName.text = Currency.MKD.countryName
            cell.imgCountry.image = UIImage(named: Currency.MKD.flagName)
        }
        else if currenciesName[indexPath.row] == "NOK" {
            cell.lblCountryName.text = Currency.NOK.countryName
            cell.imgCountry.image = UIImage(named: Currency.NOK.flagName)
        }
        else if currenciesName[indexPath.row] == "JMD" {
            cell.lblCountryName.text = Currency.JMD.countryName
            cell.imgCountry.image = UIImage(named: Currency.JMD.flagName)
        }
        else if currenciesName[indexPath.row] == "COP" {
            cell.lblCountryName.text = Currency.COP.countryName
            cell.imgCountry.image = UIImage(named: Currency.COP.flagName)
        }
        else if currenciesName[indexPath.row] == "DZD" {
            cell.lblCountryName.text = Currency.DZD.countryName
            cell.imgCountry.image = UIImage(named: Currency.DZD.flagName)
        }
        else if currenciesName[indexPath.row] == "ARS" {
            cell.lblCountryName.text = Currency.ARS.countryName
            cell.imgCountry.image = UIImage(named: Currency.ARS.flagName)
        }
        else if currenciesName[indexPath.row] == "HRK" {
            cell.lblCountryName.text = Currency.HRK.countryName
            cell.imgCountry.image = UIImage(named: Currency.HRK.flagName)
        }
        else if currenciesName[indexPath.row] == "SEK" {
            cell.lblCountryName.text = Currency.SEK.countryName
            cell.imgCountry.image = UIImage(named: Currency.SEK.flagName)
        }
        else if currenciesName[indexPath.row] == "TND" {
            cell.lblCountryName.text = Currency.TND.countryName
            cell.imgCountry.image = UIImage(named: Currency.TND.flagName)
        }
        else if currenciesName[indexPath.row] == "IQD" {
            cell.lblCountryName.text = Currency.IQD.countryName
            cell.imgCountry.image = UIImage(named: Currency.IQD.flagName)
        }
        else if currenciesName[indexPath.row] == "HKD" {
            cell.lblCountryName.text = Currency.HKD.countryName
            cell.imgCountry.image = UIImage(named: Currency.HKD.flagName)
        }
        else if currenciesName[indexPath.row] == "MVR" {
            cell.lblCountryName.text = Currency.MVR.countryName
            cell.imgCountry.image = UIImage(named: Currency.MVR.flagName)
        }
        else if currenciesName[indexPath.row] == "MAD" {
            cell.lblCountryName.text = Currency.MAD.countryName
            cell.imgCountry.image = UIImage(named: Currency.MAD.flagName)
        }
        else if currenciesName[indexPath.row] == "PEN" {
            cell.lblCountryName.text = Currency.PEN.countryName
            cell.imgCountry.image = UIImage(named: Currency.PEN.flagName)
        }
        else if currenciesName[indexPath.row] == "EGP" {
            cell.lblCountryName.text = Currency.EGP.countryName
            cell.imgCountry.image = UIImage(named: Currency.EGP.flagName)
        }
        else if currenciesName[indexPath.row] == "TMT" {
            cell.lblCountryName.text = Currency.TMT.countryName
            cell.imgCountry.image = UIImage(named: Currency.TMT.flagName)
        }
        else if currenciesName[indexPath.row] == "SLE" {
            cell.lblCountryName.text = Currency.SLE.countryName
            cell.imgCountry.image = UIImage(named: Currency.SLE.flagName)
        }
        else if currenciesName[indexPath.row] == "BSD" {
            cell.lblCountryName.text = Currency.BSD.countryName
            cell.imgCountry.image = UIImage(named: Currency.BSD.flagName)
        }
        else if currenciesName[indexPath.row] == "VUV" {
            cell.lblCountryName.text = Currency.VUV.countryName
            cell.imgCountry.image = UIImage(named: Currency.VUV.flagName)
        }
        else if currenciesName[indexPath.row] == "GYD" {
            cell.lblCountryName.text = Currency.GYD.countryName
            cell.imgCountry.image = UIImage(named: Currency.GYD.flagName)
        }
        
        else if currenciesName[indexPath.row] == "VES" {
            cell.lblCountryName.text = Currency.VES.countryName
            cell.imgCountry.image = UIImage(named: Currency.VES.flagName)
        }
        else if currenciesName[indexPath.row] == "UYU" {
            cell.lblCountryName.text = Currency.UYU.countryName
            cell.imgCountry.image = UIImage(named: Currency.UYU.flagName)
        }
        else if currenciesName[indexPath.row] == "TRY" {
            cell.lblCountryName.text = Currency.TRY.countryName
            cell.imgCountry.image = UIImage(named: Currency.TRY.flagName)
        }
        else if currenciesName[indexPath.row] == "HTG" {
            cell.lblCountryName.text = Currency.HTG.countryName
            cell.imgCountry.image = UIImage(named: Currency.HTG.flagName)
        }
        else if currenciesName[indexPath.row] == "USD" {
            cell.lblCountryName.text = Currency.USD.countryName
            cell.imgCountry.image = UIImage(named: Currency.USD.flagName)
        }
        else if currenciesName[indexPath.row] == "FKP" {
            cell.lblCountryName.text = Currency.FKP.countryName
            cell.imgCountry.image = UIImage(named: Currency.FKP.flagName)
        }
        else if currenciesName[indexPath.row] == "KGS" {
            cell.lblCountryName.text = Currency.KGS.countryName
            cell.imgCountry.image = UIImage(named: Currency.KGS.flagName)
        }
        else if currenciesName[indexPath.row] == "MNT" {
            cell.lblCountryName.text = Currency.MNT.countryName
            cell.imgCountry.image = UIImage(named: Currency.MNT.flagName)
        }
        else if currenciesName[indexPath.row] == "THB" {
            cell.lblCountryName.text = Currency.THB.countryName
            cell.imgCountry.image = UIImage(named: Currency.THB.flagName)
        }
        else if currenciesName[indexPath.row] == "RWF" {
            cell.lblCountryName.text = Currency.RWF.countryName
            cell.imgCountry.image = UIImage(named: Currency.RWF.flagName)
        }
        else if currenciesName[indexPath.row] == "MXN" {
            cell.lblCountryName.text = Currency.THB.countryName
            cell.imgCountry.image = UIImage(named: Currency.THB.flagName)
        }
        else if currenciesName[indexPath.row] == "MGA" {
            cell.lblCountryName.text = Currency.MXN.countryName
            cell.imgCountry.image = UIImage(named: Currency.MXN.flagName)
        }
        else if currenciesName[indexPath.row] == "MUR" {
            cell.lblCountryName.text = Currency.MUR.countryName
            cell.imgCountry.image = UIImage(named: Currency.MUR.flagName)
        }
        else if currenciesName[indexPath.row] == "ZMW" {
            cell.lblCountryName.text = Currency.ZMW.countryName
            cell.imgCountry.image = UIImage(named: Currency.ZMW.flagName)
        }
        else if currenciesName[indexPath.row] == "SLL" {
            cell.lblCountryName.text = Currency.SLL.countryName
            cell.imgCountry.image = UIImage(named: Currency.SLL.flagName)
        }
        else if currenciesName[indexPath.row] == "INR" {
            cell.lblCountryName.text = Currency.INR.countryName
            cell.imgCountry.image = UIImage(named: Currency.INR.flagName)
        }
        else  {
            cell.lblCountryName.text = Currency.INR.countryName
            cell.imgCountry.image = UIImage(named: Currency.INR.flagName)
        }
        
        return cell
    }
}

