//
//  HomeStep2TableViewCell.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 29/04/22.
//

import UIKit
class HomeStep2TableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak private(set) var collectionView: UICollectionView!
    @IBOutlet weak private(set) var allFilterButton: UIButton!
    var name : [SearchName] = []
    //= [SearchName(searchname: StringConstant.executiveBpo.rawValue),SearchName(searchname: StringConstant.callCenterOperator.rawValue),SearchName(searchname: StringConstant.foodDelivery.rawValue),SearchName(searchname: StringConstant.constructionLabour.rawValue)] {
    {
        didSet {
            self.collectionView.reloadData()
        }
    }
    var del : sendClickAction?
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        collectionView.delegate = self
        collectionView .dataSource = self
        collectionView.reloadData()
        CommonProperties.commonProperties.buttonProperties(button: allFilterButton)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
}
    @objc func deleteButton(sender :UIButton) {
        _ = IndexPath(row: sender.tag, section: 0)
        _ = UIStoryboard(name: StringConstant.main.rawValue, bundle: nil)
        self.name.remove(at: (sender).tag)
        self.collectionView.reloadData()
        client.job() { result in
          switch result {
          case .success(let create):
              print("job  dta  is ...\(String(describing: create))")
              getData.data = create?.data
              print("data",getData.data)
              update?()
          //    print("hello",getData.data?[0].jobName)
          case .failure(let error):
              print("The error \(error)")
          }
      }
}
    // MARK: - Register NIb
    func setup() {
        let nib = UINib(nibName: StringConstant.homeCollectionViewCell.rawValue, bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: StringConstant.homeCollectionViewCell.rawValue)
    }
    @IBAction private func allFiterPresent(_ sender: UIButton) {
        del?.sendActionFilter()
    }
}
// MARK: - CollectionView Delegate , DataSource Methods
extension HomeStep2TableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StringConstant.homeCollectionViewCell.rawValue, for: indexPath) as? HomeCollectionViewCell else {return UICollectionViewCell()
        }
        cell.setup(name[indexPath.row])
        cell.deleteOutlet.tag = indexPath.row
        cell.deleteOutlet.addTarget(self, action: #selector(deleteButton), for: .touchUpInside )
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = name[indexPath.row].searchname.count * 10
        return CGSize(width: 20 + CGFloat(width) , height: collectionView.frame.height)
    }
}

protocol sendClickAction {
    func sendActionFilter()
}
