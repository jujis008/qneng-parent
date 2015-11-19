package cn.lfy.qneng.controller.app;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.lfy.common.model.Message;
import cn.lfy.common.utils.DateUtils;
import cn.lfy.qneng.model.Station;
import cn.lfy.qneng.service.ModuleDataService;
import cn.lfy.qneng.service.StationService;
import cn.lfy.qneng.vo.DataInfo;

@Controller
@RequestMapping("/app")
public class AppStationController {

	@Resource
	private StationService stationService;
	@Resource
	private ModuleDataService moduleDataService;
	
	/**
	 * 获取电站概览
	 * @param stationId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/stationOverview")
	@ResponseBody
	public Object overview(@RequestParam(value = "stationId", required = false, defaultValue = "0") Long stationId) throws Exception {
		Message.Builder builder = Message.newBuilder();
		Station station = stationService.findById(stationId);
		if(station != null) {
			builder.put("stationName", station.getName());
			builder.put("stationInfo", station.getInfo());
			Double total = moduleDataService.getTotal(stationId, null, null);
			builder.put("allCapacity", total != null ? total : 0);
			if(total != null) {
				builder.put("displacement", total * 0.785);
			}
			Double year = moduleDataService.getTotalForYear(stationId, null, null);
			builder.put("yearCapacity", year != null ? year : 0);
			Double month = moduleDataService.getTotalForMonth(stationId, null, null);
			builder.put("monthCapacity", month != null ? month : 0);
			DataInfo dataInfo = moduleDataService.getDataInfo(stationId, null);
			if(dataInfo != null) {
				builder.put("stationWeather", "晴朗");
				builder.put("stationTemp", 23);
				builder.put("curPower", dataInfo.getCurVlot() * dataInfo.getCurCurr());
			}
		}
		return builder.build();
	}
	
	/**
	 * 获取电站概览数据
	 * @param stationId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/stationOverviewData")
	@ResponseBody
	public Object  overviewData(@RequestParam(value = "stationId", required = false, defaultValue = "0") Long stationId) throws Exception {
		Message.Builder builder = Message.newBuilder();
		Station station = stationService.findById(stationId);
		if(station != null) {
			Date date = new Date();
			double[] day = moduleDataService.getPowerForDate(DateUtils.date2String3(date), stationId, null, null);
			builder.put("dayPower", day);
			double[] month = moduleDataService.getCapacityForMonth(date, stationId, null, null);
			builder.put("monthCapacity", month);
			double[] year = moduleDataService.getCapacityForYear(DateUtils.date2String5(date), stationId, null, null);
			builder.put("yearCapacity", year);
		}
		return builder.build();
	}
}
