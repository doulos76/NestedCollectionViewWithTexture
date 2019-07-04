//
//  RootCellNode.swift
//  NestedCollectionViewWithTexture
//
//  Created by seongjong_kim on 04/07/2019.
//  Copyright © 2019 seongjong_kim. All rights reserved.
//

import AsyncDisplayKit
import RxCocoa_Texture

final class RootCellNode: ASCellNode {
    let textNode = ASTextNode()

    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .orange
    }

    override func didLoad() {
        super.didLoad()
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let textInsetLayoutSpec = ASInsetLayoutSpec(insets: UIEdgeInsets.zero,
                                                    child: textNode)

        let horizontalStackLayoutSpec = ASStackLayoutSpec(direction: .horizontal,
                                                 spacing: 0,
                                                 justifyContent: .center,
                                                 alignItems: .center,
                                                 children: [textInsetLayoutSpec])
        horizontalStackLayoutSpec.style.width = ASDimension(unit: .points, value: constrainedSize.max.width)

        let rowLayoutSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 30, left: 12, bottom: 30, right: 12),
                                              child: horizontalStackLayoutSpec)

        return rowLayoutSpec
    }

    override func layout() {
        super.layout()
    }
}
