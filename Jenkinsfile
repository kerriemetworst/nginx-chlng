pipeline {
  agent any

  stages{
    stage('Build nginx-chlng code'){
      steps {
        sh "./configure"
        sh 'make check'
        
      }
    }

    stage('Build Docker Container')
      steps {
        docker build .
        docker run -v /usr/website:/usr/shr/nginx/html -p 80:8080
        curl localhost -o $BUILD_TAG_{date}_nginx.out
      }

    stage('archive'){
      steps {
        archiveArtifacts artifacts: '**/target/*.jar'
      }

    }
  }
}
