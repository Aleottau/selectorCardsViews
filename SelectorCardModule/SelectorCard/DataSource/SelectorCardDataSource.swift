//
//  SelectCardDataSource.swift
//  SelectorCardModule
//
//  Created by alejandro on 5/02/23.
//

import Foundation
import UIKit

protocol SelectorCardDataSourceProtocol {
    var dataSource: SelectorCardDataSource.DiffDataSource { get }
    func applySnapshot(animatingDiff: Bool)
}
class SelectorCardDataSource {
    private var cards: [ProductsModel] = []
    private var collectionView: UICollectionView
    typealias DiffDataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>
    lazy var dataSource: SelectorCardDataSource.DiffDataSource = makeDataSource()
    
    init(collectionView: UICollectionView, cards: [ProductsModel]) {
        self.collectionView = collectionView
        self.cards = cards
        registerCell(collection: collectionView, identifier: CardsViewCell.identifier)
        registerCell(collection: collectionView, identifier: DescriptionCardViewCell.identifier)
    }
    
    private func registerCell(collection: UICollectionView, identifier: String) {
        let nib = UINib(nibName: identifier, bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: identifier )
    }
    func configCell(cell: UICollectionViewCell) {
        cell.clipsToBounds = true
    }
    
    private func makeDataSource() -> DiffDataSource {
        let dataSource = DiffDataSource(collectionView: collectionView) { [weak self] collectionView, indexPath, itemIdentifier in
            switch indexPath.section {
            case 0:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardsViewCell.identifier, for: indexPath) as? CardsViewCell,  let productModel = self?.modelFrom(indexPath: indexPath, itenmIdentifier: itemIdentifier) as? ProductsModel else {
                    print("cell card not find")
                    return UICollectionViewCell()
                }
                cell.setModel(productData: productModel)
                return cell
            case 1:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DescriptionCardViewCell.identifier, for: indexPath) as? DescriptionCardViewCell else  {
                    print("cell description not find")
                    return UICollectionViewCell()
                }
                guard let description = self?.modelFrom(indexPath: indexPath, itenmIdentifier: itemIdentifier) as? String else {
                    return UICollectionViewCell()
                }
                cell.setModel(description: description)
                return cell
            default:
                return UICollectionViewCell()
            }
        }
        return dataSource
    }
    func modelFrom(indexPath: IndexPath, itenmIdentifier: AnyHashable) -> AnyHashable? {
        switch itenmIdentifier {
        case let id as Int:
            let productModel = cards.first { $0.id == id }
            return productModel
        case let description as String:
            let descriptionTitles = cards.first { $0.description == description }
            return descriptionTitles?.description
        default:
            return nil
        }
//        guard let id = itenmIdentifier as? Int,
//            let productModdel = cards.first(where: { $0.id == id }) else {
//            return nil
//        }
//        return productModdel
    }
}
extension SelectorCardDataSource: SelectorCardDataSourceProtocol {
    func applySnapshot(animatingDiff: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections([.scrollCard,.descriptionCard])
//        let ids: [AnyHashable] = cards.map { $0.id }
        snapshot.appendItems(cards.map({ $0.id }), toSection: .scrollCard)
        snapshot.appendItems(cards.map({ $0.description }), toSection: .descriptionCard)
        dataSource.apply(snapshot, animatingDifferences: animatingDiff)
    }
}
