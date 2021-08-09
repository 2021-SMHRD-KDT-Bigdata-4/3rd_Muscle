//dom
const recordButton = document.querySelector(".record-button");
const stopButton = document.querySelector(".stop-button");
const playButton = document.querySelector(".play-button");
const downloadButton = document.querySelector(".download-button");
const previewPlayer = document.querySelector("#preview");
const recordingPlayer = document.querySelector("#recording"); 

let recorder;
let recordedChunks;


function videoStart() {
   alert("start");

  navigator.mediaDevices.getUserMedia({video:true,audio:true})
  //사용자 권한 요청 코드
  .then(stream => {
    previewPlayer.srcObject = stream;
    startRecording(previewPlayer.captureStream())
  })
}

function startRecording(stream) {
  recordedChunks = [];
  recorder = new MediaRecorder(stream, {
  mimeType: 'video/webm; codecs=vp9,opus',
});
  recorder.ondataavailable = (e) => {recordedChunks.push(e.data)}
  recorder.start()
}

function stopRecording() {
  previewPlayer.srcObject.getTracks().forEach(track => track.stop());
  recorder.stop();
}



function playRecording() {
  const recordedBlob = new Blob(recordedChunks,{type: "video/mp4"});
  recordingPlayer.src = URL.createObjectURL(recordedBlob);
  recordingPlayer.play();
  downloadButton.href = recordingPlayer.src;
  downloadButton.download = `recording_${new Date()}.mp4`;
}


recordButton.addEventListener("click",videoStart);
stopButton.addEventListener("click",stopRecording);
playButton.addEventListener("click",playRecording);