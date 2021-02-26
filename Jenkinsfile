pipeline{
  enviroment{
  IBM_CLOUD_REGION='eu-de'
  REGISTRY_HOSTNAME='de.icr.io'
  IKS_CLUSTER=''
  DEPLOYMENT_NAME='samiks-jar'
  PORT='4001'
  }
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
               stage('Install IBM cloud CLI'){
    
                        steps{
                                sh '''
                                     curl -fsSL https://clis.cloud.ibm.com/install/linux|sh 
                                     ibmcloud --version
                                '''
                              }
                              }
              stage('Authenticate with IBM cloud CLI'){
      
                         steps{
                                  sh'''
                                  ibmcloud login --apikey ${IBM_API_KEY}-r"${IBM_CLOUD_REGION}" -g
                                  Default
                                      ibmcloud ks cluster config --cluster ${IKS_CLUSTER}
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
