//
//  SummonerProvider.swift
//  LoL Spell Tracker
//
//  Created by Bartłomiej Łaski on 11/06/2019.
//  Copyright © 2019 Bartłomiej Łaski. All rights reserved.
//

import Moya

public enum SummonerProvider {
    case getSummoner(String)
}

extension SummonerProvider: TargetType {
    public var baseURL: URL {
        return URL(string: "https://eun1.api.riotgames.com")!
    }

    public var path: String {
        switch self {
        case .getSummoner(let summonerName):
            return "/lol/summoner/v4/summoners/by-name/\(summonerName)"
        }
    }

    public var method: Method {
        switch self {
        case .getSummoner:
            return .get
        }
    }

    public var sampleData: Data {
        switch self {
        case .getSummoner:
            return "".utf8Encoded
        }
    }

    public var task: Task {
        switch self {
        case .getSummoner:
            return .requestPlain
        }
    }

    public var headers: [String : String]? {
        return [ "Origin": "https://developer.riotgames.com",
                 "Accept-Charset": "application/x-www-form-urlencoded; charset=UTF-8",
                 "X-Riot-Token": "RGAPI-0199d4ba-1203-4fb8-ba50-c78fd4d38adc"
        ]
    }
}

