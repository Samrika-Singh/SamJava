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
              
                            
                            }
               
    
              
    
    
              stage('Build-Docker-image with Docker'){
                                   
                                   steps{
                                            sh 'docker build -t samrika26/pip_im":$BUILD_NUMBER" .'
                                        }
                                  
                  }
                                  
              stage('Push-Docker_image-DockerHub'){
              
                                   steps{
                                               withDockerRegistry([credentialsId: "dockerhub_id",url:""])
                                               { 
                                                 sh 'docker push samrika26/pip_im":$BUILD_NUMBER"'
                                                }
                                       }
                                  }
                                                                              
               
           
           }
  

}
