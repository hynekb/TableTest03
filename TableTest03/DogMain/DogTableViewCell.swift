//
//  DogTableViewCell.swift
//  TableTest03
//
//  Created by Hynek Broulik on 2020-04-16.
//  Copyright © 2020 Hynek Broulik. All rights reserved.
//

import UIKit

class DogTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
      // MARK: - IBOutlets
      @IBOutlet weak var nameLabel: UILabel!
      @IBOutlet weak var numberLabel: UILabel!
      @IBOutlet weak var dogImageView: UIImageView!
      
      // MARK: - Properties
      var dog: Dog? {
        didSet {
          guard let dog = dog else { return }
          
            nameLabel.text = dog.name
            numberLabel.text = dog.number
          dogImageView.image = getImage()
        }
      }

      // MARK: - Support Methods
      private func getImage() -> UIImage? {
        let imageName = "leaf"
        return UIImage(named: imageName)
      }

}
