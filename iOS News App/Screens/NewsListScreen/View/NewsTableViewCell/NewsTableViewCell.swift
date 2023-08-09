//
//  NewsTableViewCell.swift
//  iOS News App
//
//  Created by Rizwan Nasar on 08/08/23.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    //MARK: IBOutlet and Constants
    @IBOutlet private (set) weak var thumbnailImage: UIImageView!
    @IBOutlet private (set) weak var headLineLabel: UILabel!
    @IBOutlet private (set) weak var descriptionNewsLabel: UILabel!
    @IBOutlet private (set) weak var postDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func loadCellView(newsData: NewsDataModel) {
        headLineLabel.text = newsData.title
        descriptionNewsLabel.text = newsData.adxKeywords
        postDateLabel.text = newsData.publishedDate
        thumbnailImage.setImage(with: newsData.media?.first?.mediaMetadata?.last?.url)
    }
}
