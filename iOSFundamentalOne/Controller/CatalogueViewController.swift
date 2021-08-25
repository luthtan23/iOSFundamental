//
//  CatalogueViewController.swift
//  iOSFundamentalOne
//
//  Created by iei19100007 on 23/08/21.
//

import UIKit

class CatalogueViewController: UIViewController {
    
    @IBOutlet var catalogueTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        setupView()
    }
    
    private func setupView() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.title = "Catalogue"
        
        catalogueTableView = UITableView(frame: self.view.bounds)
        catalogueTableView.register(UINib(nibName: "CatalogueTableViewCell", bundle: nil), forCellReuseIdentifier: "catalogueCell")
        catalogueTableView.delegate = self
        catalogueTableView.dataSource = self
        catalogueTableView.separatorStyle = .none
        
        self.view.addSubview(catalogueTableView)
    }

}

extension CatalogueViewController: UITableViewDelegate {
    
}

extension CatalogueViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catalogueCell", for: indexPath) as? CatalogueTableViewCell
        return cell!
    }
    
    
}
