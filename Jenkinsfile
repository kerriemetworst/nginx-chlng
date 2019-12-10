pipeline {
  agent any

  stages{
    stage('Build nginx-chlng code'){
      steps {
        sh "./configure"
        sh 'make check'
        junit 'reports/***/*.xml'
        sh "make"
        junit '**/target/*.xml'
      }
    }

    stage('Build Docker Container')
      steps {
        docker build -t .
      }

    stage('archive'){
      steps {
        archiveArtifacts artifacts: '**/target/*.jar'
      }

    }
  }
}
