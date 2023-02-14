package board;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import board.vo.Board;

public class Run01 {

	public static void main(String[] args) {
		String path = "board\\run01.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		A01_Controller obj = ctx.getBean("a01_Controller", A01_Controller.class);
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		Board brd= new Board();
		//System.out.println(obj.selectBoardList(brd, null));
		
	
	}

}
