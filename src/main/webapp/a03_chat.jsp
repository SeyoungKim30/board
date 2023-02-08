<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>    
<!DOCTYPE html>
<html>
  <head>
    <title>Chatting System with OpenAI API</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@openai/api@beta/dist/openai.min.js"></script>
  </head>
  
  <body>
    
    <div id="chat-window">
      <div id="chat-header">
        <h1>Chatting System with OpenAI API</h1>
      </div>
      <div id="chat-body">
        <div id="chat-conversation">
          
        </div>
        <div id="chat-input">
          <form id="chat-form">
            <input type="text" placeholder="Type message here" id="chat-msg" />
            <input type="submit" value="Send" />
          </form>
        </div>
      </div>
    </div>
    
    <script type="text/javascript">
      var openai = new OpenAI('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');
      
      $(document).ready(function(){
        // Submit message on submit
        $('#chat-form').on('submit', function(e){
          e.preventDefault();
          var message = $('#chat-msg').val();
          $('#chat-msg').val('');
          
          // Append message
          $('#chat-conversation').append('<div class="chat-message"><p>'+message+'</p></div>');
          
          // Send Message to OpenAI
          openai.request('/davinci/v1/dialog', {
            prompt: message
          }).then(function(response) {
            $('#chat-conversation').append('<div class="chat-message ai-message"><p>'+response.data.choices[0].text+'</p></div>');
          });
        });
      });
    </script>
    
  </body>
</html>