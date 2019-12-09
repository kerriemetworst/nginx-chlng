pipeline {
  agent any

  Stages{
    stage('Build nginx-chlng code')
      steps {
        sh "./configure"
        sh "make"
      }
  }

}
