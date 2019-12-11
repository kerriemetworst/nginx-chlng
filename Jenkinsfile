pipeline {
  agent any

  environment {
    def DATESTAMP = sh(script: "echo 'date +%Y%m%d%H%M'", returnStdout: true).trim()
  }

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
        sh 'docker run --rm -v /usr/website:/usr/local/nginx/html -d -p 8081:80 --name nginx-chlng nginx-chlng'
        sh "curl localhost:8081 -o ${env.BUILD_TAG}_${env.BUILD_ID}_nginx.out"
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
