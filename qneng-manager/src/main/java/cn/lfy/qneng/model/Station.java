package cn.lfy.qneng.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 电站实体类
 * @author honeyleo
 *
 */
public class Station implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -502713508809299920L;
	
	private Long id;
	
	/**
	 * 电站名称
	 */
	private String name;
	
	private String address;
	/**
	 * 电站关联用户
	 */
	private Long userId;
	
	private Date createTime;
	
	private Long lastUpdateTime;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
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
