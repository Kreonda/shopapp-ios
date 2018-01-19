//
//  GridCollectionDelegate.swift
//  ShopClient
//
//  Created by Evgeniy Antonov on 9/19/17.
//  Copyright © 2017 Evgeniy Antonov. All rights reserved.
//

import UIKit

private let kGridNumberOfColumns: CGFloat = 2
private let kCellImageRatio: CGFloat = 16 / 9

protocol GridCollectionDelegateProtocol: class {
    func didSelectItem(at index: Int)
}

class GridCollectionDelegate: NSObject {
    weak var delegate: GridCollectionDelegateProtocol?
}

// MARK: - UICollectionViewDelegate

extension GridCollectionDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItem(at: indexPath.row)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension GridCollectionDelegate: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return GridCollectionViewCell.cellSize
    }
}