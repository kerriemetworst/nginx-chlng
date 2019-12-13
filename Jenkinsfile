/* Jenkinsfile for endocode challenge CI/CD */

pipeline {
  agent any

/* In order to get a date stamp define a environment variable with a script that uses the standard unix date command with a timecode definable as you like */

  environment {
    def DATESTAMP = sh(script: "date +%Y%m%d%H%M", returnStdout: true).trim()
  }

/* Since the code has to run in a docker container all complition steps are done in the dockerfile.
* for easier referencing the docker build is named with the -t option.
* to change the port that is usable I use the -p option to map the desired 8080 local port to the exposed 80 port of the docker nginx Container
* the -v option maps /usr/website to the standard root of the build nginx config.
* -rm removes the made container when stopped in docker
* the desired nginx address with buildname and date is added as a steps

*/
  stages{
    stage('Build Docker Container'){
      steps {
        sh 'docker build -t nginx-chlng .'
        sh 'docker run --rm -v /usr/website:/usr/local/nginx/html -d -p 8080:80 --name nginx-chlng nginx-chlng'
        sh "curl localhost:8080 -o ${env.BUILD_TAG}_${DATESTAMP}_nginx.out"
        sh 'docker container stop nginx-chlng'
      }
    }
  }
  
/* if steps conclude with succes export an artifact with the archiveArtifacts command, scooping the *nginx.out made with the curl command */

  post {
    always {
        archiveArtifacts artifacts: '*nginx.out', onlyIfSuccessful: false
      }

  }


}
