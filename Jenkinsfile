pipeline {
agent any

environment {
GITHUB_TOKEN = credentials('GAT')
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
                    credentialsId: 'aws-cred'
                ]]) {
                    // Execute AWS CLI command to verify login
                    sh 'aws sts get-caller-identity'
                }
            }
        }

stage('pushing image to ecr'){
steps{
sh 'aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 060570890627.dkr.ecr.us-west-2.amazonaws.com
'
sh 'docker tag hw:latest 060570890627.dkr.ecr.us-west-2.amazonaws.com/reposm/hw:latest'
sh 'docker push 060570890627.dkr.ecr.us-west-2.amazonaws.com/reposm/hw:latest'
}
}
        
}

triggers {
// Trigger the pipeline when changes are pushed to the GitHub repository
githubPush()
}
}
