package cn.lfy.qneng.tree;

import java.util.List;

public class TreeNode {

	 private String id;  
    private String name;  
    private String parentId;  
    private List<TreeNode> nodes;
    private boolean checked = false;
    
    public TreeNode(String id,String name, String parentId) {
    	this.id = id;
    	this.name = name;
    	this.parentId = parentId;
    }
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public List<TreeNode> getNodes() {
		return nodes;
	}
	public void setNodes(List<TreeNode> nodes) {
		this.nodes = nodes;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
    
    
}
