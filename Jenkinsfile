pipeline {
  agent any

  stages{
    stage('Build nginx-chlng code'){
      steps {
        sh "./configure"
        sh 'make check'
        #junit 'reports/***/*.xml'
        #sh "make"
        #junit '**/target/*.xml'
      }
    }

    stage('Build Docker Container')
      steps {
        docker build .
        docker run -v /usr/website:/usr/shr/nginx/html -p 80:8080
        curl localhost -o {buildname}_{date}_nginx.out
      }

    stage('archive'){
      steps {
        archiveArtifacts artifacts: '**/target/*.jar'
      }

    }
  }
}
