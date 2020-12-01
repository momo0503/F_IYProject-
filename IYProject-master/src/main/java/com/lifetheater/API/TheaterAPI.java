package com.lifetheater.API;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.lifetheater.vo.TListVO;
import com.lifetheater.vo.TLoDetailVO;
import com.lifetheater.vo.TRankVO;
import com.lifetheater.vo.TheaterVO;

public class TheaterAPI {

	private String serviceKey = "87bc9b8de1994a3690cd1c296b09b00c";
	private static TheaterAPI instance;
	public static TheaterAPI getInstance() {
		if(instance==null) {
			instance = new TheaterAPI();
		}
		return instance;
	}
	
	
	public List<TListVO> getTheaterList(){
		String url = "http://www.kopis.or.kr/openApi/restful/pblprfr";
		String sdate = "20200921";
		String edate = "20200921";
		int cPage= 1;
		int rows = Integer.MAX_VALUE;
		int sido = 11;
		//String tState = "02";// 01:��������,02:������,03:�����Ϸ�
		List<TListVO> list = null;
		
		try {
			
			
				url = url + "?service="+serviceKey
						+"&stdate="+sdate+"&eddate="+edate+"&cpage="+cPage+"&rows="+rows+"&shcate=AAAA";
				//System.out.println("url : " + url);
				DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
				// �������� ������ Document ��ü �����Ͽ� �Ľ��� url ��� �о���̱�
				
				doc.getDocumentElement().normalize();
				
				//System.out.println("root element : "+doc.getDocumentElement().getNodeName());
				// XML�� �ֻ��� tag �� �������� => dbs
				
				NodeList nList = doc.getElementsByTagName("db");
				// �Ľ��� ������ �ִ� tag�� ����
				
				//System.out.println("����Ʈ �� : " + nList.getLength());
				// nList�� ��� ������ ��
				
				
					if(list==null) {
						list = new ArrayList<>();
					}
					
					for(int i=0; i<nList.getLength(); i++) {
						Node nNode = nList.item(i);
						
						
						if(nNode.getNodeType()==Node.ELEMENT_NODE) {
							Element elem = (Element)nNode;
							
							
							TListVO tempT = new TListVO();
							tempT.setTheater_id(getTagValue("mt20id",elem));
							tempT.setTheater_name(getTagValue("prfnm",elem));
							tempT.setSdate(getTagValue("prfpdfrom",elem));
							tempT.setEdate(getTagValue("prfpdto",elem));
							tempT.setLocation_name(getTagValue("fcltynm",elem));
							tempT.setPoster_url(getTagValue("poster",elem));
							tempT.setTstate(getTagValue("prfstate",elem));
							tempT.setOpenrun(getTagValue("openrun",elem).equals("Y"));
							
							list.add(tempT);
						}
					}
				
			
		
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}//getTheaterList()
	
	public TheaterVO getTheaterInfo(String theater_id) {
		String url = "http://www.kopis.or.kr/openApi/restful/pblprfr";
		
		url = url + "/"+theater_id+"?service="+serviceKey;
		try {
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			// �������� ������ Document ��ü �����Ͽ� �Ľ��� url ��� �о���̱�
			
			doc.getDocumentElement().normalize();
			
			NodeList nList = doc.getElementsByTagName("db");
			// �Ľ��� ������ �ִ� tag�� ����
			
			if(nList.getLength()>0) {
				Element elem = (Element)nList.item(0);
				TheaterVO tempT = new TheaterVO();
				tempT.setTheater_id(getTagValue("mt20id",elem));
				tempT.setLocation_id(getTagValue("mt10id",elem));
				tempT.setTheater_name(getTagValue("prfnm",elem));
				tempT.setSdate(getTagValue("prfpdfrom",elem));
				tempT.setEdate(getTagValue("prfpdto",elem));
				tempT.setLocation_name(getTagValue("fcltynm",elem));
				tempT.setTheater_cast(getTagValue("prfcast",elem));
				tempT.setTheater_staff(getTagValue("prfcrew",elem));
				tempT.setRuntime(getTagValue("prfruntime",elem));
				tempT.setLimit_grade(getTagValue("prfage",elem));
				tempT.setTheater_pc(getTagValue("entrpsnm",elem));
				tempT.setTheater_price(getTagValue("pcseguidance",elem));
				tempT.setPoster_url(getTagValue("poster",elem));
				tempT.setTstate(getTagValue("prfstate",elem));
				tempT.setOpenrun(getTagValue("openrun",elem).equals("Y"));
				tempT.setScrdate(getTagValue("dtguidance",elem));
				
				
				// �Ұ� �̹��� => styurls ���� styurl
				
				String tempImgs = "";
				NodeList imgsUrl = elem.getElementsByTagName("styurl");
				for(int i = 0; i<imgsUrl.getLength(); ++i) {
					Node tempN = imgsUrl.item(i);
					//System.out.println(i+" Node:"+tempN.getTextContent());
					
					if(tempN.getNodeType()==Node.ELEMENT_NODE) {
						tempImgs = tempImgs + " " + tempN.getTextContent();
					}
				}
				tempT.setTinfo(tempImgs);
				
				return tempT;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}//getTheaterInfo()
	
	public TLoDetailVO getTLocationInfo(String location_id) {
		
		String url = "http://www.kopis.or.kr/openApi/restful/prfplc";
		
		url = url + "/" + location_id + "?service="+serviceKey;
		
		try {
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			// �������� ������ Document ��ü �����Ͽ� �Ľ��� url ��� �о���̱�
			
			doc.getDocumentElement().normalize();
			
			
			NodeList nList = doc.getElementsByTagName("db");
			// �Ľ��� ������ �ִ� tag�� ����
			
			if(nList.getLength()>0) {
				Element elem = (Element)nList.item(0);
				
				TLoDetailVO tmpL = new TLoDetailVO();
				tmpL.setLocation_name(getTagValue("fcltynm", elem));
				tmpL.setLocation_id(location_id);
				tmpL.setLocation_tel(getTagValue("telno", elem));
				tmpL.setLocation_url(getTagValue("relateurl", elem));
				tmpL.setLocation_addr(getTagValue("adres", elem));
				tmpL.setLocation_la(getTagValue("la", elem));
				tmpL.setLocation_lo(getTagValue("lo", elem));
				return tmpL;
			}
		}catch(Exception e) {e.printStackTrace();}
		
		return null;
	}//getLocationInfo()
	
	
	public List<TRankVO> getTRanking(String type){
		String url = "http://kopis.or.kr/openApi/restful/boxoffice";
		
		String today=null;
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		
		// get standard date
		if(type.equals("day")) {
			Calendar temp = Calendar.getInstance();
			temp.add(Calendar.DATE, -1);
			today=format.format(temp.getTime());
		}else {

			Date now = new Date();
			today = format.format(now);
		}
		
		
		url = url + "?service="+serviceKey+"&ststype="+type+"&date="+today+"&catecode=AAAA";
		//http://kopis.or.kr/openApi/restful/boxoffice?service=87bc9b8de1994a3690cd1c296b09b00c&ststype=day&date=20200917&catecode=AAAA
		//http://kopis.or.kr/openApi/restful/boxoffice?service=87bc9b8de1994a3690cd1c296b09b00c&ststype=month&date=20200917&catecode=AAAA
		
		//System.out.println("rank url : " + url);
		try {
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			// �������� ������ Document ��ü �����Ͽ� �Ľ��� url ��� �о���̱�
			
			doc.getDocumentElement().normalize();
			
			//System.out.println("root element : "+doc.getDocumentElement().getNodeName());
			// XML�� �ֻ��� tag �� �������� => boxofs
			
			NodeList nList = doc.getElementsByTagName("boxof");
			// �Ľ��� ������ �ִ� tag�� ����
			
			if(nList.getLength()>0) {
				List<TRankVO> list = new ArrayList<>();
				
				for(int i=0; i<nList.getLength(); i++) {
					Node tmpN = nList.item(i);
					
					if(tmpN.getNodeType()==Node.ELEMENT_NODE) {
						Element elem = (Element)tmpN;
						TRankVO tmpR = new TRankVO();
						
						//tmpR.setLocation(getTagValue("area",elem));//해당 태그가 있는 것도 없는것도 있음
						tmpR.setPlaytime(getTagValue("prfpd", elem));
						tmpR.setLocation_name(getTagValue("prfplcnm",elem));
						tmpR.setTheater_name(getTagValue("prfnm",elem));
						tmpR.setRank(Integer.parseInt(getTagValue("rnum", elem)));
						tmpR.setTheater_id(getTagValue("mt20id", elem));
						String getRankPoster = this.getTheaterInfo(tmpR.getTheater_id()).getPoster_url();
						//System.out.println("get TheaterInfo Poster  "+getRankPoster);
						tmpR.setPoster_url(getRankPoster);
						
						
						list.add(tmpR);
					}
				}
				return list;
			}
		}catch(Exception e) {e.printStackTrace();}
		
		return null;
	}//getTRanking()
	
	
	private static String getTagValue(String tag, Element elem) {
		NodeList nList = elem.getElementsByTagName(tag).item(0).getChildNodes();
		
		Node nVal = (Node)nList.item(0);
		if(nVal==null) {return null;}
		return nVal.getNodeValue();
	}//getTagValue()
}
