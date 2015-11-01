package cn.lfy.qneng.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 组件
 * @author honeyleo
 *
 */
public class Module implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3660103175024147940L;
	
	private Long id;
	/**
	 * 组件唯一码
	 */
	private String no;
	/**
	 * 设备密钥
	 */
	private String appSecret;
	
	private String name;
	/**
	 * 型号
	 */
	private String model;
	/**
	 * 厂家
	 */
	private String manufactory;
	/**
	 * 安装日期
	 */
	private String installdate;
	
	/**
	 * 核定电压
	 */
	private Double maxVolt;
	
	/**
	 * 核定电流
	 */
	private Double maxCurr;
	/**
	 * 核定功率
	 */
	private Double power;

	/**
	 * 关联组串ID
	 */
	private Long BunchId;
	
	private Date createTime;
	
	private Long lastUpdateTime;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getAppSecret() {
		return appSecret;
	}

	public void setAppSecret(String appSecret) {
		this.appSecret = appSecret;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getManufactory() {
		return manufactory;
	}

	public void setManufactory(String manufactory) {
		this.manufactory = manufactory;
	}

	public String getInstalldate() {
		return installdate;
	}

	public void setInstalldate(String installdate) {
		this.installdate = installdate;
	}

	public Double getMaxVolt() {
		return maxVolt;
	}

	public void setMaxVolt(Double maxVolt) {
		this.maxVolt = maxVolt;
	}

	public Double getMaxCurr() {
		return maxCurr;
	}

	public void setMaxCurr(Double maxCurr) {
		this.maxCurr = maxCurr;
	}

	public Double getPower() {
		return power;
	}

	public void setPower(Double power) {
		this.power = power;
	}

	public Long getBunchId() {
		return BunchId;
	}

	public void setBunchId(Long bunchId) {
		BunchId = bunchId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Long getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(Long lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

}