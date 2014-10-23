var recognizing = false;
var ignore_onend;
var start_timestamp;
var final_transcript = '';

var browser = (function(){
        var ua= navigator.userAgent, tem, 
        M= ua.match(/(opera|chrome|safari|firefox|msie|trident(?=\/))\/?\s*(\d+)/i) || [];
        if(/trident/i.test(M[1])){
            tem=  /\brv[ :]+(\d+)/g.exec(ua) || [];
            return 'IE '+(tem[1] || '');
        }
        if(M[1]=== 'Chrome'){
            tem= ua.match(/\bOPR\/(\d+)/)
            if(tem!= null) return 'Opera '+tem[1];
        }
        M= M[2]? [M[1], M[2]]: [navigator.appName, navigator.appVersion, '-?'];
        if((tem= ua.match(/version\/(\d+)/i))!= null) M.splice(1, 1, tem[1]);
        return M.join(' ');
    })();
if (browser.match("Chrome")) {
    var recognition = new webkitSpeechRecognition();
}

  function start_speaking(event) {

    if (!('webkitSpeechRecognition' in window)) {
      alert("Sorry, your Browser does not support the Speech recognition");
    } else {
        
        recognition.continuous = true;
        recognition.interimResults = true;
        startButton(event);
        recognition.onstart = function() {
          $("#start_img").attr("src","/assets/mic-animate.png");
          $("#start_img").parent().css("margin-top","-44px");
          recognizing = true;
          showInfo('info_speak_now');
        };

        recognition.onerror = function(event) {
        if (event.error == 'no-speech') {
          showInfo('info_no_speech');
          ignore_onend = true;
        }
        if (event.error == 'audio-capture') {
          showInfo('info_no_microphone');
          ignore_onend = true;
        }
        if (event.error == 'not-allowed') {
          if (event.timeStamp - start_timestamp < 100) {
            showInfo('info_blocked');
          } else {
            showInfo('info_denied');
          }
          ignore_onend = true;
        }
        };

        recognition.onend = function() {
          recognizing = false;
          console.log("end speeching....");
          $("#start_img").attr("src","/assets/mic.png");
          $("#start_img").parent().css("margin-top","-35px");
          if (ignore_onend) {
            return;
          }
          if (!final_transcript) {
            showInfo('info_start');
            return;
          }
          showInfo('');
        };

        recognition.onresult = function(event) {
          var interim_transcript = '';
          for (var i = event.resultIndex; i < event.results.length; ++i) {
            if (event.results[i].isFinal) {
              final_transcript += event.results[i][0].transcript;
            } else {
              interim_transcript += event.results[i][0].transcript;
            }
          }
          if (linebreak(interim_transcript).length > 0) {
            $("#user_punch_info_punch_text").val(linebreak(final_transcript+interim_transcript),true);
          }else{
            final_transcript = capitalize(final_transcript);
            $("#user_punch_info_punch_text").val(linebreak(final_transcript),true);
          }
        };

        var two_line = /\n\n/g;
        var one_line = /\n/g;
        function linebreak(s) {
          return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
        }

        var first_char = /\S/;
        function capitalize(s) {
          return s.replace(first_char, function(m) { return m.toUpperCase(); });
        }

        function startButton(event) {
          if (recognizing) {
            recognition.stop();
            console.log("Stopped");
            $("#start_img").attr("src","/assets/mic.png");
            $("#start_img").parent().css("margin-top","-35px");
            recognizing = false;
            return;
          }

            final_transcript = '';
            recognition.start();
            ignore_onend = false;
            showInfo('info_allow');
        }

        function showInfo(s) {
          console.log(s);
        }
    }
  }