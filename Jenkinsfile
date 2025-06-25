pipeline {
    agent any

    stages {
        stage('Clone Code') {
            steps {
               git branch: 'main', url:'https://github.com/cc2024upup/swe645-hw2.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t chaochenid/survey-app:latest .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh 'docker push chaochenid/survey-app:latest'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f k8s-deployment.yaml'
            }
        }
    }
}
