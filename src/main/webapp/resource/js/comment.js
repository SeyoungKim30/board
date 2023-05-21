/**
 * 코멘트 읽기, 쓰기, 삭제 기능
 */

 //덧글 읽기 함수
const loadComments = function(postid){
	fetch("selectComment.do?postid="+postid).then(response=>response.json())
	.then(json=>{
		const commentList = json.commentList;
		var commentListHTML='';
		commentList.forEach(function(each){
			commentListHTML+=`<div class="border-top"><div class="row commentinfo"><div class="col commentwriter">`+each.writer+`</div><div class="col commentdate">`+each.writedate
			if(logonid==each.writer){ commentListHTML+=` &nbsp;<span class="badge bg-danger commentDelBtn" onclick='commentDelete("`+postid+`","`+each.id+`")'>삭제</span>` }
			commentListHTML+=`</div></div><div class="row"><div class="col">`+each.comments+`</div></div></div>`
		})
		document.querySelector('.comments').innerHTML=commentListHTML;
	}).catch(error=>{console.error(error)})
}

//덧글삭제 함수 : 삭제버튼 클릭으로 작동시킴 
const commentDelete = function(postid,id){
	if(confirm('덧글을 삭제할까요?')){
		fetch("deleteComment.do?id="+id+"&postid="+postid).then(response=>response.text()).then(text=>{
			if(text=='1'){
				alert('삭제되었습니다.')
				loadComments(postid);	//덧글 읽기
			}else{
				alert('삭제 결과를 확인하세요.')
			}
		}).catch(error=>{console.error(error)})
	}
}

//덧글 작성 함수
const writeComment = function(postid){
	const json= {"postid":$("[name=postid]").val(),"comments":$("[name=comments]").val()}
	fetch('insertComment.do', {
    	  method: 'POST',
    	  body: JSON.stringify(json),
    	  headers: {
    	    'Content-Type': 'application/json'
    	  }
		}).then(response=>response.text()
		).then(text=>{
			if(text=='1'){
				commentForm.reset();
				loadComments(postid);	//덧글 읽기
			}else if(text =='0'){
				alert('덧글이 정상적으로 등록되지 않았습니다.');
			}else{
				alert(text);
			}
		  }
		).catch(error=>{console.error(error)})
}