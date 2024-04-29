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
// Add more stages as needed
        stage('AWS Login') {
            steps {
                script {
                    withCredentials([aws(credentials: '637423225472', region: 'us-west-2')]) {
                        sh 'aws sts get-caller-identity'
                    }
                }
            }
        }
}

triggers {
// Trigger the pipeline when changes are pushed to the GitHub repository
githubPush()
}
}
