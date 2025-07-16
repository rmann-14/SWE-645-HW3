pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'rmann14'
        IMAGE_NAME = 'hw3-image'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/rmann-14/SWE-645-HW3.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKERHUB_USER}/${IMAGE_NAME}:${IMAGE_TAG}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-pass') {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Update Kubernetes Deployment') {
            steps {
                withCredentials([file(credentialsId: 'kubeconfig', variable: 'KUBECONFIG')]) {
                    sh """
                    kubectl create -f hw3-deployment.yaml
                    kubectl create -f hw3-service.yaml
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment Successful!'
        }
        failure {
            echo 'Deployment failed.'
        }
    }
}
