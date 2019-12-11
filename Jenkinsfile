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
        docker.build("nginx-chlng:${env.BUILD_ID}")
        sh 'docker run -v /usr/website:/usr/shr/nginx/html -p 80:8080 --name nginx-chlng nginx-chlng:${env.BUILD.ID}'
        sh 'curl localhost -o $BUILD_TAG_{date}_nginx.out'
      }
    }

    stage('archive'){
      steps {
        archiveArtifacts artifacts: '**/target/*.jar'
      }

    }
  }
}
