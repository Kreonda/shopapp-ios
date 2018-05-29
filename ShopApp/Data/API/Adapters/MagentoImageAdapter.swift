//
//  MagentoImageAdapter.swift
//  ShopApp
//
//  Created by Radyslav Krechet on 5/2/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import ShopApp_Gateway

struct MagentoImageAdapter {
    private static let imagePathNoSelection = "no_selection"
    private static let mediaTypeImage = "image"
    
    static func adapt(_ imagePath: String, catalogPath: String) -> Image? {
        guard imagePath != imagePathNoSelection, let src = buildSrc(with: BaseRouter.hostUrl, catalogPath: catalogPath, imagePath: imagePath) else {
            return nil
        }
        
        let image = Image()
        image.id = src
        image.src = src
        
        return image
    }
    
    static func adapt(_ response: GalleryEntryResponse, catalogPath: String) -> Image? {
        guard response.mediaType == mediaTypeImage, let src = buildSrc(with: BaseRouter.hostUrl, catalogPath: catalogPath, imagePath: response.file) else {
            return nil
        }
        
        let image = Image()
        image.id = String(response.id)
        image.src = src
        image.imageDescription = response.label
        
        return image
    }
    
    static func buildSrc(with hostUrl: String?, catalogPath: String, imagePath: String) -> String? {
        guard let hostUrl = hostUrl else {
            return nil
        }
        
        return hostUrl + catalogPath + imagePath
    }
}
