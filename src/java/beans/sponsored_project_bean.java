/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author Saroj
 */
public class sponsored_project_bean {
    
    private String progid;
    private String compid;
    private String compname;
    private String money;
    private String description;
    private String p_name;
    private String p_type;
    private String p_desc;

    public void setProgid(String progid) {
        this.progid = progid;
    }

    public void setCompid(String compid) {
        this.compid = compid;
    }

    public void setCompname(String compname) {
        this.compname = compname;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public void setP_type(String p_type) {
        this.p_type = p_type;
    }

    public void setP_desc(String p_desc) {
        this.p_desc = p_desc;
    }

    public String getProgid() {
        return progid;
    }

    public String getCompid() {
        return compid;
    }

    public String getCompname() {
        return compname;
    }

    public String getMoney() {
        return money;
    }

    public String getDescription() {
        return description;
    }

    public String getP_name() {
        return p_name;
    }

    public String getP_type() {
        return p_type;
    }

    public String getP_desc() {
        return p_desc;
    }
    
}
