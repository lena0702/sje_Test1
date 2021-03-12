package com.team5.main;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBManager {

	public static SqlSession connect() throws IOException {
		String cfgName = "config.xml"; // 서버 정보가 담긴 파일
		InputStream is;
		is = Resources.getResourceAsStream(cfgName);

		SqlSessionFactoryBuilder ssfb = new SqlSessionFactoryBuilder(); // 세션 열 공장 만들어주기
		SqlSessionFactory ssf = ssfb.build(is); // 공장 is라는 설계도로 만들기
		return ssf.openSession(); // 세션 열기
	}
}
