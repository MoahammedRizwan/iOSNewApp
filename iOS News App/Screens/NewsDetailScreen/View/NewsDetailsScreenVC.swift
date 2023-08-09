//
//  NewsDetailsScreenVC.swift
//  iOS News App
//
//  Created by Rizwan Nasar on 08/08/23.
//

import UIKit

class NewsDetailsScreenVC: UIViewController {
    @IBOutlet private (set) weak var thumbnailImage: UIImageView!
    @IBOutlet private (set) weak var headLineLabel: UILabel!
    @IBOutlet private (set) weak var descriptionNewsLabel: UILabel!
    @IBOutlet private (set) weak var postDateLabel: UILabel!

    var newsDetailModel: NewsDataModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        self.title = (newsDetailModel?.source?.rawValue ?? "") + ", " + (newsDetailModel?.section ?? "")
        headLineLabel.text = newsDetailModel?.title ?? ""
        descriptionNewsLabel.text = newsDetailModel?.adxKeywords ?? ""
        postDateLabel.text = newsDetailModel?.publishedDate ?? ""
        thumbnailImage.setImage(with: newsDetailModel?.media?.first?.mediaMetadata?.last?.url)
    }

}

