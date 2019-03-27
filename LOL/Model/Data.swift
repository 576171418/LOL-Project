//
//	Data.swift
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Data{

	var forecast : [Forecast]!
	var ganmao : String!
	var pm10 : Float!
	var pm25 : Float!
	var quality : String!
	var shidu : String!
	var wendu : String!
	var yesterday : Forecast!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		forecast = [Forecast]()
		if let forecastArray = dictionary["forecast"] as? [NSDictionary]{
			for dic in forecastArray{
				let value = Forecast(fromDictionary: dic)
				forecast.append(value)
			}
		}
		ganmao = dictionary["ganmao"] as? String
		pm10 = dictionary["pm10"] as? Float
		pm25 = dictionary["pm25"] as? Float
		quality = dictionary["quality"] as? String
		shidu = dictionary["shidu"] as? String
		wendu = dictionary["wendu"] as? String
		if let yesterdayData = dictionary["yesterday"] as? NSDictionary{
				yesterday = Forecast(fromDictionary: yesterdayData)
			}
	}

}