	
//파일 리스트 추가	
const morefileBtn = document.querySelector("#morefileBtn");
const attachmentFile = document.querySelector('.attachmentFile');

let canclebtn=0;
	morefileBtn.addEventListener('click',function(){
		canclebtn++;
		attachmentFile.insertAdjacentHTML("beforeend",`<div class="input-group mb-1" id="file`+canclebtn+`"><input type="file" class="form-control" name ="filelist" onchange="uploadFile(this)">
										<button class="btn btn-warning" type="button" id="`+canclebtn+`">취소</button>
										</div>`)
		
		//파일 취소 버튼
		var filecancleBtn=document.querySelectorAll(".attachmentFile .btn-warning")
		filecancleBtn.forEach(function(each){
			each.addEventListener('click',function(){
				document.querySelector("#file"+each.id).remove();
				})
			})
	})
//파일 선택하고 파일 크기 구함
function uploadFile(newfile){
	if(newfile.files[0].size > 10485760){
		alert("10MB 이상의 파일은 첨부할 수 없습니다.")
		document.querySelector("#file"+canclebtn).remove();
	}
}

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
	
	//파일 용량 검사
	
	if(valid) writeform.submit();
})
