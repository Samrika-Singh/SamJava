pipeline{
  
  enviroment{
    
  IBM_CLOUD_REGION='eu-de'
  REGISTRY_HOSTNAME='de.icr.io'
  IKS_CLUSTER=''
  DEPLOYMENT_NAME='samiks-jar'
  PORT='5000'
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
                                  sh '''
                                       ibmcloud login --apikey ${IBM_API_KEY}-r"${IBM_CLOUD_REGION}" -g
                                    Default
                                      ibmcloud ks cluster config --cluster ${IKS_CLUSTER}
                                      
                                      '''
                               }
      
      
                       }
    
    
              stage('Build-Docker-image with Docker'){
                                   
                                   steps{
                                         script{
                                                    dockerImage=docker.build registery +":$BUILD_NUMBER"
                                              }
                                        }
                                  
                  }
                                  
              stage('Push-image-ICR'){
              
                                   steps{
                                         script{
                                                         docker.withRegistery(",registeryCreddential){
                                                          dockerImage.push()
                                                          }                           
                                               }
                                       }
                                  }
                                                                              
               stage('Deploy_to_IKS'){
                                                                             
                                        steps{
                                                    sh '''
                                                    
                                                    ibmcloud ks cluster config--cluster ${IKS_CLUSTER}
                                                    kubectl config current-context
                                                    kubectl create deployment ${DEPLOYMENT_NAME}
                                                    --image=
                                                       '''
                                             }
               
                                     }                                                                
           
           
           }
  

}
