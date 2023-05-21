

//바이트 수 구하는 함수
function getByteSize(str) {
  // Create a new TextEncoder instance with UTF-8 encoding
  const encoder = new TextEncoder();

  // Encode the string into a Uint8Array
  const encodedString = encoder.encode(str);

  // Return the length of the encoded string (byte size)
  return encodedString.length;
}

//에디터 적용
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "ir1",
 sSkinURI: "resource/se2/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
});


const writerinput = document.querySelector('[name=writer]')
const subjectinput = document.querySelector('[name=subject]')
const contentinput = document.querySelector('#ir1')
const writeform = document.querySelector("#writeform")

//제출할때 본문 내용 채우고 유효성 검사
writeform.addEventListener('submit',function(e){
	e.preventDefault();
	 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	 //유효성 검사
	 let valid=true;
	 //writer 있을때
	 if(writerinput.value.length==0) {
		 valid=false;
		 alert('작성자 정보가 없습니다.')
		 return;
		 }
	 //subject 2~50자
	  if(subjectinput.value.length<2 ||subjectinput.value.length>50){
		  valid=false;
		  alert('글 제목 길이는 2~50 입니다.')
		  return;
	  }
	 //본문 2000바이트
	if(getByteSize(contentinput.value)>2000){
		valid=false;
		alert('글자수를 초과했습니다.')
		return;
	}
	if(valid) writeform.submit();
})
