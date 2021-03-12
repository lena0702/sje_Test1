package com.team5.main;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class GetMovie {
	public static List<MovieSearch> getMovie(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
			String str = request.getParameter("movietitle");
			str = URLEncoder.encode(str, "utf-8");

			String url = "https://openapi.naver.com/v1/search/movie.json?query=" + str + "&display=100";

			URL u = new URL(url);
			HttpsURLConnection huc = (HttpsURLConnection) u.openConnection();

			huc.addRequestProperty("X-Naver-Client-Id", "Z2tS3cIyBdN32nuYmjO8");
			huc.addRequestProperty("X-Naver-Client-Secret", "PVsgJtqe2P");

			InputStream is = huc.getInputStream();
			InputStreamReader isr = new InputStreamReader(is, "utf-8");

			JSONParser jp = new JSONParser();

			JSONObject obj = (JSONObject) jp.parse(isr);
			JSONArray item = (JSONArray) obj.get("items");

			List<MovieSearch> movieSearchs = new ArrayList<MovieSearch>();

			for (int i = 0; i < item.size(); i++) {
				JSONObject tmp = (JSONObject) item.get(i);
				String title = (String) tmp.get("title");
				title = title.replace("<b>", "");
				title = title.replace("</b>", "");
				if (title.isBlank()) {
					title = "-";
				}

				String actor = (String) tmp.get("actor");
				actor = actor.replace("<b>", "");
				actor = actor.replace("</b>", "");

				if (actor.isBlank()) {
					actor = "-";
				}

				if (actor.length() != 0) {
					String actorLast = String.valueOf(actor.charAt(actor.length() - 1));

					if (actorLast.equals("|")) {
						actor = actor.substring(0, actor.length() - 1);
					}
				}

				actor = actor.replace("|", ", ");

				String sub = (String) tmp.get("subtitle");
				sub = sub.replace("<b>", "");
				sub = sub.replace("</b>", "");
				if (sub.isBlank()) {
					sub = "-";
				}
				
				String pubDate = (String) tmp.get("pubDate");
				if (pubDate.isBlank()) {
					pubDate = "0001";
				}
				pubDate = pubDate.replace("<b>", "");
				pubDate = pubDate.replace("</b>", "");

				String director = (String) tmp.get("director");
				if (director.isBlank()) {
					director = "-";
				}

				director = director.replace("<b>", "");
				director = director.replace("</b>", "");

				if (director.length() != 0) {
					String dirLast = String.valueOf(director.charAt(director.length() - 1));

					if (dirLast.equals("|")) {
						director = director.substring(0, director.length() - 1);
					}
				}

				director = director.replace("|", ", ");
				String img = (String) tmp.get("image");
				if (img.isBlank()) {
					img = "-";
				}
				img = img.replace("<b>", "");
				img = img.replace("</b>", "");
				String rate = (String) tmp.get("userRating");
				if (rate.isBlank()) {
					rate = "0.00";
				}
				rate = rate.replace("<b>", "");
				rate = rate.replace("</b>", "");
				BigDecimal rates = new BigDecimal(rate);
				MovieSearch ms = new MovieSearch(title, actor, sub, pubDate, director, img, rates);

				movieSearchs.add(ms);
			}

			if (movieSearchs.isEmpty()) {
				BigDecimal blank = new BigDecimal(0);
				MovieSearch ms = new MovieSearch("", "", "", "", "", "", blank);
				movieSearchs.add(ms);
			}
			request.setAttribute("searchResults", movieSearchs);
			request.setAttribute("movietitle", str);
			return movieSearchs;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public static List<MovieSearch> getR_Movie(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
			String str = request.getParameter("genre");
//			str = URLEncoder.encode(str, "utf-8");
			String url = "https://openapi.naver.com/v1/search/movie.json?query=e" + "&genre=" + str + "&display=4";
			URL u = new URL(url);
			HttpsURLConnection huc = (HttpsURLConnection) u.openConnection();
			huc.addRequestProperty("X-Naver-Client-Id", "XMo8dd3SviWTf0tHTtGR");
			huc.addRequestProperty("X-Naver-Client-Secret", "gvNxXu6jGg");
			InputStream is = huc.getInputStream();
			InputStreamReader isr = new InputStreamReader(is, "utf-8");
			JSONParser jp = new JSONParser();
			JSONObject obj = (JSONObject) jp.parse(isr);
			JSONArray item = (JSONArray) obj.get("items");
			List<MovieSearch> movieSearchs = new ArrayList<MovieSearch>();
			for (int i = 0; i < item.size(); i++) {
				JSONObject tmp = (JSONObject) item.get(i);
				String title = (String) tmp.get("title");
				title = title.replace("<b>", "");
				title = title.replace("</b>", "");
				if (title.isBlank()) {
					title = "-";
				}
				String actor = (String) tmp.get("actor");
				actor = actor.replace("<b>", "");
				actor = actor.replace("</b>", "");
				if (actor.isBlank()) {
					actor = "-";
				}
				if (actor.length() != 0) {
					String actorLast = String.valueOf(actor.charAt(actor.length() - 1));
					if (actorLast.equals("|")) {
						actor = actor.substring(0, actor.length() - 1);
					}
				}
				actor = actor.replace("|", ", ");
				String sub = (String) tmp.get("subtitle");
				sub = sub.replace("<b>", "");
				sub = sub.replace("</b>", "");
				if (sub.isBlank()) {
					sub = "-";
				}
				
				String pubDate = (String) tmp.get("pubDate");
				if (pubDate.isBlank()) {
					pubDate = "0001";
				}
				pubDate = pubDate.replace("<b>", "");
				pubDate = pubDate.replace("</b>", "");
				String director = (String) tmp.get("director");
				if (director.isBlank()) {
					director = "-";
				}
				director = director.replace("<b>", "");
				director = director.replace("</b>", "");
				if (director.length() != 0) {
					String dirLast = String.valueOf(director.charAt(director.length() - 1));
					if (dirLast.equals("|")) {
						director = director.substring(0, director.length() - 1);
					}
				}
				director = director.replace("|", ", ");
				String img = (String) tmp.get("image");
				if (img.isBlank()) {
					img = "-";
				}
				img = img.replace("<b>", "");
				img = img.replace("</b>", "");
				String rate = (String) tmp.get("userRating");
				if (rate.isBlank()) {
					rate = "0.00";
				}
				rate = rate.replace("<b>", "");
				rate = rate.replace("</b>", "");
				BigDecimal rates = new BigDecimal(rate);
				MovieSearch ms = new MovieSearch(title, actor, sub, pubDate, director, img, rates);
				movieSearchs.add(ms);
			}
			if (movieSearchs.isEmpty()) {
				BigDecimal blank = new BigDecimal(0);
				MovieSearch ms = new MovieSearch("", "", "", "", "", "", blank);
				movieSearchs.add(ms);
			}
			
			request.setAttribute("mySearchResults", movieSearchs);
			return movieSearchs;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}

