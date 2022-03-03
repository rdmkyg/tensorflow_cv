# tensorflow_2.4.3 Open_CV 이미지 
## 개요 
  opencv로 전처리 하면서, tensorflow 2.4.3 로 이미지 프로세싱을 하고, 딥러닝 연산 하는 한국 유저들의 위한 이미지 입니다. <br>
  이건은 GPU 연산이 되지 않는 Opencv 입니다.   이것 부터 테스트 후에,  GPU가 되는 것을 정리 하겠습니다. 
  <br><br>
  

## 시작 
   바로 시작 하려면 Docker가 설치되어 있는지 확인 하여야 하며,  아래의 URL을 참고 하여 설치 하여야 합니다.   
   &nbsp;  &nbsp;  첫번째,  <a href ="https://myjamong.tistory.com/296#:~:text=Windows%20%ED%99%98%EA%B2%BD%EC%97%90%20Docker%20%EC%84%A4%EC%B9%98%ED%95%98%EA%B8%B0%20%EC%9C%84%ED%95%B4%20Docker%20Hub%EC%97%90%EC%84%9C,%EC%95%84%EB%9E%98%20%EC%BB%B4%ED%8F%AC%EB%84%8C%ED%8A%B8%EB%93%A4%EC%9D%B4%20%EC%A0%9C%EA%B3%B5%EB%90%9C%EB%8B%A4.&text=%EC%84%A4%EC%B9%98%ED%8C%8C%EC%9D%BC%EC%9D%84%20%EC%8B%A4%ED%96%89%ED%95%B4%EC%84%9C,%ED%95%98%EB%8A%94%20%EA%B2%83%EC%9D%84%20%ED%99%95%EC%9D%B8%ED%95%A0%20%EC%88%98%20%EC%9E%88%EB%8B%A4.">  Windows Docker 설치 </a> <br>
   &nbsp;  &nbsp;   두번째,  <a href ="https://rdmkyg.blogspot.com/2022/02/ubunt-docker-r-pull-push.html">  Linux docker 설치 </a> 
 <br> <br>  
   
## Docker 컨테이너 Base 이미지 
- <a href = "https://hub.docker.com/r/tensorflow/tensorflow/"> tensorflow/tensorflow:2.4.3-jupyter </a> 이미지를 사용하였습니다. 
- 우분투 20.04에서 opencv 사용법은 https://linuxize.com/post/how-to-install-opencv-on-ubuntu-20-04/ 참고하였습니다. <br><br>

## Docker 이미지 만드는 과정
- 첨부와 같이 Dockerfile을 만들고 아래와 같이 빌드 합니다.   <br>
     ` docker build --tag rdmkyg/tensorflow:2.4.3-jupyter-cv . `
-   리눅스 기준으로  도커에 연결 합니다.     
   ` docker run -it --rm -v $(realpath ~/notebooks):/tf/notebooks -p 8888:8888 rdmkyg/tensorflow:2.4.3-jupyter-cv `
    
- 주피터 노트북에 진입 하면,  아래와 같이 주로 사용하는 모듈을 설치 한다. <br>
   `!pip install pandas` <br>
   `!pip install -U scikit-learn` <br>
   `!pip install Keras==2.4.3` <br>

- 도커에 이미지


