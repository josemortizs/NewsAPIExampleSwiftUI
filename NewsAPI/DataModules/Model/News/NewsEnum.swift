//
//  NewsEnum.swift
//  NewsAPI
//
//  Created by Jose Manuel Ortiz Sanchez on 5/2/22.
//

import Foundation

enum NewsError: Error {
    case NO_GET_A_200_RESPONSE
    case FAIL_CONNECTED
    case DESERIALIZING_ERROR
}
