package sober.model;

import lombok.Data;

@Data
public class ProfileMaker {
	private String[] column = {"MBTI", "나이", "좋아하는 영화", "좋아하는 노래", "주량", "상태"};
	private boolean[] showYN = new boolean[6];
	private String[] data = new String[6];
	private int count = 0;
	
	private ProfileDTO profile;
	
	public ProfileMaker(ProfileDTO profile) {
		
		if(profile.getMbtiYN().equals("Y")) {
			showYN[0] = true;
		}
		if(profile.getAgeYN().equals("Y")) {
			showYN[1] = true;
		}
		if(profile.getMovieYN().equals("Y")) {
			showYN[2] = true;
		}
		if(profile.getMusicYN().equals("Y")) {
			showYN[3] = true;
		}
		if(profile.getStrongYN().equals("Y")) {
			showYN[4] = true;
		}
		if(profile.getStateYN().equals("Y")) {
			showYN[5] = true;
		}
		
		for(int i=0; i<6; i++) {
			if(showYN[i]) {
				switch(i) {
				case 0 : data[i] = profile.getMbti(); break;
				case 1 : data[i] = profile.getAge(); break;
				case 2 : data[i] = profile.getMovie(); break;
				case 3 : data[i] = profile.getMusic(); break;
				case 4 : data[i] = profile.getStrong(); break;
				case 5 : data[i] = profile.getState(); break;
				}
			}else {
				data[i] = null;
			}
		}
		
	}
}
