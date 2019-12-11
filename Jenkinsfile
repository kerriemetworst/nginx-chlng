pipeline {
  agent any

  stages{
    /*stage('Build nginx-chlng code'){
      steps {
        sh "./configure"
        sh 'make'

      }
    }*/

    stage('Build Docker Container'){
      steps {
        sh 'docker build -t nginx-chlng .'
        sh 'docker run --rm -v /usr/website:/usr/shr/nginx/html -d -p 8081:80 --name nginx-chlng nginx-chlng'
        sh "curl localhost:8081 -o ${env.BUILD_TAG}_${currentBuild.startTime}_nginx.out"
        sh 'docker container stop nginx-chlng'
      }
    }
  }

  post {
    always {
        archiveArtifacts artifacts: '*nginx.out', onlyIfSuccessful: false
      }

  }

}
