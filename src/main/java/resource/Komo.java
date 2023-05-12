package resource;

import java.util.ArrayList;
import java.util.List;

import board.vo.Voca;
import kr.co.shineware.nlp.komoran.constant.DEFAULT_MODEL;
import kr.co.shineware.nlp.komoran.core.Komoran;
import kr.co.shineware.nlp.komoran.model.KomoranResult;
import kr.co.shineware.nlp.komoran.model.Token;

 public class Komo {
  
	 static public List<Voca> analyzingList(String str) {
	  Komoran komoran = new Komoran(DEFAULT_MODEL.STABLE);
	  KomoranResult analyzeResultList = komoran.analyze(str);
	  
	  List<Token> tokenList = analyzeResultList.getTokenList();
	  List<Voca> result= new ArrayList<Voca> ();
	  
	/* 고유명사, 일반명사, 외국어만 단어로 */
	  for (Token token : tokenList) {	//분석된 형태소별로 반복
	        if(token.getPos().equals("NNP")||token.getPos().equals("NNG")||token.getPos().equals("SL")) {
	         	boolean found = false;	//해당 형태소가 이미 List에 있으면 true, 없으면 false
	        	for(Voca vv:result) {
	        		if(vv.getVoca().equals(token.getMorph())) {
	        			vv.setFrequency(vv.getFrequency()+1);
	        			found=true;
	        			break;
	        		}
	        	}
	        	if(!found) {
	        		result.add(new Voca(token.getMorph(),1));
	        	}
	        	
	        }
	   }
	  return result;
  }
  
  
}