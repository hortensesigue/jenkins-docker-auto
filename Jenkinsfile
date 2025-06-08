pipeline {
    agent any
    environment {
        DOCKERHUB_REPO = 'hortensehouendji/jenkins-docker-auto'
        DOCKERHUB_CREDS     = credentials('DockerhubCreds-id')
    }

    stages {
        stage('Source') {
            steps {
                echo 'Chicking into github'
                git branch: 'main', credentialsId: 'GithubCreds-id', url: 'https://github.com/hortensesigue/jenkins-docker-auto.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Building the Docker Image'
                sh 'whoami'
                sh 'docker build -t ${DOCKERHUB_REPO}:v${BUILD_NUMBER} .'
                 sh 'docker images'
                
            }
        }
        stage('Docker login') {
            steps {
                sh 'docker login -u ${DOCKERHUB_CREDS_USR} -p ${DOCKERHUB_CREDS_PSW}'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Pushing the image to dockerhub'
                sh 'docker push ${DOCKERHUB_REPO}:v${BUILD_NUMBER}'
            }
        }
    }
}
