pipeline {
agent any

environment {
GITHUB_TOKEN = credentials('GAT')
}

stages {
stage('Checkout') {
steps {
git credentialsId: 'GITHUB_TOKEN', url: 'https://github.com/urstrulyManoj1/jenkins/'
}
}
stage('Build'){
steps{
sh 'javac F.java'
}
}
stage('Run'){
steps{
sh 'java F'
}
}
// Add more stages as needed
}
triggers {
// Trigger the pipeline when changes are pushed to the GitHub repository
githubPush()
}
}
