pipeline{
  agent any
    tools {
              maven 'jenkins-maven'
          }
  stages {
            stage('Build'){
                            steps{
                                   sh 'mvn -B -DskipTests clean package'
                                 }
                          }
              stage('Test'){
                            steps{
                                   sh 'mvn test'
                                 }
              
                            post {
                                always {
                                          junit 'target/surefire-reports/TEST-hello.GreeterTest.xml'
                                       }
                                }
                          }
              stage('Build-Docker-image'){
                                   steps{
                                            sh 'docker build -t samrika26/jen-java-app":$BUILD_NUMBER" .'
                                        }
                                  }
              stage('Push-Docker-image'){
                                   steps{
                                           withDockerRegistry([ credentialsId: "dockerhub_id", url: "" ])
                                                {
                                                    sh 'docker push samrika26/jen-java-app":$BUILD_NUMBER"'
                                                }                            
                                        }
                                  }
            }
  

}
