
package beans;

import java.io.Serializable;

public class projectbean implements Serializable{
    
    private String progid;
    private String name;
    private String type;
    private String description;
    private String uid;

    public String getProgid() {
        return progid;
    }

    public void setProgid(String progid) {
        this.progid = progid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }
    
}
