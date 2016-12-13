package cn.lfy.base.web;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.lfy.base.model.Menu;
import cn.lfy.base.model.Role;
import cn.lfy.base.model.TreeNode;
import cn.lfy.base.service.MenuService;
import cn.lfy.base.service.RoleDefaultMenuService;
import cn.lfy.base.service.RoleService;
import cn.lfy.common.framework.exception.ApplicationException;
import cn.lfy.common.framework.exception.ErrorCode;
import cn.lfy.common.model.Message;
import cn.lfy.common.utils.RequestUtil;

import com.alibaba.fastjson.JSON;
import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;

@Controller
@RequestMapping("/manager/role_menu")
public class RoleMenuController
{

    @Autowired
	private MenuService menuService;

    @Autowired
	private RoleService roleService;
	
    @Autowired
	private RoleDefaultMenuService roleDefaultMenuService;

	@RequestMapping("/list")
	public String listSystemMenus(HttpServletRequest request, HttpServletResponse response) throws ApplicationException
	{
		Long roleId = RequestUtil.getLong(request, "roleId");
		Role role=roleService.getById(roleId);
		if (null == role)
		{
			throw ApplicationException.newInstance(ErrorCode.NOT_EXIST, "角色");
		}
		
		List<Menu> menus = menuService.findMenuList();
		List<Menu> roleMenus = roleDefaultMenuService.getMenuListByRoleId(roleId);
		List<Long> roleMenuIds = new ArrayList<Long>();
		for (Menu menu : roleMenus)
		{
		    roleMenuIds.add(menu.getId());
		}
		request.setAttribute("menus", menus);
		request.setAttribute("roleMenuIds", roleMenuIds);
		return "/manager/system/role/role_menu_list";
	}

	/**
	 * 角色权限列表：角色拥有的权限默认选上
	 * @date 2015-10-09
	 * @param request
	 * @return
	 */
	@RequestMapping("/button")
	public ModelAndView button(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/system/role/button");
		Long roleId = RequestUtil.getLong(request, "roleId");
		List<Menu> menus = menuService.findMenuList();
		List<Menu> roleMenus = roleDefaultMenuService.getMenuListByRoleId(roleId);
		HashSet<Long> roleMenuIdSet = Sets.newHashSet();
		for(Menu m : roleMenus) {
			roleMenuIdSet.add(m.getId());
		}
		List<TreeNode> treeList = Lists.newArrayList();
		for(Menu menu : menus) {
			boolean checked = roleMenuIdSet.contains(menu.getId());
			treeList.add(new TreeNode(menu.getId(), menu.getName(), menu.getParentId(), checked));
		}
		List<TreeNode> tree = Lists.newArrayList();
		for(TreeNode node1 : treeList){  
		    boolean mark = false;  
		    for(TreeNode node2 : treeList) {  
		        if(node1.getParentId() == node2.getId()) {  
		            mark = true;  
		            if(node2.getNodes() == null)  
		                node2.setNodes(new ArrayList<TreeNode>());  
		            node2.getNodes().add(node1);   
		            break;  
		        }  
		    }  
		    if(!mark) {  
		        tree.add(node1);   
		    }  
		}
        mv.addObject("zTreeNodes", JSON.toJSONString(tree));
        mv.addObject("roleId", roleId);
		return mv;
	}
	
	/**
	 * 角色权限列表：角色拥有的权限默认选上
	 * @date 2015-10-09
	 * @param request
	 * @return
	 */
	@RequestMapping("/privileges")
	@ResponseBody
	public Object privileges(HttpServletRequest request) {
		Long roleId = RequestUtil.getLong(request, "id");
		List<Menu> menus = menuService.findMenuList();
		List<Menu> roleMenus = roleDefaultMenuService.getMenuListByRoleId(roleId);
		HashSet<Long> roleMenuIdSet = Sets.newHashSet();
		for(Menu m : roleMenus) {
			roleMenuIdSet.add(m.getId());
		}
		List<TreeNode> treeList = Lists.newArrayList();
		for(Menu menu : menus) {
			boolean checked = roleMenuIdSet.contains(menu.getId());
			treeList.add(new TreeNode(menu.getId(), menu.getName(), menu.getParentId(), checked));
		}
		Message.Builder builder = Message.newBuilder();
		builder.data(treeList);
		return builder.build();
	}
	/**
	 * 保存角色对应权限：做差集
	 * 删除权限：（1，2，3，4）-（1，2，5）=3，4
	 * 新增权限：（1，2，5）-（1，2，3，4）=5
	 * @param request
	 * @return
	 * @throws AdminException
	 */
	@RequestMapping("/saveMenu")
	@ResponseBody
	public Object saveMenu(HttpServletRequest request) throws ApplicationException
	{
		Long roleId = RequestUtil.getLong(request, "roleId");
		String menuIds = RequestUtil.getString(request, "menuIds");
		if (null == roleId || roleId <= 0)
		{
			throw ApplicationException.newInstance(ErrorCode.PARAM_ILLEGAL, "roleId");
		}
		if (null == menuIds || "".equals(menuIds))
        {
			throw ApplicationException.newInstance(ErrorCode.PARAM_ILLEGAL, "menuIds");
        }
		Role role = roleService.getById(roleId);
		if (null == role)
		{
			throw ApplicationException.newInstance(ErrorCode.NOT_EXIST, "角色");
		}
		Iterator<String> it = Splitter.on(",").trimResults().split(menuIds).iterator();
		Set<Long> nowSet = Sets.newHashSet();
		while(it.hasNext()) {
			nowSet.add(Long.valueOf(it.next()));
		}
		
		roleDefaultMenuService.saveMenus(roleId, nowSet); // 更新权限菜单
		return Message.newBuilder().build();
	}
}