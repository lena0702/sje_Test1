package com.team5.main;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;


public class GetMovie3 {

	public static void getMovie(HttpServletRequest request) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("utf-8");
		HttpsURLConnection huc = null;
		try {
			
			String mtitle = "e";
			String str = request.getParameter("genre");
			str = URLEncoder.encode(str, "utf-8");
			String url = "https://openapi.naver.com/v1/search/movie.xml";
			url = url + "?query=" + mtitle + "&genre=" + str;
			
			URL u = new URL(url);
			huc = (HttpsURLConnection) u.openConnection();
			
			huc.addRequestProperty("X-Naver-Client-Id", "XMo8dd3SviWTf0tHTtGR");
			huc.addRequestProperty("X-Naver-Client-Secret", "gvNxXu6jGg");
			
			InputStream is = huc.getInputStream(); 
			
			XmlPullParserFactory xppf = XmlPullParserFactory.newInstance();
			XmlPullParser xpp = xppf.newPullParser();
			
			xpp.setInput(is, "utf-8");
			
			int what = xpp.getEventType(); 
			String tagName = null;
			while (what != XmlPullParser.END_DOCUMENT) {
				if (what == XmlPullParser.START_TAG) {
					tagName = xpp.getName();
				}else if (what == XmlPullParser.TEXT) {
					if (tagName.equals("title")) {
						String msg = xpp.getText();
						msg = msg.replace("<b>", "");     
						msg = msg.replace("</b>", "");
						request.setAttribute("title", msg);
					}else if (tagName.equals("actor")) {
						String act = xpp.getText();
						request.setAttribute("actor", act);
					}else if (tagName.equals("subtitle")) {
						String subtitle = xpp.getText();
						request.setAttribute("subtitle", subtitle);
					}else if (tagName.equals("pubDate")) {
						String pubDate = xpp.getText();
						request.setAttribute("pubDate", pubDate);
					}else if (tagName.equals("director")) {
						String director = xpp.getText();
						request.setAttribute("director", director);
					}else if (tagName.equals("userRating")) {
						String userRating = xpp.getText();
						request.setAttribute("userRating", userRating);
					}else if (tagName.equals("image")) {
						String image = xpp.getText();
						request.setAttribute("image", image);
					}
					
				}
				
				xpp.next(); //다음으로 이동 
				what = xpp.getEventType();
			}
			
			
			} catch (Exception e) {
				e.printStackTrace();
			}}
			
			
			
			
	
	 public static void getMovieChart(HttpServletRequest request) throws Exception {

			
			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String dd = sdf.format(d);
			request.setAttribute("dd", dd);

			String url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/" + "searchDailyBoxOfficeList.json"
					+ "?key=03ef7802a51941f447e7a5e695fad8e3" + "&targetDt=20210314";

			URL u = new URL(url);
			HttpURLConnection huc = (HttpURLConnection) u.openConnection();
			InputStream is = huc.getInputStream();
			InputStreamReader isr = new InputStreamReader(is, "utf-8");

			JSONParser jsonparser = new JSONParser();
			JSONObject jsonobject = (JSONObject) jsonparser.parse(isr);
			JSONObject json = (JSONObject) jsonobject.get("boxOfficeResult");
			JSONArray array = (JSONArray) json.get("dailyBoxOfficeList");
			
			ArrayList<TheaterInfo> theaterInfos = new ArrayList<TheaterInfo>();
			
			for (int i = 0; i < array.size(); i++) {

				JSONObject entity = (JSONObject) array.get(i);
				String movieNm = (String) entity.get("movieNm");
				String openDt = (String) entity.get("openDt");
				String audiAcc = (String) entity.get("audiAcc");
				String rank = (String) entity.get("rank");
				
//				System.out.println("박스오피스 순위 " + rank);
//				System.out.println("제목" + movieNm);
//				System.out.println("개봉일" + openDt);
//				System.out.println("누적관객수" + audiAcc);
		
			TheaterInfo ti = new TheaterInfo(movieNm, openDt,audiAcc, rank);

			theaterInfos.add(ti);
			}
			request.setAttribute("theaterInfos", theaterInfos);
			

		}
		
		
	
	
	
	}
