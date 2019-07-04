//
//  NestedItemCellNode.swift
//  NestedCollectionViewWithTexture
//
//  Created by seongjong_kim on 04/07/2019.
//  Copyright © 2019 seongjong_kim. All rights reserved.
//

import AsyncDisplayKit

final class NestedItemCellNode: ASCellNode {
    let textNode = ASTextNode()

    override init() {
        super.init()
        automaticallyManagesSubnodes = true

        backgroundColor = .blue
        borderWidth = 2.0
        borderColor = UIColor.white.cgColor
        cornerRadius = 20.0
    }

    override func didLoad() {
        super.didLoad()
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let textInsetLayoutSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
                                                    child: textNode)
        return textInsetLayoutSpec
    }

    override func layout() {
        super.layout()
    }
}
