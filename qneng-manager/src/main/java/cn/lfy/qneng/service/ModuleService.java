package cn.lfy.qneng.service;

import java.util.List;

import cn.lfy.qneng.model.Module;
import cn.lfy.qneng.vo.DataInfo;

import com.manager.model.Criteria;
import com.manager.model.PageInfo;

public interface ModuleService {
    /**
     * 根据条件查询记录总数
     */
    int countByCriteria(Criteria criteria);

    /**
     * 保存记录,不管记录里面的属性是否为空
     */
    Long add(Module record);

    /**
     * 删除
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Long id);
    /**
     * 根据条件查询记录集
     */
    List<Module> findListByCriteria(Criteria criteria);
    
    /**
     * 根据条件查询记录集
     */
    PageInfo<Module> findListByCriteria(Criteria criteria, int pageNo, int pageSize);

    /**
     * 根据主键查询记录
     */
    Module findById(Long id);

    /**
     * 根据主键更新属性不为空的记录
     */
    int updateByIdSelective(Module record);
    
    /**
     * 根据组件no查询记录
     * @param no 设备唯一码
     */
    Module findByNo(String no);
    /**
     * 获取组串电压、电流、功率、平均温度
     * @param bunchId
     * @return
     */
    DataInfo getBunchDataInfo(Long bunchId);
    /**
     * 获取电站总功率
     * @param stationId
     * @return
     */
    Double getStationPower(Long stationId);
    
}