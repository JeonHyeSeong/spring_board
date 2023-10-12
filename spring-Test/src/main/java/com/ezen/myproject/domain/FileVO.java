package com.ezen.myproject.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class FileVO {
	private String uuid;
	private String save_dir;
	private String file_name;
	private int file_type;
	private int bno;
	private long file_size;
	private String reg_date;
}
