package sober.model;

import java.util.Date;

import lombok.Data;

@Data
public class VisitCountVO {
	private int visit_no;
    private String visit_ip;
    private Date visit_time;
    private String visit_ref;
    private String visit_info;
    
    private String timeformat;
    
    public VisitCountVO() {
    }
}
