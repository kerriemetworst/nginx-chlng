pipeline {
  agent any

  stages{
    stage('Build nginx-chlng code')
      steps {
        sh "./configure"
        sh "make"
      }
  }

}
