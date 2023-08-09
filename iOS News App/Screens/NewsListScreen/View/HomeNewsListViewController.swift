//
//  HomeNewsListViewController.swift
//  iOS News App
//
//  Created by Rizwan Nasar on 08/08/23.
//

import UIKit

enum NewsTimeLinePeriod: Int {
    case today = 1
    case weekly = 7
    case monthly = 30
}

class HomeNewsListViewController: UIViewController {

    @IBOutlet private (set) weak var newsListTable: UITableView!
    @IBOutlet private (set) weak var segmentController: UISegmentedControl!
    
    lazy var viewModel: NewsListViewModel = {
        NewsListViewModel()
    }()

    var period: NewsTimeLinePeriod = .weekly {
        didSet {
            getNewsListApi(ofPeriod: period)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeController()
    }

    func initializeController() {
        getNewsListApi(ofPeriod: .weekly)
        didReceiveRemoteResponse()
        newsListTable.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
    }
    
    func didReceiveRemoteResponse() {
        viewModel.tableViewReloadClosure = { [weak self] in
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                ActivityIndicator(strongSelf.view, startAnimate: false)
                strongSelf.newsListTable.reloadData()
            }
        }
        viewModel.apiErrorClosure = { [weak self] error in
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                ActivityIndicator(strongSelf.view, startAnimate: false)
                strongSelf.showAlert(withTitle: ConstantUIStrings.errorTitle, withMessage: ConstantUIStrings.defaultErrorDesc)
            }
        }
    }
    
    @IBAction func periodChanged(_ sender: UISegmentedControl) {
        debugPrint(sender.selectedSegmentIndex)
        switch sender.selectedSegmentIndex {
        case 0:
            period = .today
        case 1:
            period = .weekly
        case 2:
            period = .monthly
        default: return
        }
    }
    
}

//MARK: TableView Delegate
extension HomeNewsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "NewsDetailsScreenVC") as? NewsDetailsScreenVC else { return }
        detailVC.newsDetailModel = viewModel.getCellData(of: indexPath)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//MARK: TableView Data Source
extension HomeNewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.rowsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let newsCell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        newsCell.loadCellView(newsData: viewModel.getCellData(of: indexPath))
        return newsCell
    }


}

//MARK: Network Call
private extension HomeNewsListViewController {
    func getNewsListApi(ofPeriod: NewsTimeLinePeriod) {
        ActivityIndicator(self.view)
        viewModel.getNewsList(of: ofPeriod)
    }
}
