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
  .then(stream => {
    previewPlayer.srcObject = stream;
    startRecording(previewPlayer.captureStream())
    //사용자 권한 요청 코드
  })
}

function startRecording(stream) {
  recordedChunks = [];
  recorder = new MediaRecorder(stream, {
  //new MediaRecorder: 마이크 소리를 녹음하고 저장하려고 씀
  mimeType: 'video/webm; codecs=vp9,opus',
});
  recorder.ondataavailable = (e) => {recordedChunks.push(e.data)}
  //녹음이 진행되는 동안 데이터를 배열에 저장하는 작업
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
  downloadButton.download = `coco_${new Date()}.mp4`;
}


recordButton.addEventListener("click",videoStart);
stopButton.addEventListener("click",stopRecording);
playButton.addEventListener("click",playRecording);