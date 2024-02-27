pipeline {
    agent any

    environment {
            DOCKER_CREDENTIALS = credentials("docker-secret")
            IMAGE_NAME = 'bpanigrahics/webapp-spring-boot'
            IMAGE_NAME_TEST = 'bpanigrahics/webapp-spring-boot:${BUILD_TIMESTAMP}'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Building Image') {
            steps {
                script {
                    sh 'echo ${IMAGE_NAME_TEST}'
                    sh 'docker login -u bpanigrahics -p ${DOCKER_CREDENTIALS}'
                    sh 'docker build -t bpanigrahics/webapp-spring-boot:${BUILD_TIMESTAMP} .'
                    sh 'docker push bpanigrahics/webapp-spring-boot:${BUILD_TIMESTAMP}'
                    sh 'docker image rm bpanigrahics/webapp-spring-boot:${BUILD_TIMESTAMP} -f'
                    sh 'kubectl apply -f service.yaml'
                    sh 'kubectl apply -f deployment.yaml'
                }
            }
        }
    }

    post {
        success {
            // Notifying success
            echo 'Build and installation succeeded!'
        }
        failure {
            // Notifying failure
            echo 'Build or installation failed!'
        }
    }
}