//
//  LeftAlignedCollectionViewFlowLayout.swift
//  NestedCollectionViewWithTexture
//
//  Created by seongjong_kim on 04/07/2019.
//  Copyright © 2019 seongjong_kim. All rights reserved.
//

import UIKit

/// based on: https://stackoverflow.com/a/36016798/1560515
/// NSCopying part is modified to resolve warning.

class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let originalAttributes = super.layoutAttributesForElements(in: rect),
            let attributes = NSArray(array: originalAttributes, copyItems: true) as? [UICollectionViewLayoutAttributes]
        else { return nil }

        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        attributes.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }

            layoutAttribute.frame.origin.x = leftMargin

            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            maxY = max(layoutAttribute.frame.maxY , maxY)
        }

        return attributes
    }
}
