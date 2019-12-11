pipeline {
  agent any

  stages{
    stage('Build nginx-chlng code'){
      steps {
        sh "./configure"
        sh 'make'

      }
    }

    stage('Build Docker Container'){
      steps {
        sh 'docker build -t nginx-chlng .'
        sh 'docker run -v /usr/website:/usr/shr/nginx/html -p 80:8080 nginx-chlng'
        sh 'curl localhost -o ${env.BUILD_TAG}_{date}_nginx.out'
      }
    }
  }

  post {
    always {
        archiveArtifacts artifacts: '*nginx.out', onlyIfSuccessful: false
      }

  }

}
