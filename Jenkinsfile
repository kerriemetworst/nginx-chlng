pipeline {
  agent any

  stages{
    stage('Build nginx-chlng code'){
      steps {
        sh "./configure"
        sh "make"
        junit '**/target/*.xml'
      }
    }

    stage('archive'){
      steps {
        archiveArtifacts artifacts: '**/target/*.jar'
      }

    }
  }
}
