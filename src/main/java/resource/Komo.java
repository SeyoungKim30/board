package resource;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import kr.co.shineware.nlp.komoran.constant.DEFAULT_MODEL;
import kr.co.shineware.nlp.komoran.core.Komoran;
import kr.co.shineware.nlp.komoran.model.KomoranResult;
import kr.co.shineware.nlp.komoran.model.Token;

public class Komo {

  public Set<String> analyzing(String str) {
	  Komoran komoran = new Komoran(DEFAULT_MODEL.STABLE);
	  KomoranResult analyzeResultList = komoran.analyze(str);
	  
	  List<Token> tokenList = analyzeResultList.getTokenList();
	  Set<String> result= new HashSet<String> ();
	  
	/* 고유명사, 일반명사,동사,외국어만 단어로 */
	  for (Token token : tokenList) {
	        if(token.getPos().equals("NNP")||token.getPos().equals("NNG")||token.getPos().equals("VA")||token.getPos().equals("SL")) {
	        	result.add(token.getMorph());
	        }
	   }
	  return result;
  }
}