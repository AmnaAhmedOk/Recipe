//
//  LocalRecipeWorker.swift
//  Recipes
//
//  Created by Amna on 19/06/2021.
//

import Foundation
class LocalRecipeWorker{
    
    let defaults = UserDefaults.standard
    var latestSearch = [String]()

    func saveLatestSearchWord(searchText:String){
        latestSearch = defaults.array(forKey: LATEST_SEARCH_KEY) as? [String] ?? [String]()
        if latestSearch.count == 10 {latestSearch.remove(at: 0)}
        latestSearch.append(searchText)
        defaults.set(latestSearch, forKey: LATEST_SEARCH_KEY)
    }
    
    func getLatestSearchWord() ->  [String] {
        latestSearch = defaults.array(forKey: LATEST_SEARCH_KEY) as? [String] ?? [String]()
        return latestSearch.reversed()
    }
    
    func getLastSearchWord()->String{
        latestSearch = defaults.array(forKey: LATEST_SEARCH_KEY) as? [String] ?? [String]()
        return latestSearch [0]
    }
    
}
