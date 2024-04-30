pipeline {
agent any

environment {
GITHUB_TOKEN = credentials('GAT')
Access_key = credentials(
}

stages {
        
stage('Checkout') {
steps {
git credentialsId: 'GITHUB_TOKEN',branch: 'features', url: 'https://github.com/urstrulyManoj1/jenkins/'
}
}
        
stage('Build and run'){
steps{
sh 'javac F.java'
sh 'java F'
}
}
        
stage('Docker Stage'){
steps{
script{
def dockerImage = docker.build('hw:latest', '-f Dockerfile .')
}
}
}
        
 stage('AWS Login') {
            environment {
                // Define environment variables to store AWS credentials
                AWS_ACCESS_KEY_ID     = credentials('aws-cred')
                AWS_SECRET_ACCESS_KEY = credentials('aws-cred')
            }
            steps {
                // Use withCredentials block to bind AWS credentials to environment variables
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
                    credentialsId: 'YOUR_ACCESS_KEY_ID_CREDENTIAL_ID'
                ]]) {
                    // Execute AWS CLI command to verify login
                    sh 'aws sts get-caller-identity'
                }
            }
        }

        
}

triggers {
// Trigger the pipeline when changes are pushed to the GitHub repository
githubPush()
}
}
